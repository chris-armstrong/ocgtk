# Varargs Constructor / Method Bindings — Analysis & Parked Plan

**Status: PARKED — analysis only, no implementation**
**Created: 2026-05-02**
**Trigger:** PR #127 follow-up: `Alert_dialog.get_buttons` could not be tested directly because `gtk_alert_dialog_new` is varargs and was therefore skipped by the generator. Investigation widened into "is it worth supporting varargs at all?"

## TL;DR

After surveying the varargs landscape across the 9 bound namespaces and accounting for the non-varargs counterparts that GTK/Gio already provide, the answer is **probably not worth a generic mechanism, but a small per-class registration improvement is worth it on its own merits**.

## Problem statement

The GIR generator skips every entity marked `introspectable="0"`. Varargs functions all carry that mark because the variadic args have no machine-readable type information. This leaves a handful of widely-used constructors unbound (notably `gtk_alert_dialog_new`, `gtk_message_dialog_new`, `gtk_about_dialog_new`).

A naive workaround using `g_object_new(g_type_from_name "GtkAlertDialog", NULL)` fails: `g_type_from_name` only finds types that have already been registered, and GTK types register lazily inside their per-class `<x>_get_type()` function. Nothing in the current binding triggers that registration for varargs-only-constructed classes.

## Survey of varargs entries

53 entries total across `gir/Gtk-4.0.gir`, `gir/Gio-2.0.gir`, `gir/Gdk-4.0.gir`, `gir/Pango-1.0.gir`, `gir/GdkPixbuf-2.0.gir`, `gir/Gsk-4.0.gir` (after filtering out `<function-macro>` type-cast macros). They group into seven shapes:

| # | Pattern | Examples | Status |
|---|---|---|---|
| **A** | printf format string | `gtk_alert_dialog_new`, `gtk_message_dialog_new`, `g_print`, `g_printerr`, `g_dbus_method_invocation_return_error` | Most have `_literal` counterparts or no use case; the two GTK constructors collapse into category B |
| **B** | GObject property pairs `(prop, val, ..., NULL)` | `gtk_about_dialog_new`, `gtk_show_about_dialog`, `gtk_app_chooser_dialog_new`, `gtk_alert_dialog_new`, `gtk_message_dialog_new` | **Real gap** — needs per-class `_get_type` and either a generic `g_object_new` binding or a per-class `create` helper |
| **C** | Typed value pairs `(GType, val, ...)` | `gtk_list_store_new`, `gtk_list_store_set`, `gtk_list_store_insert_with_values`, `gtk_tree_store_*`, `gdk_content_provider_new_typed` | **Already covered** — every one has a `_v` counterpart in the GIR (`_newv`, `_set_valuesv`, `_insert_with_valuesv`) |
| **D** | Name/value attribute string pairs | `gdk_pixbuf_save`, `gtk_application_add_callback_symbols` | `gdk_pixbuf_savev` exists; `add_callback_symbols` is framework-internal and can stay skipped |
| **E** | GVariant format string | `gtk_widget_activate_action`, `g_settings_set/get`, `g_action_*_set_action_and_target` | **Already covered** — `*_variant`, `*_value`, `g_action_group_activate_action` all exist |
| **F** | argv-style string lists | `gtk_test_init`, `g_subprocess_launcher_spawn` | `g_subprocess_launcher_spawnv` exists; `gtk_test_init` is framework-internal and can stay skipped |
| **G** | Genuinely intractable / framework-internal | `gtk_widget_class_add_binding`, `gtk_dialog_add_buttons`, class-init helpers | Stay skipped permanently; not called from binding-user code |

Counterparts verified present in the GIRs (spot-checked 2026-05-02): `gtk_list_store_newv`, `gtk_list_store_set_valuesv`, `gtk_list_store_insert_with_valuesv`, `gtk_tree_store_newv`, `gdk_pixbuf_savev`, `g_subprocess_launcher_spawnv`, `gtk_widget_activate_action_variant`, `g_action_map_add_action_entries`, `g_settings_get_value`, `g_settings_set_value`, `g_action_group_activate_action`, `g_dbus_method_invocation_return_error_literal`. Only `gtk_application_add_callback_symbols` (singular) is missing a counterpart — and that's class-init code.

## What's actually missing once C/D/E/F/G are accounted for

Five entries — all category B:

- `gtk_alert_dialog_new(fmt, ...)` → equivalent: `g_object_new(GTK_TYPE_ALERT_DIALOG, NULL)` + `gtk_alert_dialog_set_message`
- `gtk_message_dialog_new(parent, flags, type, buttons, fmt, ...)` → equivalent: `g_object_new + set_message + set_message_type + set_buttons + set_modal/transient`
- `gtk_about_dialog_new()` → no varargs args; but the type still isn't registered
- `gtk_show_about_dialog(parent, prop, val, ..., NULL)` → bare `g_object_new` of an `AboutDialog` + setters + `present`
- `gtk_app_chooser_dialog_new(parent, flags, gfile)` → constructor takes a `GFile`, mostly non-varargs; classified as varargs by GIR because the trailing args are property pairs

All of them reduce to "construct via `g_object_new`, then chain the existing introspected setter methods." The setters are already bound. The blocker is purely **type registration**.

## Two prerequisites and a separable optional layer

### Prerequisite 1 — per-class `get_type` external (worth it on its own)

Generator change: for every introspected class, emit

```ocaml
external get_type : unit -> Gobject.g_type = "ml_<ns>_<class>_get_type"
```

next to the existing methods, with a one-line C stub that calls the underlying `<ns>_<class>_get_type()` function.

**Costs:**
- Additional generated symbol per class (~370 across all bound namespaces).
- One extra C stub file lookup per class in the wrapper — negligible.
- No changes to generated user-facing types or method signatures.

**Benefits beyond varargs:**
- Lets callers use `g_object_new` to construct any GObject type without a varargs binding.
- Lets callers pass class GTypes to `g_signal_new`, `g_value_init`, `gtk_type_module_register_type`, etc. in a typed way without `g_type_from_name` string lookup.
- Lets reflection-style code (e.g. signal marshalling, future GObject-property accessors) use type identity instead of string compare.
- Makes `g_type_ensure` no longer necessary as a separate concern — calling `Foo.get_type ()` is the registration trigger.

This is small, mechanical, useful well beyond the immediate motivation, and **should probably happen regardless** of whether varargs ever gets a story.

### Prerequisite 2 — `Gobject.Object.create` (or equivalent)

A single common-runtime function:

```ocaml
val Gobject.Object.create : Gobject.g_type -> 'a obj
```

backed by the existing `ml_g_object_new` C helper. Currently `ml_g_object_new` exists in the C source but isn't bound in `gobject.mli`. Adding it is a one-line change.

Combined with Prerequisite 1, this is sufficient to construct any class manually:

```ocaml
let dialog : Alert_dialog.t =
  let d = Gobject.Object.create (Alert_dialog.get_type ()) |> Obj.magic in
  Wrappers.Alert_dialog.set_message d "Are you sure?";
  Wrappers.Alert_dialog.set_buttons d [| "Cancel"; "OK" |];
  d
```

That `Obj.magic` is the wart — `Gobject.Object.create` returns `'a obj` and you'd need a per-class smart cast. Either resolved by:
- Returning `'a obj` and letting the generated module expose a `unsafe_cast` that's already safe (we just constructed it for the right type), or
- Generating a per-class `create_empty : unit -> t` that internally calls `g_object_new (get_type ())` and casts, eliminating the magic at the call site.

The per-class `create_empty` is essentially "all the value of a varargs-constructor binding without any of the typing complexity." It costs one more line of generated OCaml per class and removes the cast.

### Optional layer — `(provide-binding ...)` override directive

If we go further and want `Alert_dialog.create ~message ?detail ?modal ()` as a single binding rather than `create_empty + setters`, that's the override directive I sketched earlier:

```scheme
(provide-binding
  (target gtk_alert_dialog_new)
  (mechanism props_constructor)
  (props ((message string) (detail string option) (modal bool option)))
  (emit-as Alert_dialog.create))
```

**Cost:** new override-file directive type, parser, applier, per-mechanism emitter. Maybe a stage of work in the existing override pipeline (~3 days?). Maintained per-class as new varargs constructors appear upstream.

**Benefit:** five idiomatic OCaml binding signatures (one per category-B class) with named optional args. Marginally nicer than `create_empty + setters` at the call site. **Not obviously worth the override-system complexity.**

## Recommendation

**Do prerequisites 1 and 2. Don't build the override mechanism.**

- The per-class `get_type` external is small, fully orthogonal, and unlocks more than just varargs constructors.
- A common `Gobject.Object.create` is a one-line gap fill.
- A per-class `create_empty : unit -> t` is one extra line of generated OCaml per class.

Together these cover **all five** category-B varargs constructors with idiomatic OCaml, without introducing a new override directive or a new generator code path beyond the trivial `get_type` emitter. Callers write `let d = Alert_dialog.create_empty () in set_message d "..."; ...` — three lines instead of one for a binding-user, but every one of those three lines is already in the generator's vocabulary.

If we ever discover that 20+ category-B varargs constructors land upstream and the call-site verbosity becomes noticeable, the override directive can be added later as pure ergonomics — it doesn't change the runtime model.

## Open questions

1. **Where should `get_type` live in the generated module?** Options: top-level `external get_type : unit -> g_type`, or namespaced under `Wrappers.<Class>.get_type`. The Layer 1 module already exposes raw bindings — top-level alongside `new_` is the obvious home.

2. **Should `get_type` be called once eagerly at module load or lazily on each invocation?** Calling it on each invocation is cheap (the GLib type system is idempotent — subsequent calls return the cached `GType` constant). Eager-at-load adds a tiny startup cost but eliminates the need for callers to think about registration. Probably eager via a `let _ = get_type ()` at module init.

3. **Does generating `get_type` for every class break anything in the current namespace context resolution?** Need to confirm the `<class>_get_type` symbol is always exported by the upstream library. Should be — it's the GObject contract — but there might be edge cases with internal classes flagged `(unintrospectable)`.

4. **Should `Gobject.Object.create` live in `Gobject.Object` or top-level `Gobject`?** There is no `Gobject.Object` module today — just `Gobject` with sub-modules `Type`, `Value`, `Closure`, `Argv`. Either add `Object` as a peer or expose `Gobject.create_obj`. No deep preference.

5. **Should the generated `create_empty` cast be safe-by-construction?** A wrapper like `let create_empty () = (Gobject.Object.create (get_type ()) :> t)` works only if `'a obj`'s row variable allows the coercion. Needs a quick experiment — if not, fall back to `Obj.magic` inside the generated body (still safe; we built it for the right type).

6. **Does `gtk_message_dialog_new`'s `flags` and `type` arg map cleanly to setter calls?** `MessageDialog` is deprecated in GTK 4.10+ in favour of `AlertDialog`; binding it is probably a waste. Worth confirming the deprecation status before spending any effort on it.

7. **Are there callers in `ocgtk/examples/` that would actually use a `create_empty` for any of these five classes?** If not, this is purely speculative. Worth grepping the examples and the calculator app before committing to the work.

## Existing considerations referenced

- **Override system** (`overrides/<ns>.sexp`): currently supports `(ignore ...)` and version-guard directives only. Adding `(provide-binding ...)` is not on any current roadmap.
- **Type registration**: handled today only as a side effect of the generated wrapper functions invoking GTK types via their normal API; never explicitly triggered for class types.
- **PR #127** (just merged): added direct kind-classification tests but explicitly skipped `Alert_dialog.get_buttons` for the registration reason described above. That gap is the immediate trigger for this analysis.
- **Milestone 4** in `ocgtk-context/TASKS.md`: lists "Generate `<constant>` bindings" and "Generate `<function>` bindings" as scoped work but does not mention varargs constructors. This plan does not need to wait for Milestone 4.

## Files this would touch (if the recommendation were executed)

- `gir_gen/lib/generate/layer1/` — new `get_type` external emitter per class
- `gir_gen/lib/generate/c_stubs/` — corresponding one-line C stub per class
- `ocgtk/src/common/gobject.{ml,mli}` — bind `ml_g_object_new` as `Gobject.Object.create` (or `Gobject.create_obj`)
- `gir_gen/lib/generate/layer1/` — generate `create_empty` (if pursued)
- `ocgtk/tests/gtk/test_alert_dialog.ml` (new) — exercise the resulting `Alert_dialog.create_empty + set_message + get_buttons` round trip; closes the PR #127 follow-up
