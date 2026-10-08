#!/bin/bash
# Write a landing index.html at the root of a rendered odoc HTML tree.
# Usage: ./scripts/doc-preview-landing.sh HTML_DIR
#
# Replaces the index.html that `dune build @doc` writes at HTML_DIR with a
# page that links each package's odoc root and records where the build came
# from. Used by .github/workflows/doc-preview.yml; runs locally too.
#
# A package root is any subdirectory of HTML_DIR holding an index.html
# (odoc.support is skipped). odoc cannot link across package page trees, so
# this plain HTML page is the one place that links them all.
#
# Optional environment variables (all shown as-is, HTML-escaped):
#   DOC_PREVIEW_TITLE     Heading text. Default: "ocgtk documentation preview"
#   DOC_PREVIEW_REF       What was built, e.g. "PR #193 (m3-p4)" or "main"
#   DOC_PREVIEW_SHA       Commit SHA that was built
#   DOC_PREVIEW_SHA_URL   Link target for the SHA (e.g. the GitHub commit page)
#   DOC_PREVIEW_WARNINGS  Count of odoc warnings from the build

set -euo pipefail

if [ $# -ne 1 ] || [ ! -d "$1" ]; then
    echo "usage: $0 HTML_DIR" >&2
    exit 2
fi
HTML_DIR="$1"

# bash >= 5.2 expands '&' in a ${s//pat/rep} replacement to the matched
# text; html_escape needs it literal.
shopt -u patsub_replacement 2>/dev/null || true

html_escape() {
    local s="$1"
    s="${s//&/&amp;}"
    s="${s//</&lt;}"
    s="${s//>/&gt;}"
    s="${s//\"/&quot;}"
    s="${s//\'/&#39;}"
    printf '%s' "$s"
}

TITLE="$(html_escape "${DOC_PREVIEW_TITLE:-ocgtk documentation preview}")"
REF="$(html_escape "${DOC_PREVIEW_REF:-}")"
SHA="$(html_escape "${DOC_PREVIEW_SHA:-}")"
SHA_URL="$(html_escape "${DOC_PREVIEW_SHA_URL:-}")"
WARNINGS="$(html_escape "${DOC_PREVIEW_WARNINGS:-}")"
BUILT="$(date -u '+%Y-%m-%d %H:%M UTC')"

packages=()
for dir in "$HTML_DIR"/*/; do
    name="$(basename "$dir")"
    [ "$name" = "odoc.support" ] && continue
    [ -f "$dir/index.html" ] && packages+=("$name")
done

if [ ${#packages[@]} -eq 0 ]; then
    echo "error: no package roots (*/index.html) under $HTML_DIR" >&2
    exit 1
fi

{
    cat <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>${TITLE}</title>
    <link rel="stylesheet" href="./odoc.support/odoc.css"/>
  </head>
  <body>
    <main class="content">
      <h1>${TITLE}</h1>
      <h2>Packages</h2>
      <ul>
EOF
    for p in "${packages[@]}"; do
        pe="$(html_escape "$p")"
        printf '        <li><a href="%s/index.html">%s</a></li>\n' "$pe" "$pe"
    done
    cat <<EOF
      </ul>
      <h2>Build</h2>
      <ul>
EOF
    [ -n "$REF" ] && printf '        <li>Ref: %s</li>\n' "$REF"
    if [ -n "$SHA" ] && [ -n "$SHA_URL" ]; then
        printf '        <li>Commit: <a href="%s"><code>%s</code></a></li>\n' "$SHA_URL" "$SHA"
    elif [ -n "$SHA" ]; then
        printf '        <li>Commit: <code>%s</code></li>\n' "$SHA"
    fi
    [ -n "$WARNINGS" ] && printf '        <li>odoc warnings: %s</li>\n' "$WARNINGS"
    printf '        <li>Built: %s</li>\n' "$BUILT"
    cat <<EOF
      </ul>
    </main>
  </body>
</html>
EOF
} > "$HTML_DIR/index.html"

echo "Wrote $HTML_DIR/index.html (${#packages[@]} packages: ${packages[*]})"
