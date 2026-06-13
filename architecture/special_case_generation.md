# Special-Case Generation

Most GIR methods map straightforwardly — a `gint` parameter becomes an `int` in
OCaml, a `gboolean` return becomes `bool`. This document covers the patterns that
require non-trivial generated code: arrays, GList/GSList, nullable parameters,
out parameters, enums and bitfields, and version guards. It also lists the patterns
that are intentionally skipped.

---

## Arrays

GIR describes arrays in several different ways. The generator handles four forms,
all via `c_stub_array_conv.ml`.

### Zero-terminated arrays

Arrays whose end is marked by a sentinel value (typically `NULL` for pointer
arrays, `{0}` for struct arrays). These appear in GIR as:

```xml
<array zero-terminated="1" c:type="const char**">
  <type name="utf8"/>
</array>
```

The generated C stub allocates an array one element larger than the OCaml array
length, fills it via a loop, and places the sentinel in the last slot:

```c
int n_items = Wosize_val(ml_items);
const char** c_items = (const char**)g_malloc(sizeof(const char*) * (n_items + 1));
for (int i = 0; i < n_items; i++) {
    c_items[i] = String_val(Field(ml_items, i));
}
c_items[n_items] = NULL;
```

On return, a zero-terminated C array is read back by counting to the sentinel and
building an OCaml array of the same length.

### Length-based arrays

Arrays accompanied by a separate length parameter, the most common form in GLib:

```xml
<parameter name="types" c:type="GType*">
  <array length="1"><type name="GType"/></array>
</parameter>
<parameter name="n_types" c:type="gsize"/>
```

The `length="1"` attribute is an index into the parameter list (0-based), not a
name. The length parameter is **hidden from the OCaml API** — the C stub derives
it from `Array.length` on the OCaml side:

```c
/* OCaml sees: val set_gtypes : t -> int array -> unit */
int n_types = Wosize_val(ml_types);
GType* c_types = ...;
gtk_drop_target_set_gtypes(self, c_types, n_types);
```

This hiding is currently implemented at the C level; the OCaml Layer 1 signature
still exposes the length parameter. Full hiding at the OCaml API level is tracked
in `todo/KNOWN_BUGS.md` (BUG-002).

### GPtrArray

GLib's `GPtrArray` is a pointer-based dynamic array:

```xml
<array c:type="GPtrArray*">
  <type name="Widget"/>
</array>
```

The generator detects `GPtrArray*` as the `c_type` and emits conversion code using
`g_ptr_array_sized_new` on input and element-by-element extraction on output.

### Out-parameter arrays

Arrays returned through pointer-to-pointer out parameters:

```xml
<parameter name="result" direction="out">
  <array c:type="Widget**" length="0">
    <type name="Widget"/>
  </array>
</parameter>
```

The generated code allocates a local pointer, passes its address to the C function,
then reads back the result array using the companion length.

---

## GList and GSList

GLib's singly-linked list types (`GList*`, `GSList*`) are represented in GIR as:

```xml
<type name="GLib.List">
  <type name="Widget"/>
</type>
```

The generator calls `c_stub_list_conv.ml` which produces conversion code that
walks the list and builds an OCaml array:

```c
GList *list = gtk_widget_list_mnemonic_labels(self);
int n = g_list_length(list);
CAMLlocal1(ml_result);
ml_result = caml_alloc(n, 0);
GList *cur = list;
for (int i = 0; i < n; i++) {
    Store_field(ml_result, i, Val_GtkWidget((GtkWidget*)cur->data));
    cur = cur->next;
}
g_list_free(list);
```

The element type must be resolvable via `type_mappings`. Lists whose element type
is an interface are currently skipped (BUG-009 in `todo/KNOWN_BUGS.md`).

---

## Nullable Parameters and Returns

GIR marks nullable types with `nullable="1"`:

```xml
<parameter name="child" nullable="1">
  <type name="Widget"/>
</parameter>
```

Nullable parameters become `option` in OCaml. The C stub checks for `None` and
passes `NULL`:

```c
GtkWidget *c_child = Is_none(ml_child) ? NULL
                   : GtkWidget_val(Field(ml_child, 0));
gtk_expander_set_child(self, c_child);
```

Nullable returns use `Option.map` or `Val_some` / `Val_none`:

```c
GtkWidget *result = gtk_expander_get_child(self);
CAMLreturn(result == NULL ? Val_none : Val_some(Val_GtkWidget(result)));
```

---

## Out Parameters

GIR parameters with `direction="out"` carry data back from the C function to the
caller. `c_stub_method_out.ml` handles these.

**Simple scalar out parameter**: a local variable is allocated and its address
passed to the C function; the value is returned from OCaml as an extra return:

```c
gboolean c_out_writable;
gtk_text_iter_get_attributes(self, attrs_val, &c_out_writable);
CAMLreturn(Val_bool(c_out_writable));
```

**Struct out parameter**: structs are allocated on the stack; the C function fills
them. The conversion function receives the struct by pointer:

```c
GdkRectangle out_rect;
gdk_monitor_get_geometry(self, &out_rect);
CAMLreturn(Val_GdkRectangle(&out_rect));
```

When a method has both a primary return value and out parameters, both are returned
as a tuple.

---

## Enums and Bitfields

`enum_code.ml` generates a single `<ns>_enums.mli` file per namespace containing
the OCaml types for all enums and bitfields.

**Enums** become polymorphic variant types with integer converters:

```ocaml
(* gtk_enums.mli — generated excerpt *)
type orientation = [`HORIZONTAL | `VERTICAL]
val orientation_of_int : int -> orientation
val orientation_to_int : orientation -> int
```

The C stubs use `Val_int` / `Int_val` for enum values (they are small integers).
The generated `*_of_int` function maps the C integer to the variant; `*_to_int`
maps back.

**Bitfields** follow the same pattern but the `_of_int` converter combines multiple
set bits via a flags list or variant OR (depending on the bitfield definition in
GIR).

Enums and bitfields from other namespaces are referenced with the fully-qualified
module prefix: `Gtk_enums.orientation` for same-namespace, or
`Ocgtk_gdk.Gdk_enums.event_type` for cross-namespace.

---

## Version Guards

GTK4 adds new API in every minor version. Methods and enum members added in a
specific version get wrapped in version-guard macros so the generated code compiles
against older GTK versions.

Guards appear at two granularities:

**Entity-level**: the entire C stub (or OCaml declaration) is wrapped:

```c
#if GTK_CHECK_VERSION(4, 10, 0)
CAMLprim value ml_gtk_widget_get_opacity(value self_val) { ... }
#endif
```

**Member-level**: individual cases inside an enum converter:

```c
int gtk_enums_input_purpose_to_int(value v) {
    switch (Tag_val(v)) {
    case 0: return GTK_INPUT_PURPOSE_FREE_FORM;
    /* ... */
#if GTK_CHECK_VERSION(4, 14, 0)
    case 17: return GTK_INPUT_PURPOSE_TERMINAL;
#endif
    }
}
```

Version guards are applied via two sources:

1. **Override sexp** (`ocgtk/overrides/<ns>.sexp`): explicit
   `(version "X.Y")` directives added by contributors.
2. **GIR doc strings**: `override_extractor.ml` scans `<doc>` elements for
   phrases like "Since: 4.10" and can extract those annotations into override
   files automatically (via `gir_gen overrides`).

---

## Properties

Properties are a GObject concept distinct from methods: they are named key-value
pairs registered on a class, accessible via `g_object_get` / `g_object_set` and
typed through `GValue`. The generator produces `get_<prop>` and `set_<prop>`
wrappers using `GValue` accessor macros (`c_stub_property.ml`).

Properties are skipped when:
- The property type is an array (cannot be marshalled through `GValue`)
- The property has a corresponding getter/setter method (the method takes
  precedence to avoid duplication)
- The property type is not in `type_mappings`

---

## What Gets Skipped

The following patterns are suppressed by `filtering.ml` or by absent type mappings:

| Pattern | Handling |
|---------|---------|
| Unknown type | Method silently skipped — type not in `type_mappings` |
| `<varargs>` | Silently skipped — not parsed, treated as `void` |
| Callback parameters | Skipped — deferred (callbacks in methods, not signals) |
| `void*` / `gpointer` byte buffers | Skipped — `guint8` not in type_mappings intentionally |
| Array-typed properties | Skipped by `should_generate_property` |
| Interface parameters in L2 | Skipped — interface types don't have `as_<iface>` accessors yet |
| Static `<function>` elements | Not yet implemented (BUG-005) |
| Out-param arrays with no length | Skipped by `filtering.ml` |
| Double-pointer out-params not marked as arrays | Skipped by `filtering.ml` |
| GList with interface element type | Skipped — interface structs are opaque (BUG-009) |

When a method is skipped, it is absent from the generated output with no indication
at build time. At runtime the method simply does not exist in the OCaml API; callers
who need it must write a manual binding in `core/`.

For the full list of known limitations see
[todo/KNOWN_BUGS.md](./todo/KNOWN_BUGS.md).
