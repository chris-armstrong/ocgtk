#!/usr/bin/env bash
# Port .opencode/agents/*-reviewer.txt to pi project agents (.pi/agents/*.md).
# Transformation: mandatory report-only (drop fix mode), pi tool naming,
# YAML frontmatter. Usage: port-reviewers.sh <srcfile.txt> <name> <description>
set -euo pipefail

src=$1; name=$2; desc=$3
dst=".pi/agents/${name}.md"

{
  printf -- '---\nname: %s\ndescription: %s\n---\n\n' "$name" "$desc"
  sed -E \
    -e 's/You only apply fixes when explicitly instructed\./You are strictly report-only: you never edit files and never apply fixes./' \
    -e '/^## Default Mode: Report Only$/,+2d' \
    -e '/If instructed to apply fixes/d' \
    -e 's/^4\. \*\*Report\*\*/3. **Report**/' \
    -e 's/Only report or fix violations of the/Only report violations of the/' \
    -e '/^- When applying fixes: /d' \
    -e 's/^- If a fix requires broader context you do not have, skip it and flag it\.$/- If a violation needs broader context than you have, flag it in the report rather than guessing./' \
    -e '/^\*\*Fix mode\*\*/,/^If no violations/{/^If no violations/!d}' \
    -e 's/Read tool/read tool/g' \
    -e 's/^\*\*Report-only mode:\*\*$/Report-only mode (the only mode):/' \
    "$src"
} > "$dst"

# sanity: fix-mode remnants must be gone
if grep -n -i 'If instructed to apply\|Fix mode\|Violations Fixed\|says \"apply' "$dst"; then
  echo "ERROR: fix-mode remnants in $dst" >&2; exit 1
fi
echo "wrote $dst"