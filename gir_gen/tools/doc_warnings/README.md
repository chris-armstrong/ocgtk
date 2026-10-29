# doc_warnings

Classifies the odoc warnings in the output of `dune build @doc`. The doc
preview workflow (`.github/workflows/doc-preview.yml`) runs it for the job
summary and the landing page; it runs the same way locally.

```bash
dune build @doc --cache=disabled 2>&1 | tee doc-build.log
dune exec gir_gen/tools/doc_warnings/doc_warnings.exe -- [--format FORMAT] doc-build.log
```

`FORMAT` is one of:

- `markdown` (default): a heading with the total, and a table with a row per
  bucket (empty ones included), whether the bucket is fixed at emission, and
  its first warning;
- `line`: the total and the non-empty buckets, e.g.
  `5 (own-line 2, unresolved-reference 3)`, or `0`;
- `count`: the total.

The log also carries dune's own messages and compiler warnings
(`Warning 50 [unexpected-docstring]`); only odoc's are counted. A warning is
odoc's when it is a `Warning: ` line straight after a `File "...", line ...,
characters ...:` header naming a `.ml`, `.mli` or `.mld` file.

## Buckets

| Bucket | odoc message, e.g. | Fixed at emission |
| --- | --- | --- |
| `own-line` | Paragraph should begin on its own line. | yes |
| `misplaced-tag` | '@since' is not allowed in '{b ...}' (boldface text). | yes |
| `not-allowed` | 'text' is not allowed in '{ul ...}' (bulleted list). | no |
| `empty-markup` | '{b ...}' (boldface text) should not be empty. | no |
| `unpaired` | Unpaired '}' (end of markup). | no |
| `bad-markup` | Unknown tag '@foo'. | no |
| `unresolved-reference` | Failed to resolve reference ... | no |
| `other` | anything else | no |

"Fixed at emission" buckets are ones the generator avoids when it writes doc
comments (`Doc_emit`, `Doc_render`), so their count should be zero; a
non-zero count is a generator bug. The others are reported as they are. The
patterns match odoc 3's wording; a new odoc that rewords a message moves it
to `other`.

## Getting every warning

Build with `--cache=disabled` and from a clean build directory. dune
replays no warnings for rules restored from its cache, nor for rules already
up to date in `_build`, so an incremental build under-counts. For a full
local count, build into a fresh directory:

```bash
dune build @doc --cache=disabled --build-dir=/tmp/doc-build > doc-build.log 2>&1
```
