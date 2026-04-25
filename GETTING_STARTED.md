
Next steps:
  1. Edit .context/TASKS.md to add your current tasks
  2. Run 'ctx status' to see context summary
  3. Run 'ctx agent' to get AI-ready context packet

Claude Code users: install the ctx plugin for hooks & skills:
  /plugin marketplace add ActiveMemory/ctx
  /plugin install ctx@activememory-ctx

Note: local plugin installs are not auto-enabled globally.
Run 'ctx init' again after installing the plugin to enable it,
or manually add to ~/.claude/settings.json:
  {"enabledPlugins": {"ctx@activememory-ctx": true}}

Companion tools (highly recommended):
  Set up Gemini Search and GitNexus MCP servers for grounded
  web search and code intelligence. Skills degrade gracefully
  without them, but work noticeably better with them connected.
  See: https://ctx.ist/recipes/multi-tool-setup/#companion-tools

Workflow tips:

  Every session:
    /ctx-remember             Recall context and pick up where you left off
    /ctx-wrap-up              Capture learnings, decisions, and tasks before ending

  During work:
    /ctx-status               Check context health, token usage, and file summary
    /ctx-next                 Analyze tasks and suggest 1-3 concrete next actions
    /ctx-commit               Commit code, then prompt for decisions worth persisting

  Planning and design:
    /ctx-brainstorm           Structured design dialogue before implementation
    /ctx-spec                 Scaffold a feature spec from the project template
    /ctx-implement            Execute a plan step-by-step with checkpointed verification

  Periodic maintenance:
    /ctx-architecture         Build and refresh ARCHITECTURE.md and DETAILED_DESIGN.md
    /ctx-consolidate          Merge overlapping entries in DECISIONS.md and LEARNINGS.md
    /ctx-drift                Detect stale paths, broken references, and outdated context

Have a question, bug, or feature request? Join us on Discord:
  https://ctx.ist/discord

  Journal pipeline (every few sessions):
    ctx journal import --all   Import session transcripts to .context/journal/
    /ctx-journal-enrich-all   Add frontmatter, tags, and summaries to imported entries

  Run 'ctx guide' for the full command reference.
