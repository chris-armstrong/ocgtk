# Closures and Signals

GObject signals are the primary event-notification mechanism in GTK. Every widget
emits named signals (`"clicked"`, `"selection-changed"`, `"notify::visible"`, etc.)
and callers register callbacks with `g_signal_connect`. The callback is delivered
through a **GClosure** — a heap-allocated structure that pairs a C dispatch function
with arbitrary callback data.

This document covers the full stack: the GObject C mechanism, the OCaml closure
bridge, and how `signal_gen.ml` and `signal_marshaller.ml` generate signal bindings
at both Layer 1 and Layer 2.

---

## The GObject Signal Mechanism

At the C level, connecting a signal looks like this:

```c
g_signal_connect(G_OBJECT(button), "clicked", G_CALLBACK(on_clicked), user_data);
```

Under the hood, `g_signal_connect` creates a `GClosure` that stores `on_clicked`
and `user_data`, registers it with the object, and returns a handler ID. When the
signal fires, GLib calls `g_closure_invoke`, which passes the signal's argument
array (as a `GValue *param_values` array) and a return-value slot
(`GValue *return_value`) to the closure's **marshaller** — the function responsible
for adapting the generic `GValue` arguments to the actual callback signature.

For OCaml callbacks, we need a different mechanism: instead of a C function pointer,
we want to store and call an OCaml closure value.

---

## The OCaml Closure Bridge

### C side: `ml_gobject.c`

**`ml_g_closure_new`** creates a GClosure backed by an OCaml function:

```c
CAMLprim value ml_g_closure_new(value callback_val)
{
    GClosure *closure = g_closure_new_simple(sizeof(GClosure),
                                              (gpointer)callback_val);
    /* Protect the OCaml callback from the garbage collector.
     * closure->data is C-allocated memory; GLib will not tell the OCaml GC
     * about it, so we register it as a global root. */
    caml_register_global_root((value*)&closure->data);

    /* Remove the global root when GLib destroys the closure. */
    g_closure_add_invalidate_notifier(closure, NULL, ml_closure_invalidate);

    g_closure_set_marshal(closure, ml_closure_marshal);

    CAMLreturn(Val_GClosure_sink(closure));
}
```

The callback is stored directly in `closure->data` and registered as a GC root.
When GLib eventually destroys the closure (after all signal connections to it are
disconnected), `ml_closure_invalidate` removes the root, allowing the OCaml
callback to be collected.

**`ml_closure_marshal`** is installed as the GClosure's marshaller. GLib calls it
when the signal fires:

```c
static void ml_closure_marshal(GClosure *closure,
                                GValue *return_value,
                                guint n_params,
                                const GValue *param_values,
                                gpointer invocation_hint,
                                gpointer marshal_data)
{
    /* Retrieve the OCaml callback from closure->data */
    value callback_val = (value)closure->data;

    /* Build an argv record: { result; nargs; args }
     * argv.result wraps return_value (a GValue slot for the signal return).
     * argv.args is a direct pointer to param_values — valid only during
     * this call. OCaml code MUST NOT store argv for later use. */
    argv_val = caml_alloc(3, 0);
    Store_field(argv_val, 0, /* wrapped return_value */);
    Store_field(argv_val, 1, Val_int(n_params));
    Store_field(argv_val, 2, (value)param_values);

    caml_callback_exn(callback_val, argv_val);
    /* If the signal has a return value, copy it from argv.result back
     * to return_value. */
}
```

**`ml_g_closure_get_arg`** reads a single parameter from `argv.args`:

```c
CAMLprim value ml_g_closure_get_arg(value argv_val, value pos)
{
    const GValue *param_values = (const GValue *)Field(argv_val, 2);
    int index = Int_val(pos);
    return ml_g_value_of_existing(&param_values[index]);
}
```

### OCaml side: `Gobject.Closure` and `Gobject.Value`

The OCaml interface wraps the above:

```ocaml
module Closure = struct
  type t = g_closure
  type argv  (* opaque handle to the GValue parameter array *)

  external create : (argv -> unit) -> t = "ml_g_closure_new"
  external nth : argv -> pos:int -> g_value = "ml_g_closure_get_arg"
  external result : argv -> g_value = "ml_g_closure_get_result"
end
```

`Gobject.Value` provides typed accessors for extracting and setting values in a
`g_value`:

```ocaml
val get_boolean : g_value -> bool
val get_int     : g_value -> int
val get_uint    : g_value -> int
val get_string  : g_value -> string
val get_object  : g_value -> 'a Gobject.obj option
(* set_* counterparts for return values *)
```

Signal connection goes through `Gobject.Signal`:

```ocaml
module Signal = struct
  external connect :
    'a obj -> name:string -> callback:g_closure -> after:bool -> handler_id
    = "ml_g_signal_connect_closure"

  let connect_simple obj ~name ~callback ~after =
    let closure = Closure.create (fun _argv -> callback ()) in
    connect obj ~name ~callback:closure ~after
end
```

`connect_simple` is a convenience wrapper for the common case where the callback
takes no arguments: it creates a closure whose marshaller ignores `argv` entirely.

---

## signal_marshaller.ml

`signal_marshaller.ml` maps GIR types to **marshaller** records. A marshaller
captures everything the code generator needs to emit signal code for one parameter
or return value:

```ocaml
type marshaller = {
  ocaml_type   : string;          (* type for the callback signature *)
  getter_expr  : string;          (* expression to extract value from GValue *)
  setter_expr  : string;          (* expression to write value to GValue (returns) *)
  l2_class     : ocaml_class option; (* L2 class info, if this is a GObject type *)
  is_same_ns_class : bool;        (* true if class is in current namespace *)
  nullable     : bool;
}
```

The `classify` function returns `Supported marshaller | Unsupported reason`:

- **Primitives**: looked up in a table mapping GIR names to
  `(ocaml_type, getter_fn, setter_fn)` triples. Covers `gboolean`, `gint`,
  `gint16/32`, `guint`, `guint16/32`, `gunichar`, `gint64`, `gdouble`, `gfloat`,
  `utf8`, `filename`.

- **Enums and bitfields**: `get_enum_int` / `set_enum_int` combined with the
  generated `<enum>_of_int` / `<enum>_to_int` functions.

- **GObject classes and interfaces**: `get_object` / `set_object` using the Layer 1
  `Module.t` type. When `l2_class` is set, the L2 layer wraps/unwraps via
  `new <class>` and `#as_<class>`.

- **GLib.Variant**: `get_variant` / `set_variant`.

- **Unsupported** (signal is skipped): arrays, boxed records, callback types,
  `gpointer`, and types not in the primitive table.

### Type rendering

Marshallers render differently at Layer 1 and Layer 2:

- `render_l1_type ~current_class m`: for same-namespace classes, collapses
  `Button.t` to `t` when the marshaller type is the class being defined (avoids
  self-referential aliases within the same module).

- `render_l2_type ~current_layer2_module m`: for object marshallers, renders the
  L2 class type (`widget_t`, `widget_t option`) rather than the Layer 1 `Widget.t`.

---

## signal_gen.ml

`signal_gen.ml` drives the actual code emission. It classifies each signal, chooses
a generation strategy, and emits strings for insertion into the generated module.

### Classification

`classify ~ctx signal` runs each parameter through `signal_marshaller.classify`
and fails fast on the first unsupported parameter or return type. On success it
returns a `signal_emission` record:

```ocaml
type signal_emission = {
  signal             : gir_signal;
  method_name        : string;              (* "on_clicked", "on_selection_changed" *)
  raw_signal_name    : string;              (* "clicked", "selection-changed" *)
  param_marshallers  : (gir_param * marshaller) list;
  return_marshaller  : marshaller option;
  strategy           : [ `Connect_simple | `Closure ];
}
```

Strategy selection:
- `Connect_simple`: no parameters, void return → use `Gobject.Signal.connect_simple`
- `Closure`: any parameters or non-void return → build a `Gobject.Closure.create` body

### Layer 1 emission

**Parameterless signal** (`strategy = Connect_simple`):

```ocaml
(* mli *)
val on_clicked :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

(* ml *)
let on_clicked ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"clicked" ~callback
    ~after:(Option.value after ~default:false)
```

**Signal with parameters** (`strategy = Closure`):

```ocaml
(* mli *)
val on_selection_changed :
  ?after:bool -> t ->
  callback:(position:int -> n_items:int -> unit) ->
  Gobject.Signal.handler_id

(* ml — generated by emit_l1_let *)
let on_selection_changed ?after obj ~callback =
  let closure = Gobject.Closure.create (fun argv ->
    let position =
      let v = Gobject.Closure.nth argv ~pos:1 in
      Gobject.Value.get_uint v
    in
    let n_items =
      let v = Gobject.Closure.nth argv ~pos:2 in
      Gobject.Value.get_uint v
    in
    callback ~position ~n_items)
  in
  Gobject.Signal.connect obj ~name:"selection-changed" ~callback:closure
    ~after:(Option.value after ~default:false)
```

Parameters are numbered from position 1. Position 0 is the emitting object itself
(present in GLib's `param_values` but not exposed to the callback).

### Layer 2 emission

Layer 2 wraps Layer 1 via `emit_l2_method`. Two sub-cases:

**No GObject params or return** — forward the callback unchanged (the L1 type
matches L2 exactly for primitive parameters):

```ocaml
method on_activate ?(after = false) ~callback () =
  Expander.on_activate ~after self#as_expander ~callback
```

**GObject class in params or return** — wrap/unwrap between L1 and L2 types:

```ocaml
method on_child_changed ?(after = false) ~callback () =
  Widget.on_child_changed ~after self#as_widget
    ~callback:(fun ~child ->
      callback ~child:(new GWidget.widget child))
```

The L2 method signature shows `widget_t` instead of `Widget.t`; the adapter
bridges between the two representations transparently.

The return value is always `Gobject.Signal.handler_id` — an integer that can
be passed to `Gobject.Signal.disconnect` to unsubscribe.

---

## Signal Dependencies and the Dependency Graph

Signal parameters can create cyclic dependencies between class modules. For example,
a `"child-changed"` signal on `Box` that carries a `Widget` parameter creates a
`Box → Widget` edge in the dependency graph (on top of the usual parent-chain edge).

`dependency_analysis.ml` includes signals via `extract_signal_dependencies`, so
these edges are present in the same graph that Tarjan's SCC processes. A signal
dependency that would otherwise cause a circular module reference is automatically
absorbed into the combined module for that cycle.

---

## What Remains Unsupported

The following signal parameter patterns are skipped (the signal is omitted from
generated output):

| Pattern | Reason |
|---------|--------|
| `GArray` / array types | Marshalling through `GValue` for arrays is not implemented (see `todo/TODO.md`) |
| Boxed record types | `Gobject.Value.get_boxed` not yet wired to specific types (see `todo/TODO.md`) |
| Callback parameters | Deferred to a future milestone |
| `gpointer` | Opaque pointer with no OCaml representation |
| `GdkEvent` subtypes | Requires specialised union handling |

When a signal is skipped, it is silently absent from the generated `.ml` file.
Manual bindings can be added in `core/` for any signal that matters.
