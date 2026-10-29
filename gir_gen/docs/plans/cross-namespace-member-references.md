# Cross-namespace member references in generated docs

**Status: Phase 1 done (2026-10-29); Phases 2 and 3 not started.** Branch
`cross-ns-member-refs`. Follows the odoc leg
([m3-odoc-emission-and-artifacts](m3-odoc-emission-and-artifacts.md)), whose
decision 11 links members only within the doc's own namespace, and lists
"cross-namespace member references" as out of scope.

## Purpose

A Gtk doc that names a Gdk, Gio, Gsk or Pango member renders it as code.
Examples are `[method@Gdk.Surface.beep]`, `gdk_surface_beep()`,
`%PANGO_WRAP_WORD_CHAR` and `[signal@Gio.ListModel::items-changed]`. Types and
constants of those namespaces already link, because the references files list
them. Members don't, because only the namespace being generated knows which of
its members were emitted and under what names. Decision 11 forbids linking a
member that might not exist: a broken `{!…}` is an odoc warning.

This plan puts each namespace's emitted members in its references file, the
same way the file already lists its emitted types and constants. A
cross-namespace member link is then checked against what the target namespace
actually emitted, by the same `Emitted_members` code that drives its
emitters. Decision 11 still holds; the index just gets bigger.

References into namespaces that are not generated (GLib, GObject), and to
kinds that are never generated (functions, callbacks, error domains), stay
code. Nothing generated could confirm their targets.

## Size (bundled GIR, after the odoc leg's Phase 14)

- **Member fragments of another namespace** (`member-in-other-namespace` in
  the summary): 100 occurrences. 95 are in Gtk (method 74, signal 11,
  property 7, enum 2, ctor 1) and 5 in Gsk.
- **C symbols of a dependency in Gtk docs**: 21 distinct names that are
  `unknown-target` today. Most are `%` enum members of Gdk and Pango
  (`%GDK_TOUCH_BEGIN`, `%PANGO_WRAP_CHAR`); a few are C calls
  (`gdk_surface_beep()`, `g_list_model_get_item()`). These need the C-symbol
  tables, not just the member tables.

The gain is modest: about 100 member links plus the C symbols. The table work
is also what a later "Returned by" list or a per-package symbol index would
need.

## What exists

- **References files** (`<ns>-references.sexp`, written by
  `gir_gen references`, read by `generate -r`). Each lists entities
  (`cr_name`, `cr_type`, `cr_c_type`) filtered by the generator's own
  predicates. The odoc leg's Phase 11 made it list only constants the
  generator emits.
- **`Emitted_members.names ~ctx entity`** gives an entity's members at each
  layer under their OCaml names, plus each property's accessor. The emitters
  take their member lists from the same module, so the two can't disagree
  (the odoc leg's Phase 12).
- **`Doc_index`** already has the per-namespace fields: `di_members`,
  `di_enum_members` and `di_c_symbols`. Today they are filled for the current
  namespace only. `of_cross_references` fills `di_types`, `di_constants`,
  `di_c_types` and `di_c_constants` for the others.
- **`Doc_resolve`** builds member paths from the namespace already:
  `Module_paths.cross_ns_layer2_module` for L2 and `Oc<ns>.Raw.<Mod>` for L1.
  Phase 11 uses the same routes for cross-namespace types. The only thing
  that keeps members local is `in_current_namespace`.

## The constraint: the references step runs blind

`scripts/generate-bindings.sh` writes every references file first (step 1),
without passing any dependency references, then generates each namespace in
dependency order (step 2). The `references` command parses the GIR, applies
overrides and filters types. It never builds a generation context.

Deciding what an entity emits needs that context. A method is skipped when a
parameter type has no mapping, and a type from another namespace is mapped
only through that namespace's references file. So Gtk's emitted members
depend on Gdk's references. The references step for a namespace must
therefore:

1. run after its dependencies' references files exist (dependency order, the
   same `DEPS` table step 2 uses), and
2. build the same generation context `generate` builds: same parse, same
   overrides, same dependency references, then
   `build_generation_context`.

If the two contexts differ, a references file could list a member the
generator skipped, which is exactly the broken link decision 11 rules out.
Building both contexts with one shared function is what makes the tables
trustworthy.

## Phases

### Phase 1 — One way to load a namespace; references read their dependencies

*Changes:*
1. Move the shared front half of `generate_bindings` and
   `generate_references` out of `bin/gir_gen.ml` into one function: parse the
   GIR, apply overrides, load reference files, `build_generation_context`. It
   returns the context and the generated entities. Today both commands repeat
   the parse and the override step, and only `generate` loads references.
2. `references` accepts `-r` like `generate`, and builds its entity list from
   the shared context. The output stays the same in this phase.
3. Step 1 of `scripts/generate-bindings.sh` passes each namespace's dependency
   references, in the existing dependency order. The corpus rules in
   `gir_gen/test/corpus/dune` gain the same dependencies (for example,
   `gdk-references.sexp` depends on the cairo, pango, pangocairo, gdkpixbuf
   and gio files).

*Acceptance:* every references file is byte-identical to before; the
regeneration diff is empty; tests pass.

*Done.* The shared loader is `Namespace_loader` (`lib/namespace_loader.ml`):
`load` parses, applies overrides, reads the references files and builds the
context, returning load failures as a `Result` instead of exiting.
`generate` and `references` both call it; `generate`'s back half is
`generate_namespace`. The signal corpus uses
`Namespace_loader.load_reference_files` instead of its copy, but keeps its
own minimal context, since its baseline was recorded without overrides. All
nine references files came out byte-identical with and without `-r`, and the
regeneration diff was empty.

Loading a namespace logs every skipped member to stderr (`Exclude_list`), so
the `references` command is now as noisy as `generate`. The corpus rules send
both of its output streams to `%{null}`.

### Phase 2 — Member tables in the references files

*Changes:*
1. **Types.** Extend `cross_reference_entity` with optional, sexp-defaulted
   fields, so a file without them still loads:
   - classes, interfaces and records: the L1 and L2 member names
     (`Emitted_members.names`, as association lists, since sexp has no
     `StringMap`), and their methods and constructors by C identifier;
   - enums and bitfields: each member's GIR name and C identifier. The
     variant tag comes from `Enum_code.variant_name_of_member`, which every
     namespace shares.
2. **Writer.** `references` fills them from the shared context, with the same
   code `Doc_index.with_members` and `Doc_index.current_namespace` use for the
   current namespace. Factor that code out rather than copy it.
3. **Reader.** `Doc_index.of_cross_references` fills `di_members`,
   `di_enum_members` and `di_c_symbols` from the new fields.
   `Doc_index.with_members` keeps computing the current namespace's own
   tables.
4. **Consistency test.** For each corpus references file, load the namespace
   with its dependencies through the shared loader, compute the tables
   directly, and compare them with what the file says. This is the check that
   the references step and `generate` agree.

*Acceptance:* the regeneration diff is empty (the resolver doesn't use the
new tables yet); the references files' sizes, before and after, are
recorded; tests pass.

### Phase 3 — The resolver links members of other namespaces

*Changes:*
1. `resolve_member` and `resolve_enum_member` drop `in_current_namespace` and
   look the type up in the target namespace's tables.
2. `resolve_c_symbol` searches every namespace, current first, as
   `find_by_c_name` already does for C types and constants. C identifiers are
   unique across the linked libraries. `g_*` names are ambiguous only between
   Gio (generated, so in the tables) and GLib/GObject (not generated, so
   absent).
3. `%ENUM_MEMBER` looks in every namespace, after constants.
4. `Member_in_other_namespace` becomes `Members_not_listed`: the namespace is
   indexed, but its references file has no member tables (an older file).
   With all files regenerated it should never occur; keep it so a stale file
   degrades to code instead of failing.
5. Update decision 11's wording in the odoc plan, the `Doc_resolve` and
   `Doc_index` interface docs, and the out-of-scope entry.

*Tests:* `doc_resolve_tests` with a Gdk references fixture carrying member
tables: a method, signal, property, constructor, and enum and flags member of
Gdk, from both layers of a Gtk doc; a Gdk member that Gdk doesn't emit at
that layer (code); a Gdk C call and `%` enum member; a namespace whose file
has no tables (`Members_not_listed`).

*Acceptance:* `dune build @doc` with 0 odoc warnings; the summary's
`member-in-other-namespace` count goes to 0, and about 100 more references
link; `doc_diff` against the base shows only code spans becoming links. In
the preview, `[method@Gdk.FrameClock.get_frame_time]` in a Gtk doc links to
`Ocgdk/Frame_clock/class-type-frame_clock_t/#method-get_frame_time` from L2
docs and `Ocgdk_raw/Frame_clock/#val-get_frame_time` from L1 docs.

*Risk:* a member of a class in another namespace's cyclic group is reached
through that class's own module re-export (`[method@Gdk.Surface.beep]`:
`Surface` is in Gdk's `AppLaunchContext` cycle). The odoc leg's Phase 12 probe
showed this resolves inside a package; the 0-warning build is the check
across packages.

## Notes

- **The member tables go in the references files**, not in a separate file:
  there is one mechanism for what a namespace generates. The Gtk file grows
  the most (its GIR has 3,314 methods, listed at two layers); Phase 2 records
  the sizes.
- **Parallel references builds.** Step 1 becomes sequential in dependency
  order, as step 2 already is. The corpus dune rules get the same
  dependencies, so dune still runs independent branches in parallel.

## Out of scope

- Upstream gi-docgen links for references into namespaces that are not
  generated (GLib, GObject) and to kinds that are never generated (functions,
  callbacks, error domains, aliases, vfuncs). They stay code.
