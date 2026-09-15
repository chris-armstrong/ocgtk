/**
 * agent-guards — two safety nets against degenerate agent runs:
 *
 * 1. Frustration detector: watches tool results for (a) a streak of
 *    consecutive failures with no success in between, and (b) a cluster of
 *    near-identical repeated bash commands — the "60 calls bisecting a ppx"
 *    signature. On trigger it injects a steering message telling the agent
 *    to stop, summarize, and either switch approach or finish with a
 *    handoff report. One steer per wall; a second trigger escalates to a
 *    final "produce the handoff report now" notice; after that it stays
 *    quiet (notify-only) so it can never loop the agent.
 *
 * 2. Context budget guard: on each turn start, checks real context usage.
 *    At WARN_FRACTION of the model's window it injects a wrap-up-now
 *    steer (the handoff protocol lives in the implementer brief); at
 *    ABORT_FRACTION it aborts the run so the session ends with its last
 *    message instead of limping into degraded generation.
 *
 * Loads in the main session and in pi-subagents subagent sessions
 * (custom .pi/agents default to `extensions: true`), so implementation
 * subagents are covered too. State is per-session: the factory closure
 * re-runs for every session binding and counters reset on session_start /
 * agent_settled.
 *
 * No interactive-TUI assumptions — safe under pi-web (RPC mode): every
 * ctx.ui call is guarded by ctx.hasUI, and json/print modes simply get no
 * notifications while the steering messages still flow.
 */

import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";

const GUARD_TYPE = "agent-guards";

/** Tunables. Thresholds mirror the stop rule in .pi/agents/implementer.md
 * (~8 consecutive calls / 3 failed fix attempts on one problem). */
const CONFIG = {
  // Frustration detector
  consecutiveFailureThreshold: 4, // failed tool results in a row, any tool
  commandRepeatThreshold: 4, // near-identical bash commands within window
  commandWindow: 15, // rolling window of recent bash commands to cluster
  maxInterventionsPerRun: 2, // steer messages per agent run, then notify-only

  // Context budget guard (fractions of the active model's context window;
  // for a 200K window this is warn ~150K / abort ~190K)
  warnFraction: 0.75,
  abortFraction: 0.95,
} as const;

// ---- shared helpers (stateless; session state lives in the factory closure) ----

function notify(ctx: ExtensionContext, text: string): void {
  if (ctx.hasUI) {
    ctx.ui.notify(`[${GUARD_TYPE}] ${text}`, "warning");
  }
}

function steer(pi: ExtensionAPI, text: string, escalate: boolean): void {
  pi.sendMessage(
    { customType: GUARD_TYPE, content: text, display: true },
    // First notice rides the current turn ("steer"); the escalation lands
    // only once tools settle ("followUp") so it reads as the final word.
    { deliverAs: escalate ? "followUp" : "steer", triggerTurn: true },
  );
}

/** Normalize a shell command for similarity comparison. */
function normalizeCommand(cmd: string): string {
  return cmd.replace(/\s+/g, " ").trim();
}

/** Levenshtein distance with two swapped rows (arrays have no .set). */
function levenshtein(a: string, b: string): number {
  let prev = new Array<number>(b.length + 1);
  let cur = new Array<number>(b.length + 1);
  for (let j = 0; j <= b.length; j++) prev[j] = j;
  for (let i = 1; i <= a.length; i++) {
    cur[0] = i;
    for (let j = 1; j <= b.length; j++) {
      const cost = a.charCodeAt(i - 1) === b.charCodeAt(j - 1) ? 0 : 1;
      cur[j] = Math.min(prev[j] + 1, cur[j - 1] + 1, prev[j - 1] + cost);
    }
    const swap = prev;
    prev = cur;
    cur = swap;
  }
  return prev[b.length];
}

/** Near-identical = exact after normalization, or small edit distance
 * relative to length (catches "ocamlc -i foo.ml" vs "ocamlc -i foo2.ml"). */
function nearIdentical(a: string, b: string): boolean {
  if (a === b) return true;
  if (Math.abs(a.length - b.length) > 16) return false;
  const bound = Math.max(3, Math.floor(Math.min(a.length, b.length, 300) * 0.1));
  return levenshtein(a.slice(0, 300), b.slice(0, 300)) <= bound;
}

const WALL_TEXT = [
  "You have hit the same wall repeatedly (consecutive failed tool calls or near-identical repeated commands).",
  "Per the stop rule: STOP retrying this approach.",
  "Record the failing state, what you already tried, and a minimal reproducer, then either",
  "switch to a fundamentally different approach or finish now with a handoff report",
  "(exact file state, remaining acceptance gates, next concrete actions, known failures with reproducers).",
  "Brute-forcing third-party ppx or library behavior is not the job — there is usually a one-command way to look the answer up.",
].join(" ");

const ESCALATION_TEXT = [
  "Final notice: produce the handoff report now and finish this run.",
  "Do not start further retries; the parent will spawn a fresh agent from your report.",
].join(" ");

function budgetWarnText(frac: number): string {
  const pct = Math.round(frac * 100);
  return [
    `Context usage is at ~${pct}% of this model's window.`,
    "Wrap up now: produce the handoff report described in your brief",
    "(exact file state, remaining acceptance gates, next concrete actions, known failures with reproducers)",
    "and finish this run. Do not start new work.",
  ].join(" ");
}

// ---- extension body ----

export default function agentGuards(pi: ExtensionAPI): void {
  // Per-session state (see header): re-created for every session binding.
  let consecutiveFailures = 0;
  const recentCommands: string[] = [];
  let interventions = 0;
  let budgetWarned = false;
  let budgetAborted = false;

  pi.on("session_start", () => {
    consecutiveFailures = 0;
    recentCommands.length = 0;
    interventions = 0;
    budgetWarned = false;
    budgetAborted = false;
  });

  pi.on("agent_settled", () => {
    // New user prompt / fresh subagent run: re-arm everything.
    consecutiveFailures = 0;
    recentCommands.length = 0;
    interventions = 0;
    budgetWarned = false;
    budgetAborted = false;
  });

  pi.on("tool_result", (event, ctx) => {
    const input = event.input as { command?: unknown };
    if (event.toolName === "bash" && typeof input.command === "string") {
      recentCommands.push(normalizeCommand(input.command));
      if (recentCommands.length > CONFIG.commandWindow) {
        recentCommands.shift();
      }
    }

    if (event.isError) {
      consecutiveFailures++;
    } else {
      consecutiveFailures = 0;
    }

    const failureWall = consecutiveFailures >= CONFIG.consecutiveFailureThreshold;
    const last = recentCommands[recentCommands.length - 1];
    const repeatWall =
      last !== undefined &&
      recentCommands.filter((c) => nearIdentical(c, last)).length >=
        CONFIG.commandRepeatThreshold;
    if (!failureWall && !repeatWall) return;

    // Fire: reset counters so the same wall cannot re-trigger per tool call.
    consecutiveFailures = 0;
    recentCommands.length = 0;
    interventions++;

    const reason = failureWall
      ? `${CONFIG.consecutiveFailureThreshold} consecutive failed tool calls`
      : `${CONFIG.commandRepeatThreshold} near-identical bash commands`;
    pi.appendEntry(GUARD_TYPE, {
      kind: "frustration",
      reason,
      intervention: interventions,
    });

    if (interventions > CONFIG.maxInterventionsPerRun) {
      notify(ctx, `frustration again (${reason}); staying quiet to avoid loops`);
      return;
    }

    const escalate = interventions > 1;
    const text = escalate ? ESCALATION_TEXT : WALL_TEXT;
    steer(pi, text, escalate);
    notify(ctx, `frustration detected (${reason}); steering message injected`);

    // Belt-and-braces: pin the warning to this tool result so it is
    // unmissable in the LLM's context even if the steering message is missed.
    const content = [...event.content, { type: "text", text: `\n[${GUARD_TYPE}] ${text}` }];
    return { content };
  });

  pi.on("turn_start", (_event, ctx) => {
    const usage = ctx.getContextUsage();
    const tokens = usage?.tokens;
    if (usage === undefined || tokens === null || tokens === undefined) return;
    const frac = tokens / usage.contextWindow;

    if (frac >= CONFIG.abortFraction) {
      if (budgetAborted) return;
      budgetAborted = true;
      pi.appendEntry(GUARD_TYPE, {
        kind: "budget-abort",
        tokens,
        contextWindow: usage.contextWindow,
      });
      notify(ctx, `aborting run at ~${Math.round(frac * 100)}% of context window`);
      ctx.abort();
      return;
    }

    if (frac >= CONFIG.warnFraction && !budgetWarned) {
      budgetWarned = true;
      pi.appendEntry(GUARD_TYPE, {
        kind: "budget-warn",
        tokens,
        contextWindow: usage.contextWindow,
      });
      steer(pi, budgetWarnText(frac), false);
      notify(ctx, `context at ~${Math.round(frac * 100)}% of window; wrap-up steer injected`);
    }
  });
}