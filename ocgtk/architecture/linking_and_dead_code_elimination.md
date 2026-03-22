# OCaml Linking and Dead Code Elimination

This document describes how OCaml's native linker handles dead code elimination,
and the implications for ocgtk's generated code.

## Background

OCaml native executables are linked in two phases:

1. **ocamlopt selects compilation units** from `.cmxa` archives based on
   transitive dependencies, generating a startup module that calls each
   selected unit's initializer.
2. **The system linker** (gcc/ld) links the selected `.o` files and the
   startup module into the final executable.

The granularity of elimination is the **compilation unit** (one `.ml` file = one
`.cmx`/`.o`). If a unit is not transitively referenced, it is excluded from the
startup module and the system linker will not pull it from the archive.

## What creates a reference

Not all cross-module definitions create linker-visible references. The key
distinction:

| Definition | Creates linker reference? | Why |
|---|---|---|
| `module M = Other` | No | Pure alias, erased by the compiler |
| `class type t = Other.t` | No | Type-only, erased at compile time |
| `class c = Other.c` | **Yes** | Generates runtime code to copy the class table; creates `U camlOther` in the `.o` |
| `let x = Other.f ()` | **Yes** | Runtime value dependency |
| `type t = Other.t` | No | Type alias, erased |
| `include Other` | **Yes** | Copies values at runtime |

The critical one for ocgtk is `class c = Other.c`. OCaml classes are not just
types -- they are **runtime values** containing method dispatch tables. A class
alias `class c = Other.c` compiles to code that reads the class table from the
other module, creating a hard symbol dependency that the system linker resolves
by pulling the referenced module from the archive.

## Verification

You can verify linking behavior with these tools:

```bash
# Check what a .cmx transitively depends on (implementation imports)
ocamlobjinfo module.cmx | grep -A100 'Implementations imported'

# Check what symbols a .o file references (U = undefined = external dep)
nm module.o | grep ' U '

# Check which modules' entry points are called in the startup
ocamlopt -dstartup ... 2>startup.s
grep 'caml.*entry' startup.s

# Count symbols from a specific library in the final binary
nm binary.exe | grep -c 'camlOcgtk_gtk'
```

## Impact on ocgtk

### Current state

The generated `Gtk.ml` contains ~626 lines like:

```ocaml
class button = GButton.button
class window = GWindow.window
(* ... every generated class ... *)
```

Each of these creates a runtime reference to the corresponding `G*.ml` module.
When any code does `open Ocgtk_gtk.Gtk`, the `Gtk` module is linked, which
transitively pulls in **every** generated class module -- even if only `button`
is used.

This means `counter.exe` (which uses only Button, Label, Box, and Window) links
all ~661 GTK class modules, resulting in a ~24MB binary.

### Why dune's module aliasing doesn't help

Dune's `(wrapped true)` generates a wrapper module (`ocgtk_gtk__.ml-gen`) with
pure module aliases:

```ocaml
module GButton = Ocgtk_gtk__GButton
module GWindow = Ocgtk_gtk__GWindow
(* ... *)
```

These are correctly erased by the compiler and do not force linking. The problem
is specifically in the hand-authored/generated `Gtk.ml` umbrella module which
uses `class` re-exports rather than `module` aliases.

### Potential solutions

1. **Remove class re-exports from Gtk.ml** -- users import from individual
   modules (e.g., `GButton.button`) rather than through the umbrella.

2. **Replace `class c = M.c` with `module` re-exports** -- e.g.,
   `module Button = GButton` which the compiler can erase.

3. **Keep `class type` re-exports only** -- these are type-level and don't
   create linker dependencies. Users would instantiate classes from the
   individual modules.

## References

- [Removing Unused Code in OCaml](https://www.chrisarmstrong.dev/posts/removing-unused-code-in-ocaml) --
  blog post covering module-level dead code elimination
- OCaml manual, Chapter 13: Native-code compilation
