# Milestone 3: API Documentation Generation Specification

This document specifies how `gir_gen` turns GObject Introspection (GIR)
documentation into cross-linked, OCaml-idiomatic [odoc](https://ocaml.org/p/odoc)
comments for the generated ocgtk bindings.

It is a product requirements document: it defines the scope, the expected output
shape for every GIR node type, the GIR-to-OCamldoc conversion rules, the
documentation page model, the internal and external linking strategy, and the
handling of cyclically-dependent entities.

The implementation plan is kept separately in
[api_documentation_implementation.md](./api_documentation_implementation.md).

## 1. Goals

1. Every generated `.mli` file (Layer 1, Layer 2, enums, records, library
   modules, combined cyclic modules) carries useful, Merlin-visible
   documentation extracted from GIR.
2. The generated HTML from `dune build @doc` is navigable: classes, interfaces,
   methods, properties, signals, functions, enums, records, and their members
   are grouped under headings and cross-linked, including across the nine
   ocgtk namespaces.
3. GIR cross-references (`[method@Gtk.Button.set_label]`, `[ctor@...]`,
   `[signal@...]`, `[property@...]`, etc.) are converted into `{!...}` odoc
   references where the target is generated, or into external links to the GTK
   documentation where it is not.
4. GIR docs written for C developers are mechanically rewritten to OCaml binding
   conventions (types, null values, booleans, parameter names, `self`) without
   using an LLM.
5. Version and deprecation metadata from GIR are surfaced as `@since` and
   `@deprecated` tags.
6. Inheritance and interface-implementation relationships are surfaced as
   cross-references on each Layer 2 class type.

## 2. Scope

### In scope

- Documentation comments for all GIR top-level types that are currently
  generated: classes, interfaces, records, enumerations, bitfields, and (when
  P4 lands) namespace-level functions.
- Documentation for members of those top-level types: constructors, methods,
  signals, properties, record fields, and enum/bitfield members.
- Per-parameter documentation extracted from GIR `<parameter><doc>` elements,
  emitted as `@param` tags.
- OCamldoc headings that group items by GIR kind.
- Cross-linking between generated entities using `{!...}` references, both
  within a namespace and across namespaces.
- External links to `https://docs.gtk.org/<ns>/<LowerCaseEntity>/` for entities
  we do not generate (GLib/GObject internals, skipped methods, etc.).
- `@since`, `@deprecated`, and stability annotations.
- Synthetic documentation for generated items that have no GIR source
  (hierarchy accessors, enum converters, signal connectors).
- Inheritance and implementation cross-references on Layer 2 class types.
- Module-level overview comments for each namespace entry module, each public
  library-alias, and an `index.mld` page per namespace.
- Documentation for entities that participate in cyclic dependencies: each
  inner module of a combined cyclic file is documented as its own page, with the
  entity's GIR doc lifted to that page.

### Out of scope

- Documentation for entities that `filtering.ml` currently skips (callbacks,
  unsupported arrays, variadic functions, etc.). These are omitted from the
  generated API surface entirely.
- Manual prose not present in GIR (e.g., tutorial content). The `index.mld`
  content is either extracted from GIR or supplied as static text; it is not
  LLM-generated.
- Custom odoc tags beyond `@since`, `@deprecated`, `@param`, and `@return`.
  There is no `@raise` tag: the bindings use a `('a, GError.t) result` return
  type for `throws` functions rather than raising, so error information is
  folded into `@return` (see §12.2).

## 3. Sources of Documentation

| GIR element | AST field | Generated target |
|-------------|-----------|------------------|
| `<class><doc>` | `gir_class.class_doc` | L1 module, L2 class type, library alias |
| `<interface><doc>` | `gir_interface.interface_doc` | L1 module, L2 class type, library alias |
| `<record><doc>` | `gir_record.record_doc` | L1 module, L2 module (if generated) |
| `<constructor><doc>` | `gir_constructor.ctor_doc` | L1 `external`, L2 `val`/constructor wrapper |
| `<function><doc>` (incl. `*_new_*`) | (to be added in P4 for free functions; constructors already captured) | L1 `external`, L2 wrapper |
| `<method><doc>` | `gir_method.doc` | L1 `external`, L2 class method |
| `<property><doc>` | `gir_property.prop_doc` | L1 getter/setter externals, L2 property method |
| `<signal><doc>` | `gir_signal.doc` | L1 `val on_*`, L2 class method |
| `<enum><doc>` / `<member><doc>` | `enum_doc`, `member_doc` | `<ns>_enums.mli` type and constructors |
| `<bitfield><doc>` / `<member><doc>` | `bitfield_doc`, `flag_doc` | `<ns>_enums.mli` type and constructors |
| `<field><doc>` | `gir_record_field.field_doc` | record type field comments |
| `<parameter><doc>` | (to be added, see §10) | `@param` tags on methods/constructors/functions |
| `<class parent="...">` / `<implements>` | class AST | L2 "Inherits"/"Implements" cross-reference block |
| `deprecated` attr / `<doc-deprecated>` | (to be added, see §12.4) | `@deprecated` tag |
| `Stability` attr | (to be added, see §12.5) | inline `{i Unstable API.}` note |
| *(no GIR doc)* | — | synthetic synopsis derived from the generated signature (see §11) |

## 4. Documentation Layers

ocgtk exposes two programming layers. Documentation must be emitted at both.

### 4.1 Layer 1 — Low-level modules (`button.mli`)

- Module-level comment: GIR class/record/interface doc, converted to OCaml
  terminology.
- Each generated `external`, `val`, `type`, signal connector, and (later)
  function carries its GIR doc (or a synthetic synopsis) as an attached
  comment.
- Cross-references point to other Layer 1 values/types.

### 4.2 Layer 2 — High-level classes (`gButton.mli`)

- Same GIR text as Layer 1, but mechanically adapted to the class API:
  - `gtk_button_set_label(button, label)` → `button#set_label label`
  - `GtkButton *button` → the implicit `self` object of type `button_t`
  - `@button` → `self`
  - C return-value discussion → method return value / `unit`
- Cross-references point to Layer 2 classes/class-types where possible, and
  fall back to Layer 1 values/types only when a Layer 2 counterpart does not
  exist.
- Inheritance and implementation relationships are emitted as cross-references
  (see §5.1, §5.2).

The **doc text** is produced by one shared transformation pipeline (§8, §9);
only the **reference target paths** and the `self` adaptation differ between
layers. The **declaration shapes** are layer-specific (L1 `external … = "ml_…"`,
L2 `method …`) and are not part of the documentation pipeline.

## 5. Output Shape by Node Type

All doc comments are emitted as `(** ... *)`. They are placed immediately
before the element they document, with no blank line, following odoc placement
rules (see §11).

### 5.1 Classes

A GIR `<class>` generates a Layer 1 module (e.g. `button.mli`) and a Layer 2
class-type module (e.g. `gButton.mli`), plus a public library alias. Each is its
own odoc page.

Layer 1 module:

```ocaml
(** {1 Button}

    A [Button] is a widget that emits the [clicked] signal when activated.

    Buttons can show text, an image, or both. See
    {!class-type:Ocgtk_gtk.Gtk.Button.button_t} for the high-level class.

    @since 4.0 *)

type t = [ `button | `widget | `initially_unowned | `object_ ] Gobject.obj
```

Layer 2 module:

```ocaml
(** {1 Button}

    The high-level OCaml class for GTK buttons.

    A [button_t] object wraps a {!type:Button.t} and provides the methods
    described below. Use {!val:new_} to create a new button.

    {1 Inherits}

    {!class-type:Ocgtk_gtk.Gtk.Widget.widget_t}

    {1 Implements}

    {!class-type:Ocgtk_gtk.Gtk.Actionable.actionable_t}
    {!class-type:Ocgtk_gtk.Gtk.Accessible.accessible_t}

    @since 4.0 *)

class type button_t = object ... end
```

Rules for classes:
- The heading text is the GIR `c:type` or `name` stripped of its namespace
  prefix (e.g. `GtkButton` → `Button`, `GdkDisplay` → `Display`).
- The first paragraph becomes the module synopsis in odoc indexes (see §11).
- A cross-reference to the counterpart layer is added only if the counterpart
  is generated.
- On Layer 2, the class's `parent` attribute produces an `{1 Inherits}` block
  with one `{!class-type:...}` reference, and each `<implements>` interface
  produces one entry in an `{1 Implements}` block. Both blocks are omitted if
  the class has no parent / no implemented interfaces. Inheritance and
  implementation references resolve through the cross-reference table (§9),
  including cross-namespace cases (L2 → L2).

### 5.2 Interfaces

A GIR `<interface>` generates a Layer 1 module (e.g. `actionable.mli`) and a
Layer 2 class-type module (e.g. `gActionable.mli`), plus a public library
alias. Interfaces are documented with the same rules as classes, with these
differences:

- Interfaces have no constructors and no instance allocation: there is no
  `new_*` and no `{1 Constructors}` heading. A `<constructor>` child, if any,
  is ignored.
- Interfaces may have a `parent` interface (prerequisite interface in GIR);
  it is surfaced in the same `{1 Inherits}` block as for classes.
- `<implements>` on an interface is surfaced in the `{1 Implements}` block as
  for classes.
- Members (methods, properties, signals) follow exactly the same per-member
  rules as class members (§5.4–§5.6).

Layer 2 interface module:

```ocaml
(** {1 Actionable}

    The [actionable_t] interface provides a way of associating actions with
    widgets.

    {1 Inherits}

    {!class-type:Ocgtk_gtk.Gtk.Widget.widget_t}

    @since 4.0 *)

class type actionable_t = object ... end
```

### 5.3 Records

A GIR `<record>` generates a Layer 1 module and, when a Layer 2 module is
generated for it, a Layer 2 module. The module-level comment uses the record
doc. Record fields are documented per §5.9.

```ocaml
(** {1 Border}

    A struct that specifies a border around each side of a rectangle.

    @since 4.0 *)

type t = [ `border | `boxed ] Gobject.obj
```

### 5.4 Constructors

A constructor is any of:
- a GIR `<constructor>` element, or
- a GIR `<function>` element whose C symbol is a constructor of the owning
  class/interface (e.g. `gtk_button_new_with_label`).

Each constructor is emitted as a Layer 1 `external` and a Layer 2 wrapper
(`val` or `method` depending on the binding shape).

Layer 1:

```ocaml
(** [new_ ()] creates a new button.

    This is the OCaml binding for [gtk_button_new].

    @since 4.0 *)
external new_ : unit -> t = "ml_gtk_button_new"
```

Layer 2:

```ocaml
(** [new_ ()] creates a new high-level button.

    This is equivalent to [new button (Button.new_ ())].

    @since 4.0 *)
val new_ : unit -> button_t
```

If per-parameter docs exist, they are appended as `@param` tags (§10). When
the GIR element has a `throws` attribute, the generated binding returns
`('a, GError.t) result` rather than raising; the error case is described in
the `@return` tag (§12.2), not via `@raise`. No `@raise` tag is ever emitted.

### 5.5 Methods

Layer 1:

```ocaml
(** [set_label label] sets the text of the button label to [label].

    This clears any previously set label. See also {!val:get_label}.

    @param label the new label text
    @since 4.0 *)
external set_label : t -> string -> unit = "ml_gtk_button_set_label"
```

Layer 2:

```ocaml
(** [set_label label] sets the text of this button's label.

    This clears any previously set label.

    @param label the new label text
    @since 4.0 *)
method set_label : string -> unit
```

### 5.6 Properties

GTK properties generate a getter and/or setter. The same GIR property doc is
attached to both the Layer 1 `external`s and the Layer 2 method, with the text
mechanically split or adapted:

```ocaml
(** [get_label ()] returns the text of the button label, or [None] if unset.

    @since 4.0 *)
method get_label : unit -> string option

(** [set_label label] sets the text of the button label.

    @param label the new label text
    @since 4.0 *)
method set_label : string -> unit
```

When a property has a corresponding getter/setter method that takes precedence
(and the property is therefore not generated), no property doc is emitted; the
method doc carries the documentation.

### 5.7 Signals

Layer 1:

```ocaml
(** [on_clicked ~callback t] connects [callback] to the [clicked] signal.

    The signal is emitted when the button is pressed and released.

    @param after if [true], invoke the callback after the default handler
    @param callback function called when the signal fires
    @return a handler id suitable for passing to
      {!val:Gobject.Signal.disconnect}
    @since 4.0 *)
val on_clicked :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
```

Layer 2:

```ocaml
(** [on_clicked ~callback ()] connects [callback] to the [clicked] signal.

    @param after if [true], invoke the callback after the default handler
    @param callback function called when the signal fires
    @return a handler id
    @since 4.0 *)
method on_clicked :
  ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
```

The `on_*` connector itself has no GIR doc of its own; the signal's GIR doc is
used, with a synthetic first line (`[on_<sig> ~callback …] connects …`) added
per §11.

### 5.8 Namespace-level functions (P4)

When P4 is implemented, each standalone function gets a doc comment in the
namespace function module (to be designed as part of P4):

```ocaml
(** [show_uri uri] launches the default application for [uri].

    @param uri the URI to open
    @return [Ok ()] on success, [Error e] on failure
    @since 4.0 *)
val show_uri : string -> (unit, GError.t) result
```

### 5.9 Enums and bitfields

In `<ns>_enums.mli`, the type declaration gets the GIR enum/bitfield doc, and
each constructor gets its member doc:

```ocaml
(** {1 Align}

    Defines how a widget should align within the space allocated to it.

    @since 4.0 *)
type align =
  [ `fill  (** Stretch to fill all space *)
  | `start  (** Snap to left or top *)
  | `end_  (** Snap to right or bottom *)
  | `center  (** Center naturally *)
  | `baseline_fill
  | `baseline
  | `baseline_center ]
```

Bitfield members use the same shape. The synthetic `*_of_int` / `*_to_int`
converter values get a synthetic synopsis per §11.

### 5.10 Record fields

For non-opaque records (when field access is supported), each field gets a
comment in the record type declaration:

```ocaml
type border = {
  left : int;  (** Left padding, in pixels *)
  right : int;  (** Right padding, in pixels *)
  top : int;  (** Top padding, in pixels *)
  bottom : int;  (** Bottom padding, in pixels *)
}
```

Until field accessors are generated, the record type itself is still
documented with the GIR record doc.

## 6. Grouping by GIR Type Under Headings

Within a single `.mli`, items must be grouped and introduced with odoc
headings so that the HTML table of contents is useful.

For a Layer 1 class module, the order and headings are:

```ocaml
(** {1 <ClassName>} ... *)

type t = ...

(** {1 Hierarchy accessors} *)
external as_widget : ...

(** {1 Constructors} *)
external new_ : ...

(** {1 Methods} *)
external set_label : ...

(** {1 Properties} *)
external set_label : ...  (* property getter/setter pair; keep together *)

(** {1 Signals} *)
val on_clicked : ...
```

For a Layer 2 class module:

```ocaml
(** {1 <ClassName>} ... *)

class type button_t = object ... end

(** {1 Constructors} *)
val new_ : ...
```

For the namespace enums module `<ns>_enums.mli`, each enum/bitfield type is
preceded by `{1 <Name>}`.

## 7. Odoc Comment Conventions

Every emitted doc comment MUST follow these conventions.

### 7.1 Synopsis rule

The first sentence/paragraph of every comment is the **synopsis**: the text
shown in odoc indexes and Merlin tooltips. Keep it short (one line where
possible); move detail into later paragraphs. This applies to module comments,
item comments, and class-type comments alike.

### 7.2 Tag ordering

When present, tags appear in this fixed order, each at most once per category
(`@param` may repeat):

1. `@param <name>` — one per documented parameter, in declaration order.
2. `@return` — at most one.
3. `@since` — exactly one when a version is known.
4. `@deprecated` — at most one.

No `@raise` tag is emitted (error information is folded into `@return`,
§12.2). No other tags are emitted.

### 7.3 Inline code vs references

- Use `[...]` for inline code literals that are not resolvable targets: C
  symbols (`gtk_button_new`), literals (`None`, `true`, `false`), parameter
  names (`[label]`), short type mentions that have no generated target.
- Use `{!...}` references **only** for targets that resolve to a generated
  entity (value, type, class-type, method, module). Never emit a `{!...}`
  reference to a target that does not exist; fall back to `[...]` or plain
  text per §9.4.
- Use `{{:url}text}` for external links only (§9.3).

### 7.4 Heading levels

- `{0` headings are used **only** in `.mld` files (`index.mld`).
- `{1` headings are used for entity headers and section headers within `.mli`
  files. Deeper nesting (`{2`, `{3`) is not generated.

### 7.5 Placement and whitespace

- A doc comment is placed immediately before the element it documents, with no
  blank line between them.
- Exactly one blank line separates a doc comment (and its element) from the
  next section/element.
- No blank line between a record field and its inline `(** ... *)` comment.
- Floating/section-heading comments (`(** {1 ...} *)` used purely to introduce
  a group) are followed by one blank line before the grouped items.

## 8. GIR → OCamldoc Markup Conversion

The conversion is a pure, mechanical text transformation applied to every doc
string. It is not LLM-driven; every rule has a deterministic output.

### 8.1 Escaping

Escape the following odoc metacharacters when they appear in GIR text outside
of recognised markup: `{`, `}`, `[`, `]`, `@`.

Also escape the OCaml comment terminator sequences `*)` and the starter `(*`
as already done in `Utils.sanitize_doc`.

### 8.2 Code and inline literals

| GIR pattern | OCamldoc output |
|-------------|-----------------|
| `%NULL` | `[None]` |
| `%TRUE` | `[true]` |
| `%FALSE` | `[false]` |
| `TRUE` / `FALSE` (capitalised, outside code spans) | `[true]` / `[false]` |
| `@param_name` (GIR parameter reference) | `[param_name]` |
| C type like `GtkButton *` | `{!type:Button.t}` (map to L1 type path) |
| C type like `GtkWidget *` | `{!type:Widget.t}` (map to L1 type path) |
| C function `gtk_button_set_label()` | `{!val:Button.set_label}` if generated |
| Inline code already wrapped in backticks | `[...]` |

### 8.3 Lists and paragraphs

- Preserve blank lines as paragraph breaks.
- Convert Markdown-style bullet lists (`- item`) to odoc list syntax if they
  appear outside of a `{v ... v}` block; otherwise leave verbatim.
- Numbered lists (`1. item`) convert to `{ol ...}`.

### 8.4 Code blocks

GIR docs sometimes contain C examples. We do not rewrite C examples to OCaml;
we preserve them as verbatim blocks so they remain accurate:

```ocaml
(** ... {v
    GtkWidget *button = gtk_button_new_with_label ("Hello");
    gtk_widget_show (button);
v} ... *)
```

Short inline C expressions inside prose are rewritten to OCaml binding syntax
per §8.2.

## 9. Cross-Linking

### 9.1 Internal links (odoc references)

GIR references have the form `[kind@Namespace.Name.member]` or
`[kind@Namespace.Name::signal]` or `[kind@Namespace.Name:property]`. The
following mapping is used. References are resolved through the reference
resolution table (§9.2) and the cross-namespace path rules (§9.5).

| GIR kind | Target kind | Example GIR reference | Example odoc reference (same-namespace) |
|----------|-------------|-------------------------|------------------------------------------|
| `ctor` | Layer 1 value | `[ctor@Gtk.Button.new]` | `{!val:Ocgtk_gtk.Gtk.Wrappers.Button.new_}` |
| `method` | Layer 1 value | `[method@Gtk.Button.set_label]` | `{!val:Ocgtk_gtk.Gtk.Wrappers.Button.set_label}` |
| `property` | Layer 1 getter | `[property@Gtk.Button:label]` | `{!val:Ocgtk_gtk.Gtk.Wrappers.Button.get_label}` |
| `signal` | Layer 1 signal connector | `[signal@Gtk.Button::clicked]` | `{!val:Ocgtk_gtk.Gtk.Wrappers.Button.on_clicked}` |
| `class` | Layer 2 class type | `[class@Gtk.Button]` | `{!class-type:Ocgtk_gtk.Gtk.Button.button_t}` |
| `iface` | Layer 2 class type | `[iface@Gtk.Actionable]` | `{!class-type:Ocgtk_gtk.Gtk.Actionable.actionable_t}` |
| `struct` | Layer 1 type | `[struct@Gtk.TreeIter]` | `{!type:Ocgtk_gtk.Gtk.Wrappers.TreeIter.t}` |
| `enum` | enum constructor type | `[enum@Gtk.Align]` | `{!type:Ocgtk_gtk.Gtk_enums.align}` |
| `flags` | enum constructor type | `[flags@Gtk.DialogFlags]` | `{!type:Ocgtk_gtk.Gtk_enums.dialog_flags}` |
| `func` | function value | `[func@gtk_show_uri]` | `{!val:Ocgtk_gtk.Gtk.Functions.show_uri}` (P4) |
| `vfunc` | — | `[vfunc@Gtk.Widget.snapshot]` | strip markup, keep plain text (§9.4) |

For Layer 2 documentation, method/class references are rewritten to point at
Layer 2 entities when they exist (the layer-matching rule, §9.5):

- `[method@Gtk.Button.set_label]` inside `gButton.mli` →
  `{!method:Ocgtk_gtk.Gtk.Button.button_t.set_label}`.
- `[class@Gtk.Widget]` inside an L2 module →
  `{!class-type:Ocgtk_gtk.Gtk.Widget.widget_t}`.

### 9.2 Reference resolution policy

For every `[kind@Ns.Name.member]` reference, in order:

1. If the target namespace and entity (`Name`) are generated by the current
   binding set, emit an odoc `{!...}` reference using the public module path
   (§9.5). For references that include a `member` (e.g. `[method@Gdk.Display.get_name]`
   appearing in a Gtk doc), member-level existence is **not** independently
   verified against another namespace's AST: if the target entity is generated,
   the member is assumed to be generated too and the reference is emitted. This
   avoids needing to load every dependency namespace's full member lists into
   the generation context.
2. Else if the target is a GLib/GObject internal type or an otherwise
   ungenerated-but-documentable entity, emit an external link (§9.3) if the
   upstream docs URL is known.
3. Else strip the GIR reference markup and keep the bare display text (§9.4).

Steps 2 and 3 are mutually exclusive: an external link is emitted **only** when
an upstream URL is known; otherwise the markup is stripped to plain text. `vfunc`,
`alias`, and any GIR kind without a generated binding always fall through to
§9.4 (no external link).

### 9.3 External links

For ungenerated upstream entities hosted on `docs.gtk.org` (gi-docgen), emit an
external link using odoc URL syntax:

```ocaml
(** ... See {{:https://docs.gtk.org/gtk4/method.Button.set_label.html}the GTK reference for set_label}. *)
```

The gi-docgen per-symbol URL pattern is:
`https://docs.gtk.org/<slug>/<kind>.<Entity>[.<member>].html` where `<kind>` is
the gi-docgen page segment (`class`, `iface`, `struct`, `enum`, `flags`,
`func`, `method`, `property`, `signal`, `ctor`, `callback`, `constant`, etc.).

The slug is **not** derived by simply lower-casing the GIR namespace; it is a
fixed per-namespace table. The base URL is configurable per namespace, but the
default table (hardcoded, verified against `docs.gtk.org`) is:

| GIR namespace | docs.gtk.org slug | Generated by ocgtk? |
|---------------|------------------|---------------------|
| `Gtk`         | `gtk4`           | yes |
| `Gdk`         | `gdk4`           | yes |
| `Gsk`         | `gsk4`           | yes |
| `Gio`         | `gio`            | yes |
| `Pango`       | `Pango`          | yes |
| `PangoCairo`  | `PangoCairo`     | yes |
| `GdkPixbuf`   | `gdk-pixbuf`     | yes |
| `GLib`        | `glib`           | no (external only) |
| `GObject`     | `gobject`        | no (external only) |

Note the non-obvious slugs: `Pango` and `PangoCairo` keep their capitalisation;
`GdkPixbuf` becomes the lowercase, hyphenated `gdk-pixbuf`; the GTK4/GDK4/GSK4
namespaces carry a `4` suffix.

**`Graphene` and `Cairo` are NOT on `docs.gtk.org`.** Graphene is documented
with GTK-Doc at `https://ebassi.github.io/graphene/docs/` and Cairo at
`https://www.cairographics.org/manual/`; neither follows the gi-docgen URL
pattern, so no external link is emitted for them. References to ungenerated
`Graphene`/`Cairo` entities fall through to §9.4 (strip to plain text). Note
that most `Graphene`/`Cairo` entities *are* generated by ocgtk and therefore
resolve as internal links (§9.1) rather than external ones, so this only
affects the ungenerated minority.

Cross-namespace internal links always take precedence over external links for
anything we generate.

### 9.4 Stripping unresolvable references

References to `vfunc`, `alias`, or any other GIR kind that does not have a
generated binding are stripped of their `[kind@...]` wrapper. The bare symbol
name is kept and wrapped in `[...]` if it is short code, or left as prose
otherwise. No external link is emitted for these.

### 9.5 Cross-namespace path construction

A reference's public OCaml path is built from three parts:

1. The **library prefix** for the target namespace (table below).
2. The **namespace entry module** and submodule path (`Wrappers` for Layer 1,
   the `G*` class module for Layer 2, `<ns>_enums` for enums/bitfields, or the
   combined cyclic module for cyclic entities — see §13).
3. The **symbol name** within that module.

**Library prefix per namespace:**

| GIR namespace | Library prefix |
|---------------|----------------|
| `Gtk` (gtk4) | `Ocgtk_gtk` |
| `Gdk` (gdk4) | `Ocgtk_gdk` |
| `Gio` | `Ocgtk_gio` |
| `Pango` | `Ocgtk_pango` |
| `Gsk` | `Ocgtk_gsk` |
| `Graphene` | `Ocgtk_graphene` |
| `Cairo` | `Ocgtk_cairo` |
| `GdkPixbuf` | `Ocgtk_gdkpixbuf` |
| `PangoCairo` | `Ocgtk_pangocairo` |

GLib and GObject are never resolved through this table; references to them are
stripped or externally linked (§9.4).

**Layer-matching rule.** A reference's target layer matches the layer of the
site where the reference appears:

- A reference appearing in a Layer 2 module resolves to the target's Layer 2
  form (`{!class-type:Ocgtk_gdk.Gdk.GDisplay.display_t}`,
  `{!method:Ocgtk_gdk.Gdk.GDisplay.display_t.get_name}`, etc.).
- A reference appearing in a Layer 1 module resolves to the target's Layer 1
  form (`{!type:Ocgtk_gdk.Gdk.Wrappers.Display.t}`,
  `{!val:Ocgtk_gdk.Gdk.Wrappers.Display.get_name}`).
- If the matched layer does not exist for a target (e.g. a record with no L2
  module), fall back to the other layer.

**Cross-namespace enums/bitfields.** A reference to an enum or bitfield in
another namespace resolves to that namespace's enums module, prefixed by the
library prefix:

- `[enum@Gdk.EventType]` from a Gtk doc →
  `{!type:Ocgtk_gdk.Gdk_enums.event_type}`.
- `[flags@Gdk.DragAction]` from a Gtk doc →
  `{!type:Ocgtk_gdk.Gdk_enums.drag_action}`.

The enum type name is the lowercased GIR enum name (e.g. `EventType` →
`event_type`), consistent with `enum_code.ml`.

**Inheritance/implementation references.** The `{1 Inherits}` and
`{1 Implements}` cross-references in Layer 2 class docs follow the same
layer-matching and path rules: they resolve L2 → L2, including cross-namespace
parents (e.g. a Gtk class whose parent is `GtkWidget` resolves to
`{!class-type:Ocgtk_gtk.Gtk.Widget.widget_t}`; a hypothetical cross-namespace
parent resolves to the other namespace's L2 class type).

## 10. Per-Parameter Documentation

The GIR parser currently discards `<parameter><doc>` text. It must be extended
to capture it.

### 10.1 AST change

Add an optional `param_doc : string option` field to `gir_param` in `types.ml`.

### 10.2 Parser change

In `parse/gir_parser.ml`, when parsing a `<parameter>` element, capture any
nested `<doc>` element using the existing `parse_doc_text` helper and store it
in `param_doc`.

### 10.3 Output

For each generated parameter that has a `param_doc`, emit an `@param <name>`
tag at the end of the element's doc comment:

```ocaml
(** [set_label label] sets the button label.

    @param label the new label text *)
```

Parameters that are hidden at the OCaml API (e.g. length-companion parameters
for arrays, see P2) must not generate `@param` tags.

## 11. Synthetic Documentation for Generated Items Without GIR Docs

Several generated items have no GIR `<doc>` source. For these, emit a
synthetic synopsis derived from the generated signature, and nothing else (no
`@param`/`@return`/`@since`). The synopsis is a single `[f x]`-style line.

| Item | Synthetic synopsis |
|------|---------------------|
| Hierarchy accessor `as_<type>` | `[as_<type> t] returns [t] typed as [<type>].` |
| Enum/bitfield converter `<name>_of_int` | `[<name>_of_int n] converts the C integer [n] to the [<name>] variant.` |
| Enum/bitfield converter `<name>_to_int` | `[<name>_to_int v] converts the [<name>] variant [v] to its C integer.` |
| Signal connector `on_<sig>` | `[on_<sig> ~callback t] connects [callback] to the [<sig>] signal.` (then the signal's GIR doc, if present, follows as the body) |
| `new_*` constructor with no GIR doc | `[new_<…> args] creates a new [<entity>].` |

If the underlying GIR element *does* have a doc, it is used and no synthetic
synopsis is prepended. Synthetic text is not emitted for items that are skipped
entirely.

## 12. Version, Deprecation, and Stability Annotations

### 12.1 `@since`

If the GIR element has a `version` field (populated from `Since X.Y` in GIR or
from override data), emit `@since X.Y`.

### 12.2 `@return`

`@return` text is synthetic, derived from the return type and any existing
prose. Concretely:

- If the GIR element has a `throws` attribute, the generated binding returns
  `('a, GError.t) result`. In that case the `@return` line describes both
  branches, e.g. `@return [Ok v] on success, [Error e] on failure` (with `v`
  replaced by the success-value description, or `[Ok ()]` for a `unit` payload).
  This is the only error surfacing mechanism; there is no `@raise` tag.
- Else if the GIR doc already discusses the return value in prose (e.g. a
  "Returns:" sentence), lift that sentence into `@return`.
- Otherwise, derive a short line from the return type (e.g. `string option` →
  `@return the value, or [None] if unset`; `unit` → omit `@return`; `bool` →
  `@return [true] if …, [false] otherwise` when the method name implies a
  predicate, else omit).
- If nothing meaningful can be derived, omit `@return` rather than emit a
  vacuous tag.

### 12.3 Errors (`throws`)

There is no `@raise` tag. The generated bindings return `('a, GError.t) result`
for `throws` functions/methods/constructors rather than raising an exception, so
emitting `@raise` would describe an exception the code never throws and would
produce misleading odoc output. Error information is surfaced exclusively via
the `@return` tag as described in §12.2. `@raise` is never inferred from prose
and never emitted from `throws`.

### 12.4 `@deprecated`

The GIR parser must capture deprecation metadata into AST fields (mirroring
the §10 pattern for parameter docs): a `deprecated : string option` field
(populated from the GIR `deprecated` attribute, typically `"1"`/`"true"`, plus
the deprecation version from `deprecated-version`) and a `doc_deprecated : string
option` field (populated from the nested `<doc-deprecated>` element) on every
documentable entity (`gir_class`, `gir_interface`, `gir_record`, `gir_method`,
`gir_constructor`, `gir_function`, `gir_property`, `gir_signal`, `gir_enum`,
`gir_bitfield`, and members). These fields do not exist today and must be added.

If the entity is deprecated (non-`None` `deprecated` or `doc_deprecated`), emit:

```ocaml
(** @deprecated Use {!val:Replacement.new_thing} instead. *)
```

The `@deprecated` text is taken from `<doc-deprecated>` when present (it usually
names the replacement); the replacement reference inside it is converted via the
same cross-linking rules as the body text (§9). If no replacement is named, emit
`@deprecated Deprecated in GTK <version>.` using `deprecated-version`. When an
entity is deprecated, `@deprecated` is emitted in addition to (not instead of)
the normal doc comment, per the tag ordering in §7.2.

### 12.5 Stability

The GIR parser must capture the `Stability` attribute into a `stability : string
option` field on every documentable entity (this field does not exist today and
must be added). GIR `Stability` attributes are mapped to an inline note, not a
custom tag:

- `Stable` (or absent) → no extra markup.
- `Unstable` → prepend `{i Unstable API.} ` to the doc body.
- `Private` → do not document (already filtered out by overrides).

## 13. Cyclically-Dependent Entities

GIR entities that participate in cyclic type dependencies are merged into a
single physical `.ml/.mli` file using `module rec … and …` (Layer 1) or
mutually-recursive `class type … and …` (Layer 2). For example:

- `application_and__window_and__window_group.mli` (Layer 1) holds
  `module rec Application : sig … and Window : sig … and Window_group : sig … end`.
- `gApplication_and__window_and__window_group.mli` (Layer 2) holds
  `class type application_t = object … and window_t = object … and window_group_t = object … end`.

In addition, for each cyclic Layer 2 entity the generator emits a standalone
**shim module** `g<Entity>.mli` (e.g. `gContext.mli`) that re-exports the
class type from the combined file:

```ocaml
(* gContext.mli - shim for cyclic group Context_and__font_and__font_map_and__fontset *)
class type context_t = GContext_and__font_and__font_map_and__fontset.context_t
class context : Context_and__font_and__font_map_and__fontset.Context.t -> context_t
val new_ : unit -> context_t
```

The namespace entry module aliases the shim (`module Context = GContext`), so
the public path `Ocgtk_<ns>.<Ns>.<Entity>.<entity>_t` resolves through the
shim to the combined file. The generation mechanism itself (SCC computation,
combined-file emission, shim emission) is implemented in `dependency_analysis.ml`,
`layer1_main.ml`, and `class_gen.ml`; the documentation rules below specify how
docs attach to entities that live in such combined files and their shims.

### 13.1 Page model

The two layers produce different odoc page structures for cyclic entities:

- **Layer 1**: each inner module of a `module rec A : sig … and B : sig …` is
  its own odoc page, produced by the `module rec … and …` structure itself; **no
  physical splitting of combined files is required.** The documentation
  requirements apply per inner module exactly as for a standalone entity module.
- **Layer 2**: the combined file holds `and`-chained class types in a **single**
  module (`G<First>_and__<Rest>`); these render as class types on **one**
  module page, not separate pages. The **public** page for each cyclic L2 entity
  is its standalone **shim module** (`g<Entity>.mli`, see the shim example
  above), reached via the namespace entry alias `module <Entity> = G<Entity>`.
  The shim is therefore the canonical user-facing page for a cyclic L2 entity.
  The internal combined-file page is secondary; its and-chained class types
  repeat the entity documentation best-effort so the page is not bare, but the
  shim is the page that public cross-references resolve to (§13.4).

### 13.2 Lifting entity docs into the combined file

The GIR top-level entity doc for each participant must be lifted onto that
participant's declaration inside the combined file, so that each page carries
the same module/class-type-level documentation it would have as a standalone
module:

- **Layer 1**: place the entity doc as the **first special comment inside each
  inner module's `sig`**, beginning with a `{1 <EntityName>}` heading,
  followed by the converted GIR doc and `@since`. This is the reliable form: a
  special comment as the first item of a module signature becomes that
  module's odoc documentation. The per-member docs (methods, properties,
  signals) follow inside the same `sig` exactly as in §5.

  ```ocaml
  module rec Application : sig
    (** {1 Application}

        A high-level class for GTK application.

        @since 4.0 *)

    type t = [ `application | `object_ ] Gobject.obj
    external new_ : string option -> ... -> t = "ml_gtk_application_new"
    (** Create a new Application *)
    ...
  and Window : sig
    (** {1 Window}

        A toplevel window ...

        @since 4.0 *)

    type t = ...
    ...
  end
  ```

- **Layer 2**: the **shim module** (`g<Entity>.mli`) is the **primary**
  doc-lifting target, because it is a standalone file with a single `class type
  <entity>_t` declaration and therefore takes a preceding doc comment
  reliably — this is the page public cross-references resolve to (§13.4). The
  shim's module-level comment and the `class type` comment carry the `{1
  <EntityName>}` heading, the converted GIR doc, the `{1 Inherits}` and
  `{1 Implements}` blocks (§5.1), and `@since`.

  The internal combined file's `and`-chained `class type <entity>_t = object …`
  declarations repeat the same entity doc **best-effort**: a preceding doc
  comment is attempted on each `class type` (including `and`-chained ones). If
  odoc does not reliably attach a doc comment to an `and`-chained `class type`
  (see §15 risk 2), the fallback is to emit the entity doc as the first special
  comment inside the `object … end` body via a leading heading; the first
  `class type` always uses the preceding-comment form. This duplication is
  intentional and mirrors §13.3: the shim page is authoritative, the combined
  page is a best-effort duplicate so it is not empty.

  ```ocaml
  (* gApplication.mli - shim, primary doc target *)
  (** {1 Application}

      A high-level class for GTK application.

      {1 Inherits}
      {!class-type:Ocgtk_gtk.Gtk.Widget.widget_t}

      @since 4.0 *)
  class type application_t = GApplication_and__window_and__window_group.application_t
  ```

  ```ocaml
  (* gApplication_and__window_and__window_group.mli - combined, best-effort *)
  (** {1 Application} ... @since 4.0 *)
  class type application_t = object ... end

  (** {1 Window} ... *)
  and window_t = object ... end
  ```

### 13.3 Public alias pages

There are two public alias sites for a cyclic entity, both of which must carry
the lifted entity synopsis so the public path is self-contained rather than a
bare re-export:

- **Layer 1**: the `Wrappers` submodule alias in the namespace entry module
  (e.g. `Gtk.mli`'s `module Application = Application_and__window_and__window_group.Application`)
  points directly at the combined file's inner module.
- **Layer 2**: the namespace entry module alias `module Application = GApplication`
  points at the **shim** (§13.2), which is itself already a synopsis-bearing
  page; the alias comment duplicates only the synopsis + `@since` so the alias
  page is not empty.

Each alias gets:

- the `{1 <EntityName>}` heading and the first-paragraph synopsis,
- `@since` if known,
- a pointer to the full page: `{!module:Application_and__window_and__window_group.Application}` (Layer 1) or `{!class-type:GApplication.application_t}` (Layer 2 shim, see §14).

The full per-member documentation lives on the inner-module page (L1) / is
reached through the shim's class-type alias to the combined file's class type
(L2); the alias page intentionally duplicates only the synopsis so that users
who land on the canonical public path (`Ocgtk_gtk.Gtk.Application`) immediately
see what the entity is and where to read more, instead of an empty re-export
page.

### 13.4 Cross-reference targets into cyclic entities

References to a cyclic entity — whether from the same namespace, another
namespace, or another entity's Inherits/Implements block — always resolve to
the **public alias path** (e.g. `Ocgtk_gtk.Gtk.Window`,
`Ocgtk_gtk.Gtk.Button.button_t`), never the long internal combined-file path
(`Application_and__window_and__window_group.Window`). The reference resolution
table (§9.2) maps the logical GIR class name to the public alias path. This
keeps generated doc text stable regardless of how entities are physically
grouped, and avoids exposing the internal `_and__` naming in user-facing
references.

## 14. Module-Level Docs and `index.mld`

### 14.1 Namespace entry module (`Gtk.mli`)

The first special comment in `Gtk.mli` becomes the module overview. It must
contain:

- A short synopsis: what GTK namespace this module covers.
- `{1 Layer 1 wrappers}` and `{1 Layer 2 classes}` headings pointing users at
  `Wrappers` and the `G*` modules.
- A list of important submodules or a `{!modules: ...}` index if useful.

Example:

```ocaml
(** {0 GTK 4 bindings}

    This module provides the generated OCaml bindings for GTK 4.

    {1 Layer 1 — Low-level FFI}

    Use {!module:Wrappers} for direct external declarations and polymorphic
    variant types such as {!type:Wrappers.Button.t}.

    {1 Layer 2 — High-level classes}

    Use the [G*] modules, e.g. {!class-type:Button.button_t}, for an idiomatic
    object-oriented API.

    @since 4.0 *)
```

### 14.2 Public library aliases (`module Button = GButton`, etc.)

Each public class/interface alias in the namespace entry module carries a doc
comment consisting of the entity synopsis (heading + first paragraph + `@since`)
and a pointer to the full module:

```ocaml
(** {1 Button}

    A high-level OCaml class for GTK buttons. See
    {!class-type:GButton.button_t}. *)
module Button = GButton
```

This applies to both Layer 2 class aliases (`module Button = GButton`) and the
Layer 1 `Wrappers` submodule aliases (`module Button = Button`). For cyclic
entities, the L1 `Wrappers` alias points at the combined-file inner module and
the L2 alias points at the shim, both carrying the synopsis per §13.3.

### 14.3 `index.mld`

Dune's `@doc` is **package-oriented**: `.mld` pages are attached to a package
via a `(documentation (package ...))` stanza, and the `index.mld` in that
stanza's directory becomes the package entry page. odoc produces one page per
module/class-type; there is no per-library auto-generated landing page beyond
the package `index.mld`. To give each of the nine ocgtk namespaces its own
landing page, each namespace library gets its **own `(documentation)` stanza
and `index.mld` placed in the directory next to the library it belongs to**
(e.g. `ocgtk/src/gtk/doc/index.mld` with `ocgtk/src/gtk/doc/dune` containing
`(documentation (package ocgtk.gtk))`; likewise for `gdk`, `gio`, `pango`,
`gsk`, `graphene`, `cairo`, `gdkpixbuf`, `pangocairo`). Because each namespace
is its own public package (`ocgtk.gtk`, `ocgtk.gdk`, …), each gets an entry
page in the package listing.

Each generated `index.mld` has a `{0 NamespaceName bindings}` heading, a short
description, and a list of useful entry points. The content is populated from:

- the namespace `<doc>` element if present in GIR,
- a static template per namespace if needed,
- links to the namespace module and the enums module (e.g.
  `{!modules: Gtk Gtk_enums}` or `{!module:Gtk}` / `{!module:Gtk_enums}`).

A top-level package `index.mld` (for the root `ocgtk` package, at
`ocgtk/doc/index.mld` with `ocgtk/doc/dune` containing
`(documentation (package ocgtk))`) links the nine namespace landing pages so
the site has a single entry point.

## 15. Page Inventory (Site Map)

The documentation site is produced by `dune build @doc`. Per namespace, the
following pages exist and each is fed by a specific GIR source.

| Page (file) | Source(s) of documentation |
|-------------|----------------------------|
| `<Ns>.mli` (namespace entry) | Namespace `<doc>`; per-alias syntheses lifted from each entity's GIR doc (§14.2, §13.3) |
| `<ns>_enums.mli` | Each `<enum>` / `<bitfield>` and its `<member>` docs |
| `<entity>.mli` (Layer 1, one per class/interface/record) | The entity's `<doc>` + members' docs |
| `g<Entity>.mli` (Layer 2, one per class/interface/record that has an L2 form; for cyclic entities this is the **shim**, §13.2) | The entity's `<doc>` + members' docs (reached via the class-type alias) + Inherits/Implements (§5.1, §5.2) |
| `<first>__and__<rest>.mli` (Layer 1 combined cyclic) | Each participant's `<doc>` lifted to its inner module (§13.2) |
| `g<First>__and__<Rest>.mli` (Layer 2 combined cyclic) | Each participant's `<doc>` repeated best-effort on its `class type` (§13.2); the shim is the authoritative page |
| `<ns>/doc/index.mld` (next to each namespace library) | Namespace `<doc>` + static template + entry-point links (§14.3) |
| `ocgtk/doc/index.mld` (root package) | Links to each namespace `index.mld` (§14.3) |

**Module-name derivation (consistency requirement).** The generated module name
for an entity is derived from the GIR entity name and is consistent with the
top-level namespace entry module's aliases: the GIR `c:type`/`name` with its
namespace prefix removed is converted to the snake_case OCaml module name used
throughout (`GtkButton` → `Button` → `button` for Layer 1, `gButton` for Layer
2; `Gtk.ApplicationWindow` → `Application_window` → `application_window` /
`gApplication_window`). The exact casing/normalisation algorithm is an
implementation detail, but it MUST be consistent with the alias names already
emitted in `<Ns>.mli` so that cross-references resolve. Combined cyclic files
are named after the snake_case forms of their participants joined with
`_and__`.

## 16. Risks and Open Questions

1. **Cyclic entity doc placement**: attaching a doc comment to an
   `and`-chained `class type` (Layer 2 combined files) may not be supported by
   odoc. This risk is now **confined to the best-effort duplicate** in the
   combined file: the authoritative L2 page for a cyclic entity is the shim
   module (`g<Entity>.mli`), whose single `class type` takes a preceding doc
   comment reliably (§13.2). The spec's fallback (leading comment inside
   `object … end`, §13.2) applies only to the combined-file duplicate; the
   working form should be confirmed with the first `dune build @doc` run and the
   spec updated.
2. **odoc reference syntax for class methods**: the exact disambiguated form for
   a method of a class type (e.g. `{!method:button_t.set_label}` vs.
   `{!method:Ocgtk_gtk.Gtk.Button.button_t.set_label}`) may require
   experimentation; the spec should be updated once the first
   `dune build @doc` run confirms the working form.
3. **Enum constructor references**: odoc may not support direct references to
   polymorphic variant constructors. If so, enum type references are used and
   constructor names are rendered in `[...]`.
4. **Length**: GIR docs can be large. Merlin truncates long tooltips; keep the
   first paragraph short (§7.1) and move detail into later paragraphs.
5. **Comment placement**: odoc is strict about ambiguous comments. Generated
   output must keep one blank line between sections and no blank line between a
   doc comment and its element (§7.5).
6. **Library-alias duplication**: emitting the entity synopsis on both the alias
   page and the inner/entity module page duplicates a small amount of text.
   This is intentional (§13.3) so public-path pages are never empty; the
   duplication is limited to the synopsis and is regenerated, not hand-written.