# doc_diff

Shows what a change does to the rendered docs: runs `diff -r` between the
odoc HTML of a base commit and that of the working tree. Run it from anywhere
in the repository.

```bash
dune exec gir_gen/tools/doc_diff/doc_diff.exe -- [--brief] [BASE]
```

`BASE` is anything git resolves to a commit; it defaults to `origin/m3`.
`--brief` only names the files that differ. The exit code is `diff`'s: 0 when
the trees are identical, 1 when they differ, 2 on failure.

The base is checked out with `git worktree add` into a new temporary
directory and built there with `dune build @doc`. The working tree is built
into a fresh build directory inside that worktree, not its own `_build`,
which keeps the HTML of modules that no longer exist. The two builds run in
parallel, and `git worktree remove` deletes both afterwards.

Both trees are compared in dune's `default` build context, the only one the
repository defines; the HTML is read from `<build-dir>/default/_doc/_html`. A
workspace that adds other contexts must still compare docs in `default`, or
change `build_context` in `doc_diff.ml`.

Neither tree is regenerated: committed bindings
match the generator's output, and in the working tree run
`scripts/generate-bindings.sh` first if the generator changed. Dune's shared
cache keeps the two builds cheap: a run takes about 30 s.

Build output goes to stderr and the diff to stdout, so
`doc_diff --brief > changed.txt` keeps just the list.
