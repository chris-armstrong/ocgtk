# Reference Documentation Generation (Milestone 3) — Design & Mapping

> **Status: WIP — research / design only.** This is a working draft, not a
> settled plan. It records the design and the GIR → odoc mappings for
> generating API reference documentation from GIR `<doc>` elements. It
> deliberately contains **no implementation plan, no task breakdown, and no
> schedule**. Each section states the decision, the alternatives that were
> considered and dismissed, and any outstanding questions, in line. Sections
> are written to be self-contained even where that repeats context from a
> neighbour.
>
> Lives under `gir_gen/docs/research/` to distinguish a WIP design PRD from the
> settled plans in `gir_gen/docs/plans/`.
>
> **Library layout (revised 2026-10-28).** Module paths, file names and the
> reference examples follow the per-package layout
> ([library-layout.md](../plans/library-layout.md)): one opam package per
> namespace (`ocgtk` is Gtk only), layer 1 at `Oc<ns>.Raw.<Type>`, layer 2 at
> `Oc<ns>.<Type>`, enums at `Oc<ns>.Enums`, constants at `Oc<ns>.Constants`.
> The reference forms in §7 were re-probed against the generated bindings
> (§4.3, second probe).

This is a companion to the GIR generator architecture; see
[../../../architecture/cross_namespace_types.md](../../../architecture/cross_namespace_types.md) for the references
mechanism, [../../../architecture/special_case_generation.md](../../../architecture/special_case_generation.md) for
the generated-code patterns, and
[../../../ROADMAP.md](../../../ROADMAP.md) "Milestone 3" for the deliverables this
design serves.

---

## 1. Purpose and scope

GIR files carry inline documentation in `<doc>` elements attached to nearly
every node (classes, interfaces, records, methods, functions, constructors,
properties, signals, parameters, return-values, enum/bitfield members,
constants, fields). The generated OCaml bindings currently emit no
human-readable documentation for most of these (constants being the only
exception today). Milestone 3's goal is that `dune build @doc` produces
browsable odoc HTML with the upstream GTK prose, translated to odoc's markup,
with cross-references resolved to the generated OCaml items where possible.

This document defines **what the translation is** — the source format, the
target format, and the mapping between them, including how GIR symbol
references become odoc cross-references. It does **not** specify the order of
work, which generator functions change, or how tests are structured; those are
planning concerns and belong elsewhere.

**In scope:** the GIR `<doc>` text format and its markdown dialect; the odoc
markup target; the formatting translation; cross-reference resolution
(gi-docgen `[fragment@…]` links and legacy gtk-doc sigils); deprecation and
stability; parameter/return-value docs; screenshots; error documentation
(`throws` → `@return`, and why generated docs never carry `@raise`); the
page model — where each translated doc attaches across the two layers,
combined cyclic files, shims, and alias pages, including the
Inherits/Implements blocks; synthetic synopses for generated items that have
no GIR doc; the relationship to the existing generator's name translators,
references files, and Layer 1 / Layer 2 module layout.

**Out of scope (explicitly):** the getting-started `.mld` guide content;
dune `(documentation)` stanza wiring; the implementation order; performance
optimisation of the resolver.

The page model (§11), synthetic synopses (§12), stability (§3.10, §8), the
error-tag policy (§13), and the Inherits/Implements blocks (§11.4) are
imported from the M3 spec drafted in PR #155
(`gir_gen/docs/plans/api_documentation_specification.md`, still open) and
re-grounded against this codebase and the bundled GIR corpus. Where the PR's
assumptions conflict with what the code or the corpus shows, the divergence
is recorded in place (e.g. hierarchy accessors are L2 methods in this
codebase, not the L1 externals the PR spec assumed).

---

## 2. ocgtk architecture context (what already exists)

The design below leans on a number of pieces the generator already produces.
This section records them so the rest of the document is self-contained.

### 2.1 Layer 1 and Layer 2

Every GObject class, interface and record generates two OCaml layers (see
[../../../architecture/overview.md](../../../architecture/overview.md)). Each
namespace is its own opam package `oc<ns>` (`ocgtk` is Gtk only) with three
libraries:

- **Layer 1 (L1)**, library `oc<ns>.raw` (`<pkg>/raw/generated/`) — a module
  per type, public path `Oc<ns>.Raw.<Type>` (`Ocgtk.Raw.Button`), exposing a
  `type t` (the GType-tagged pointer) and `external` functions: constructors
  (`external new_ : …`), methods (`external set_label : …`), and property
  accessors (`external get_<prop>` / `external set_<prop>`). Signals appear as
  L1 free functions too (`val on_<signal>`). `Oc<ns>.Raw` is a generated
  module of aliases (`module Button = Ocgtk_raw.Button`), so odoc's canonical
  page for an L1 module is under `Ocgtk_raw`; references are written through
  the public `Oc<ns>.Raw.<Type>` path and resolve to it.
- **Layer 2 (L2)**, library `oc<ns>` (`<pkg>/generated/`) — a module per
  type, public path `Oc<ns>.<Type>` (`Ocgtk.Button`), exposing
  `class type <type>_t`, `class <type>` with `method …` declarations that
  forward to L1, and the constructors as module-level `val`s that return the
  class type. Records get an L2 class type too (`Ocgdk.Rgb_a.rgb_a_t`).
- **Enums and bitfields**, library `oc<ns>.enums` — polymorphic-variant
  types, public path `Oc<ns>.Enums.<type>` (a generated `include` of
  `Oc<ns>_enums`, so both paths resolve; `Oc<ns>.Enums` is the one written).
- **Constants** — `Oc<ns>.Constants.<name>`, in the L2 library only.

Standalone functions (namespace-level and class-static) and callbacks are
not generated today, so they have no target (§7.2).

### 2.2 Stable shim module names (SCC is hidden)

Some classes are mutually recursive and are absorbed by the dependency
analyser's Tarjan SCC pass into a single **combined module**, e.g.
`Application_and__window_and__window_group` (one file per layer, under the
same name in `raw/generated/` and `generated/`). The combined name is an
implementation detail: each member also gets a **shim module** with a stable
name that re-exports from the combined module, at both layers:

```ocaml
(* ocgtk/generated/window.mli — L2 shim *)
class type window_t = Application_and__window_and__window_group.window_t
class window : Raw.Window.t -> window_t
val new_ : unit -> window_t

(* ocgtk/raw/generated/window.mli — L1 shim *)
include module type of struct
  include Application_and__window_and__window_group.Window
end
```

So the **public, stable name** for a class is always a pure function of the
type name — `Ocgtk.Window.window_t`, never the combined
`…_and__window_and__window_group.window_t`. The L1 module
`Ocgtk.Raw.Window` is likewise the shim of the combined module's L1 part.
**This is decisive for reference resolution (§7): doc references always
point at the stable shim name, so SCC grouping is irrelevant to the doc
path.** The probe (§4.3) confirms that a method reached through a shim's
class-type alias (`{!Ocgtk.Widget.class-type-widget_t.method-show}`)
resolves and links to the shim's page.

### 2.3 Name translators (deterministic)

The generator already turns GIR names into OCaml names with pure functions in
`gir_gen/lib/utils.ml` and the generators:

- `Utils.module_name_of_class = to_snake_case >> capitalize_ascii`
  (`AboutDialog` → `About_dialog`, `RGBA` → `Rgb_a`); the same name is used
  for the L1 module, the L2 module and (lowercased, with `_t`) the class
  type.
- `Utils.to_snake_case` (CamelCase → snake_case).
- `Utils.sanitize_identifier` (OCaml keyword escape, e.g. `new` → `new_`).
- Property accessors, for a property no GIR method claims (§7.2):
  L1 `external get_<prop>` / `external set_<prop>`; L2 `method <prop>`
  (getter, no `get_` prefix) / `method set_<prop>`, with
  `prop = Utils.ocaml_property_name` (e.g. `gtk-alternative-button-order` →
  `gtk_alternative_button_order`). A property that a GIR method claims via
  `get-property` / `set-property` gets no accessors of its own; the method
  (`get_label`, `set_label`) is its accessor at both layers.
- Signal accessors: `"on_" ^ name` (e.g. signal `activate` → `on_activate`),
  an L1 `val` and an L2 `method`.
- Constructor: `sanitize_identifier` of the GIR name (`new` → `new_`), an L1
  `external` and an L2 module-level `val`.
- Enum/bitfield type: lowercased name (`AxisUse` → `axisuse`), in
  `Oc<ns>.Enums`.
- Constant: lowercased name (`ACTION_ALL` → `action_all`), in
  `Oc<ns>.Constants`.
- Namespace → package module: `Gtk` → `Ocgtk`, `Gdk` → `Ocgdk`, `Gio` →
  `Ocgio`, `GdkPixbuf` → `Ocgdkpixbuf`, `cairo` → `Occairo`, … (`Oc` ^ the
  lowercased namespace).

These are **deterministic functions of the GIR name**, so an odoc reference
path is computable without any lookup table (see §7).

### 2.4 References files (`.refs`) — type-level cross-namespace table

Each namespace emits a `.refs` sexp consumed by other namespaces (see
[../../../architecture/cross_namespace_types.md](../../../architecture/cross_namespace_types.md)). The relevant
type is `cross_reference_entity` (`gir_gen/lib/types.ml`):

```ocaml
type cross_reference_type =
  | Crt_Class of { parent : string option; implements : string list }
  | Crt_Interface
  | Crt_Record of { opaque : bool; get_type_func : string option }
  | Crt_Enum
  | Crt_Bitfield
  | Crt_Constant

type cross_reference_entity = {
  cr_name : string;      (* GIR name, e.g. "Surface" *)
  cr_type : cross_reference_type;
  cr_c_type : string;   (* C type, e.g. "GdkSurface" *)
}
```

Key facts:
- `.refs` is **type-level only** — it has no methods, properties, signals,
  constructors, or functions.
- `.refs` has **no SCC/combined-module path** — it does not record which
  combined module a class landed in (but §7 explains this does not matter).
- `.refs` has both the GIR name (`cr_name`) and the C type (`cr_c_type`),
  plus the kind (`cr_type`). This is enough to answer "is `GdkSurface` a
  class?" and "is `KEY_a` a constant?".

### 2.5 Generation context (live, in-process)

While generating namespace N, the generator holds a `generation_context`
with the full parsed AST for N: `classes`, `interfaces`, `enums`, `records`,
`constants`, `functions`, … each with their member lists. This is richer
than `.refs` (it has members and the real c-identifiers) but it only covers
the **current** namespace. Cross-namespace member data is not in memory
unless N's GIR and its dependencies' `.refs` are loaded.

### 2.6 Existing documentation emission (constants only)

`gir_gen/lib/generate/constant_code.ml:emit_doc` already emits `(** … *)`
comments from `<doc>` for constants, using `gir_gen/lib/utils.ml:sanitize_doc`,
which only escapes the `*)` / `(*` sequences that would prematurely close the
comment. It also renders the GIR `version` attribute as an odoc `@since` tag.
No gi-docgen → odoc translation happens; the raw markdown text is passed
through. Some method docs are also already emitted raw (e.g.
`about_dialog.mli` shows `set_translator_credits` with a raw ``` ```c ``` code
fence left intact). This raw pass-through is what odoc will misparse — the
translation defined in this document replaces it.

### 2.7 Filtering

`gir_gen/lib/generate/filtering.ml` drops methods/properties/signals whose
parameter or return types are unsupported (e.g. boxed records, GArray,
callbacks). The GIR AST therefore lists more members than the generated code
emits. This is the one source of "the reference target was not generated"
broken links (§7.7).

### 2.8 Errors today: `throws` → `result`; handwritten code raises

Generated bindings never raise. Every GIR callable with `throws="1"` is
bound returning `('a, GError.t) result` — e.g. `pixbuf_loader.mli`:
`external new_with_mime_type : string -> (t, GError.t) result` — with
`GError.t` defined in the handwritten `ocglib/gError.mli`.
Raising is confined to **handwritten** support modules, for exceptional
conditions: the integer bounds wrappers (`ocglib/int32.mli` etc. raise
`Invalid_argument`), the GVariant accessors (`ocglib/gvariant.mli` raises
`Failure`), and `ocgtk/core/main.ml`, which raises on GTK initialisation
failure. Those modules document their raises by hand (`@raise` tags in
their handwritten `.mli` files). This split drives the error-documentation
policy (§13).

---

## 3. The source: GIR `<doc>` format

### 3.1 XML shape

`<doc>` is a child element of nearly every GIR node. The RelaxNG schema
(`docs/gir-1.2.rnc` in gobject-introspection) defines only the container:

```
Doc          = element doc { text }
DocDeprecated = element doc-deprecated { text }
```

Confirmed by parsing all 39,850 `<doc>` elements in the bundled `gir/*.gir`
with ElementTree:

- **`<doc>` elements contain pure text — zero nested XML elements.** Embedded
  HTML such as `<picture>`/`<source>`/`<img>` is **XML-escaped** in the file
  (`&lt;picture&gt;`), so after XML un-escaping it is literal text. The
  generator's `parse_doc_text` (which accumulates `Xmlm` `Data` events and
  skips any stray `El_start`) therefore captures the full content correctly;
  no markup is lost.

**Decision:** treat `<doc>` content as a text string, as the parser already
does. No change to the XML parsing strategy is required for the text itself.

**Alternatives considered and dismissed:**
- Parse embedded HTML as structured XML and translate node-by-node —
  dismissed; the HTML is escaped to text by design (so it survives as text),
  and it is not well-formed XML in general (e.g. `<img>` without close).
  String/regex handling on the un-escaped text is simpler and matches what
  gi-docgen itself does.

**Outstanding questions:**
- None for the text capture. (Whether `<doc-deprecated>` and the
  `deprecated`/`deprecated-version` attributes are captured in the AST is a
  separate question — see §8.)

### 3.2 The format declaration: `<doc:format>`

A sibling element declares the format of every `<doc>` in a namespace:

```xml
<doc:format name="gi-docgen" xmlns:doc="http://www.gtk.org/introspection/doc/1.0"/>
```

`name` is one of the values `g-ir-scanner --doc-format` accepts: **`gi-docgen`,
`gtk-doc-markdown`, `gtk-doc-docbook`, `hotdoc`**. Measured across the bundled
tree:

| namespace | `<doc:format>` | # `<doc>` |
|---|---|---:|
| Gtk-4.0 | gi-docgen | 18,016 |
| Gio-2.0 | gi-docgen | 12,926 |
| Gdk-4.0 | gi-docgen | 2,662 |
| Pango-1.0 | gi-docgen | 2,434 |
| Graphene-1.0 | **unknown** | 1,601 |
| Gsk-4.0 | gi-docgen | 1,404 |
| GdkPixbuf-2.0 | **unknown** | 700 |
| PangoCairo-1.0 | gi-docgen | 107 |
| cairo-1.0 | (absent) | 0 |

`<doc:format>` is a **recent** addition (gobject-introspection 1.83.2, GLib
MR !4550, March 2025). GIR files produced by older `g-ir-scanner` have no such
element, and two of the files that do declare it say `unknown` rather than
`gi-docgen`. cairo has no `<doc>` at all (a hand-authored minimal GIR; cairo
lacks introspection).

**Decision:** the translator is **format-agnostic** — it always handles both
the gi-docgen `[fragment@…]` links and the legacy gtk-doc sigils, regardless
of the declared format. `<doc:format>` is parsed (if present) only for
diagnostics / strict-mode warnings, **not** as a dispatch key. When the
element is absent, default to assuming gi-docgen markdown (our primary
target is the GTK4 stack).

**Rationale (why not dispatch on the declaration):** the declaration does not
predict content. Gio declares `gi-docgen` yet contains 13,294 legacy sigils
vs 1,674 `[fragment@]` links — the legacy sigils dominate ~8× (see §6
inventory). This is by design: gi-docgen's own spec says it auto-converts the
legacy sigils even in gi-docgen mode, so the two co-occur. Rejecting the old
format would discard the bulk of Gio's documentation. The declaration is also
absent in older GIRs entirely. So neither "only support gi-docgen" nor
"dispatch on the declaration" is viable.

**Alternatives considered and dismissed:**
- *Only support gi-docgen, reject old-format docs.* Dismissed: legacy sigils
  are inside gi-docgen-declared namespaces (Gio especially); rejecting them
  loses most of the prose. Also `<doc:format>` is absent in older GIRs.
- *Dispatch the translator on `<doc:format>`.* Dismissed: the element is
  recent, sometimes absent, sometimes `unknown`, and does not predict
  content (Gio).
- *Detect the format by content heuristics.* Dismissed: unnecessary; a single
  translator that handles both dialects is simpler and robust (matches
  glibmm's `DocsParser.pm`).

**Outstanding questions:**
- None that block v1. (A later "strict mode" could warn when a gi-docgen
  namespace contains many unresolved legacy sigils, but that is a refinement.)

### 3.3 The gi-docgen markdown dialect (content)

Authoritative reference:
<https://gnome.pages.gitlab.gnome.org/gi-docgen/content.html>. gi-docgen parses
`<doc>` text as **plain Markdown** (Python-Markdown) plus extensions.

**Basic syntax:**

| Element | Syntax |
|---|---|
| Heading | `# H1`  `## H2`  `### H3` |
| Bold | `**bold**` |
| Italic | `*italic*` |
| Blockquote | `> quote` |
| Ordered list | `1. item` |
| Unordered list | `- item` |
| Inline code | `` `code` `` |
| Horizontal rule | `---` |
| Link | `[title](https://url)` |
| Image | `![alt](img.jpg)` |

**Extensions:** definition lists, fenced code blocks (``` ``` ```), tables,
and **admonitions**:

```
::: warning
    Indented markdown content. A blank line ends the admonition.
```

`type` ∈ `note | important | warning | seealso | tip | hint` (default titles:
Note / Important / Warning / See also / Tip / Hint).

**GTK-Doc compatibility** — gi-docgen auto-converts these legacy sigils into
**code fragments (not links)**, because they lack specificity: `%CONSTANT`,
`#TypeName`, `#TypeName:property`, `#TypeName::signal`, `symbol_name()`.
See §5 for how we handle them (we do better than gi-docgen for the resolvable
ones, §7).

**Decision:** translate this markdown subset to odoc markup (§6). odoc is its
own markup, not markdown, so this is a format translation, not a pass-through.

**Alternatives considered and dismissed:**
- *Pass the markdown through unchanged inside `(** *)`.* Dismissed: odoc
  does not render markdown. `#` would be ambiguous, `` `code` `` is not odoc
  inline code, `@param` would be misparsed as an odoc tag, code fences would
  render as plain text. This is the single most important constraint of the
  whole design.

**Outstanding questions:**
- Tables and definition lists are rare in the bundled docs; confirm volume
  and pick an odoc rendering (`{t …}` light-table syntax) before finalising.

### 3.4 The gi-docgen link fragments (`[fragment@endpoint]`)

Authoritative reference:
<https://gnome.pages.gitlab.gnome.org/gi-docgen/linking.html>. The form is
`[fragment@endpoint]`; backticks around the endpoint are allowed and stripped
(`` [`class@Foo`] ``), and a `#anchor` may be appended
(`[class@Foo#some-subheading]`).

| Fragment | Endpoint grammar | Example |
|---|---|---|
| `alias` | `TypeName` | `[alias@Allocation]` |
| `callback` | `TypeName` | `[callback@Gtk.ListBoxForeachFunc]` |
| `class` | `TypeName` or `Ns.Type` | `[class@Widget]`, `[class@Gdk.Surface]` |
| `const` | `CONSTANT` | `[const@Gdk.KEY_q]` |
| `ctor` | `TypeName.constructor` | `[ctor@Gtk.Box.new]` |
| `enum` | `TypeName` or `TypeName.MEMBER` | `[enum@Orientation]`, `[enum@Orientation.HORIZONTAL]` |
| `error` | `TypeName` | `[error@Gtk.BuilderParseError]` |
| `flags` | `TypeName` | `[flags@Gdk.ModifierType]` |
| `func` | `function` or `Ns.Type.function` | `[func@Gtk.init]`, `[func@Gtk.Window.list_toplevels]` |
| `iface` | `TypeName` | `[iface@Gtk.Buildable]` |
| `method` | `Ns.Type.method` | `[method@Gtk.Widget.show]` |
| `property` | `Ns.Type:property` | `[property@Gtk.Orientable:orientation]` |
| `signal` | `Ns.Type::signal` | `[signal@Gtk.RecentManager::changed]` |
| `struct` | `TypeName` | `[struct@Gtk.TextIter]` |
| `type` | `TypeName` (generic; resolves to the type's actual kind) | `[type@Gtk.Window]` |
| `vfunc` | `Ns.Type.virtual` | `[vfunc@Gtk.Widget.measure]` |
| `id` | C symbol | `[id@gtk_window_new]` |

The endpoint is fully qualified (`Ns.Type`) or relative to the **current
namespace** (`Type`). For **external namespaces**, gi-docgen resolves
cross-namespace links via a `baseURLs` JavaScript map (namespace → docs URL);
the OCaml analog is our per-namespace module-path table (§7).

**Decision:** the fragment keyword gives the **kind** of the target. This is
the foundation of the resolver (§7): `[class@…]` ⇒ class, `[enum@…]` ⇒ enum,
etc., so the module family (`Oc<ns>.<Type>` vs `Oc<ns>.Enums` vs
`Oc<ns>.Constants`) is selectable without any lookup. Only `[id@…]` (C symbol, no kind hint) and
`[type@…]` (ambiguous kind) need a lookup or a fallback.

**Alternatives considered and dismissed:**
- *Resolve every fragment against a symbol table first to learn the kind.*
  Dismissed: the fragment keyword already states the kind; a table lookup is
  redundant for all fragments except `id` and `type`.

**Outstanding questions:**
- `[type@…]` is ambiguous (could be class/enum/struct/…). v1 fallback:
  render as `[Type]` code, or guess class (most common). Decide.
- `[id@…]` needs a C-symbol → OCaml-name index. v1 fallback: `[c_symbol]`
  code. v2: build the c-index from the in-process AST (current ns) and a
  serialized member table (cross-ns).

### 3.5 Legacy gtk-doc sigils

gtk-doc reference: <https://gi.readthedocs.io/en/latest/annotations/gtkdoc.html>.
These appear throughout the docs, including inside gi-docgen-declared
namespaces (gi-docgen auto-converts them to code fragments):

- `%CONSTANT` — an enumeration constant or preprocessor macro.
- `#TypeName` — a type (class/interface/enum/record/alias).
- `#TypeName:property` — a property of a type.
- `#TypeName::signal` — a signal of a type.
- `symbol_name()` — a C function.
- `@param` — a reference to a parameter by name (also an odoc hazard, §6).

**Decision:** attempt to resolve the resolvable sigils via the available
indices (§7), and **fall back to inline code on miss** — exactly gi-docgen's
behaviour when we cannot do better, and a strict improvement when we can.

**Rationale:** the only downside of attempting resolution is a false-positive
match (linking to the wrong thing), which is very unlikely because gtk-doc
*defines* `#`/`%` as type/constant references, and the guard rules below
prevent matching garbage. A miss produces exactly the code span gi-docgen
would have produced, so there is no regression vs the "always code" baseline.

**Guard rules (avoid false positives):** `#`/`%` followed by an **uppercase
identifier with no space**, and `#` not preceded by `/`. This excludes:
- URL fragments (`https://x/#bar` — `#` preceded by `/`, and `bar` lowercase),
- markdown headings (`# Heading` — space after `#`),
- CSS/hex (`#ff0000` — lowercase).

**Alternatives considered and dismissed:**
- *Always render sigils as code (strict gi-docgen parity).* Dismissed: leaves
  easy value on the table — `#TypeName` and the heavily-used `%GDK_KEY_*`
  constants are resolvable (§7.5).
- *Aggressively link all sigils, including `@param` and `symbol()`.*
  Dismissed: `@param`/`symbol()` need member/c-symbol indices (not available
  cross-ns in v1) and carry higher false-positive risk; fall back to code is
  safer and still useful.

**Outstanding questions:**
- Whether `.refs` is built before or after `filtering.ml` runs (i.e. does it
  include types whose methods were filtered?). Types themselves are usually
  generated even when some methods are filtered, so `#Type` resolution is
  generally safe; confirm.

### 3.6 `<doc-deprecated>` and the `deprecated` / `deprecated-version` attributes

`<doc-deprecated>` is a **separate sibling element** of `<doc>`, not an
attribute. It carries the prose explaining *why* something is deprecated and
what to use instead, and it contains the same gi-docgen links — so it goes
through the same translator as `<doc>`.

Measured:

| namespace | `<doc-deprecated>` | `deprecated=` attr | `deprecated-version=` attr |
|---|---:|---:|---:|
| Gtk-4.0 | 779 | 1,086 | 1,086 |
| Gio-2.0 | 105 | 106 | 103 |
| Gsk-4.0 | 39 | 41 | 41 |
| GdkPixbuf-2.0 | 37 | 37 | 37 |
| Gdk-4.0 | 20 | 21 | 21 |
| Pango-1.0 | 11 | 19 | 19 |
| Graphene-1.0 | 2 | 2 | 2 |
| PangoCairo-1.0 | 1 | 1 | 1 |

Real example (`Gtk.Calendar`): attribute `deprecated-version="4.10"` and
sibling `<doc-deprecated>Use [method@Gtk.Calendar.set_date] instead.</doc-deprecated>`.

**Decision:** map both to a single odoc `@deprecated` tag. odoc has no
since-version-for-deprecation, so combine: `@deprecated Since {version}:
{<doc-deprecated> prose}`. The prose reuses the same translator (it contains
links).

**Alternatives considered and dismissed:**
- *Two separate tags (`@deprecated` + a since note).* Dismissed: odoc has no
  `@deprecated_since`; the version must go in the body.
- *Drop the version.* Dismissed: the version is useful and present.

**Outstanding questions:**
- The `deprecated` and `deprecated-version` attributes are **not currently on
  `gir_method`/`gir_class`/etc.** in the AST (only `version` is captured).
  They need adding to the AST and a `<doc-deprecated>` parse arm in
  `parse_doc_text`'s dispatch. Confirm the full set of nodes that carry these
  attributes.

### 3.7 Parameter and return-value `<doc>`

`<doc>` children of `<parameter>` and `<return-value>` carry per-argument
prose (the `@param`-equivalent) and return prose. These map to odoc `@param`
and `@return` tags — but only when the generated OCaml argument name matches
the GIR parameter name, so the tag lines up.

Real example: `<parameter name="amount"><doc>Shifts all values ... by @amount.</doc>`
becomes `@param amount Shifts all values … by [amount].` (the `@amount` inside
becomes a code span per §6).

**Decision:** emit `@param <ocaml_name> <prose>` / `@return <prose>` when the
OCaml arg name is known and matches; otherwise fold the prose into the main
body (a mismatched `@param` is worse than no tag).

**Alternatives considered and dismissed:**
- *Always fold per-arg prose into the body.* Dismissed: loses the structured
  tags that odoc renders nicely.
- *Always emit `@param` tags.* Dismissed: for elided length params (P2) or
  renamed/merged args, the tag name would not match the actual argument and
  would be misleading.

**Outstanding questions:**
- Confirm that generated signatures preserve GIR parameter names (so `@param`
  tags line up). Where P2 elides length-linked array params, or where args are
  renamed, decide per-case (fold vs. tag).

### 3.8 Screenshots: `<picture>` / `<img>`

These are XML-escaped HTML inside `<doc>` text. Measured: **104 `<picture>`
blocks** (Gtk 80, Gsk 16, Pango 7, Gio 1) and **108 `<img>` tags**, almost all
on **class-level** docs (the canonical "An example GtkX" screenshots), plus
some Gsk render-node and Pango font-metric diagrams. The pattern is a
responsive dark/light pair:

```
<picture>
  <source srcset="aboutdialog-dark.png" media="(prefers-color-scheme: dark)">
  <img alt="An example GtkAboutDialog" src="aboutdialog.png">
</picture>
```

The PNGs live in the GTK/Gsk/Pango `docs/` trees and are shipped by gi-docgen
as `content_images`; we have none of them, and odoc cannot render responsive
HTML `<picture>`/`<source>`.

**Decision:** strip the `<picture>`/`<source>` wrapper and render the
`<img alt` text as odoc `{i alt-text}`. This preserves the descriptive intent
("An example GtkAboutDialog") with zero asset dependency. A configuration
hook can later emit `{image:url}` if assets are ever vendored.

**Alternatives considered and dismissed:**
- *Ship the image assets and emit `{image:…}`.* Dismissed: LGPL asset
  burden, maintenance, and odoc has no responsive HTML; not worth it for the
  reference docs.
- *Strip entirely, losing the alt text.* Dismissed: the alt carries
  descriptive value ("An example GtkAboutDialog").
- *Link to the upstream image URL.* Dismissed: the `src` values are relative
  paths resolvable only against gi-docgen's per-namespace `baseURLs`; fragile
  and network-dependent.

**Outstanding questions:**
- Whether to also keep the `<source srcset>` dark-mode `alt` (same alt) — no,
  one alt suffices.

### 3.9 Inventory of reference patterns in the bundled GIR

Measured counts (substring presence, indicative):

| ns | declared | `[frag@]` | `#Type` | `%CONST` | `@param` | `symbol()` |
|---|---|---:|---:|---:|---:|---:|
| Gio | gi-docgen | 1,674 | 6,580 | 4,373 | 5,032 | 2,341 |
| Gtk | gi-docgen | 3,324 | 10 | 2,057 | 4,729 | 563 |
| Gdk | gi-docgen | 399 | 1 | 239 | 563 | 62 |
| Pango | gi-docgen | 402 | 2 | 325 | 579 | 64 |
| Gsk | gi-docgen | 108 | 11 | 22 | 359 | 18 |
| GdkPixbuf | unknown | 38 | 60 | 3 | 99 | 102 |
| Graphene | unknown | 0 | 6 | 17 | 282 | 54 |

Two takeaways: (1) legacy sigils are ubiquitous even in gi-docgen namespaces
(Gio is dominated by them); (2) `@param` is everywhere and **must** be
converted (it is an odoc tag sigil, §6).

### 3.10 The `Stability` attribute

gtk-doc annotations can carry `Stability: Stable | Unstable | Private`,
which g-ir-scanner may surface as a node attribute (the form the M3 spec in
PR #155 assumes is `Stability="Unstable"`).

Measured: **zero occurrences** of any `stability` spelling, case-
insensitive, across all nine bundled GIR files — the only "unstable" hits
are prose (the Gtk constraint-layout docs, one GdkPixbuf doc string).
There is nothing to surface in the current corpus.

**Decision:** the parser may capture the attribute cheaply — one optional
field per entity, the same pattern as deprecation (§3.6) — but no mapping is
load-bearing today. If captured, the mapping is: `Unstable` → prepend
`{i Unstable API.}` to the doc body; `Private` → nothing (private symbols
are already filtered out of the bindings); absent/`Stable` → nothing.
Define it for forward compatibility; do not let it drive scope.

**Alternatives considered and dismissed:**
- *Ignore the attribute entirely.* Dismissed: capture is a one-field addition
  next to the deprecation capture, and GTK has historically used stability
  annotations; forward compatibility costs nothing.
- *Emit a custom odoc tag or an odoc warning.* Dismissed: an inline
  `{i Unstable API.}` note reads like the upstream docs and needs no custom
  tag support.

**Outstanding questions:**
- Zero corpus hits mean the spelling cannot be verified from data — confirm
  the exact attribute name against the g-ir-scanner/GIR schema before
  implementing the capture.

---

## 4. The target: odoc

### 4.1 odoc markup

odoc is OCaml's documentation generator (`dune build @doc` drives it). Doc
comments are `(** ... *)` using **odoc markup**, which is its own format —
*not Markdown*. Reference: <https://ocaml.github.io/odoc/odoc/cheatsheet.html>;
differences vs ocamldoc: <https://ocaml.github.io/odoc/odoc/ocamldoc_differences.html>.

Relevant markup:

| Construct | odoc syntax |
|---|---|
| Paragraph break | blank line |
| Bold / italic / emphasis | `{b …}`, `{i …}`, `{e …}` |
| Inline code | `[code]` |
| Code block | `{[ … ]}` (language ignored by odoc) |
| Verbatim | `{v … v}` |
| Headings | `{1 …}` … `{5 …}`; `{0 …}` for `.mld` page titles |
| Bullet list | `- item` or `{ul {- …} {- …}}` |
| Numbered list | `+ item` or `{ol …}` |
| External link | `{:https://url}` or `{{:https://url}label}` |
| Cross-reference | `{!Path.to.item}` or `{{!Path.to.item}label}` |
| Image | `{image!local}` or `{image:url}` |
| Table | `{t \| … \|}` (light) or `{table …}` |
| Tags | `@since`, `@deprecated`, `@param x …`, `@return …`, `@raise …` |
| Escaped specials | `\{` `\}` `\[` `\]` `\@` when literal |

### 4.2 odoc reference resolution

`{!Path.to.item}` references resolve **at link time** (`odoc link`) using
odoc "module trees" and "page trees" (`-L`/`-P`). Each opam package is one
page tree; each library is one module tree. `dune build @doc` wires the trees
for a workspace automatically, so cross-library references (Gtk → Gdk → Gio)
resolve **if** the `{!…}` path is the fully-qualified OCaml path of the target.

odoc's reference grammar: the simple form `{!Module.name}` resolves by search;
the disambiguating form encodes the kind, e.g. `{!Module.type-t}` for a type
`t`, `{!Module.val-x}` for a value. For class methods the kind is `method`
(ocamldoc `method:`); the exact odoc path form for a method on a class type
is pinned by the probe (§4.3): `{!method:P.C.m}` and the
fully-disambiguated `{!P.class-type-C.method-m}` both resolve; the hash
form `{!P.C#m}` does not.

Unresolved references emit a **warning** (not an error) and render as a
code-span-ish text. This is the graceful-degradation lever we use for
references we cannot resolve (§7).

**Decision:** emit fully-qualified `{!Oc<ns>.….item}` paths (rooted at the
package's main module) so odoc's linker resolves them across libraries and
packages in the workspace.

**Alternatives considered and dismissed:**
- *Generate a Markdown sidecar and a separate renderer (the gtk-rs
  rustdoc-stripper model).* Dismissed: the OCaml ecosystem standard is odoc
  via `dune build @doc`; a sidecar pipeline would not integrate with the
  platform and would duplicate odoc's cross-referencer.

**Outstanding questions:**
- **`dune build @doc` baseline** and the exact reference forms for **class
  methods** and **polymorphic-variant constructors** — **answered by the
  probe in §4.3**: cross-library `{!…}` references resolve; the working
  method forms are `{!method:P.C.m}` and `{!P.class-type-C.method-m}`
  (the hash form `{!P.C#m}` does not); polymorphic-variant constructors
  resolve as `{!P.type-t.constructor-X}` (or `{!constructor:P.t.X}`).

### 4.3 Probe results (odoc 3.2.1 baseline probe)

The outstanding questions above called for a `dune build @doc` baseline
probe. One was run (2026-08, scratch dune workspace, two libraries in one
package, odoc 3.2.1 / dune 3.23.1). Everything below was **observed** in
the built HTML or the emitted warnings, not read from documentation.

**Headings (module comment vs page model):**

- `{0}` is reserved for page titles. A module page already carries an
  implicit level-0 title (the module name); emitting `{0}` inside an `.mli`
  module comment draws a warning ("heading level should be lower than top
  heading level '0'") and renders above the page title. Never emit `{0}`
  in `.mli`s.
- `{1}`–`{5}` are the valid range in code comments (`{1}` renders as
  `<h2>` under the implicit title; deeper levels nest). odoc warns and
  caps heading levels outside the range.
- Headings in a **module comment** become page sections and appear
  nested in the page's local TOC. Headings carry an optional label —
  `{1:my_id Title}` — referable from anywhere in the package via
  `{!section-my_id}` (`label` is the deprecated spelling) — anchors exist
  for *page-level* headings, and only there.
- Headings in an **item comment** (val/external/method/class-type doc)
  are **silently demoted to plain paragraphs** — no warning, no TOC
  entry; there is no heading markup inside `spec-doc` at all. The id is
  dropped too: `{1:my_id Heading}` in an item doc renders as `<p>` with
  **no `id` attribute**, so member-doc sections cannot be anchored or
  deep-linked at all (verified with `{!section-…}` references failing to
  attach). This is deliberate design, not a rendering bug — the odoc
  manual ("odoc for authors", Page Structure) states: *"A comment attached
  to a declaration shouldn't contain any heading."* Headings are the
  page's sectioning device (preamble → TOC → sections); item docs are
  subordinate page content, and the demotion is the silent fallback when
  the rule is broken.
- Prose must begin on its own line after a heading; same-line text after
  `{1 …}` draws "Paragraph should begin on its own line".
- **Synopsis rule**: the first paragraph is the synopsis; a comment that
  *starts with a heading* has **no synopsis** (blank in indexes and
  `{!modules:…}` lists). odoc's ocamldoc-differences doc states this; the
  corpus never violates it (§6.6).

**Tags (`@param`, `@return`):**

- odoc renders `@param` on values, externals, and class methods, in an
  at-tags list, as written.
- **Zero validation.** A `@param wrong_name` on an external renders
  as-is with no warning; a `@param` even renders on a class *type* that
  has no parameters at all. This is odoc's design — it "does not ignore
  tags where they don't make sense" (odoc issue #575, open) and the
  behaviour is endorsed upstream (ocaml/ocaml #12374: "I rather agree
  with odoc decision to always render the param tag as written").
  ocamldoc's name-matching/silent-drop behaviour (ocaml/ocaml #8804)
  does **not** apply to odoc.
- **Tags are terminal.** Everything after a `@tag` (until the next tag)
  belongs to that tag: continuation prose after `@param x …` was silently
  absorbed into the parameter description, and a literal `@param` word in
  that prose was re-parsed as a nested tag ("'@param' is not allowed in
  '@param'"). Comments must be assembled **prose first, then tags**, and
  `@word` occurrences inside tag bodies must be neutralised (§6.5 applies
  inside tags too).

**Cross-references (cross-library, `dune build @doc`):**

- `{!Liba.Alpha.a_val}` (simple) and `{!Liba.Alpha.val-a_val}`
  (odoc-disambiguated) both link across libraries — the ~18k
  cross-library-reference case is de-risked.
- Class-type targets: `{!P.class-type-C}` and `{!type:P.C}` both resolve.
- Method targets: `{!method:P.C.m}`, the fully-disambiguated
  `{!P.class-type-C.method-m}`, and the plain dotted `{!P.C.m}` all
  resolve; `{!P.C#m}` does not ("Couldn't find …#m").
- Polymorphic-variant constructors: `{!P.type-t.constructor-X}` and
  `{!constructor:P.t.X}` both resolve, linking into the type's page.
- Unresolved references emit a warning and render as an
  `xref-unresolved` span — the graceful degradation of §7.6 confirmed.

**Second probe: reference forms against the generated bindings
(2026-10-28, odoc 3.2.1).** The same list of references was appended to
`ocgtk/generated/button.mli` (an L2 doc) and `ocgtk/raw/generated/button.mli`
(an L1 doc), built with `dune build @doc`, and each link target read from
the HTML. Every form below resolved from **both** layers with no warning;
the deliberate miss (`…class-type-button_t.method-nonexistent`) warned and
rendered unlinked.

| Reference | Links to |
|---|---|
| `{!Ocgtk.Button.class-type-button_t.method-set_label}` | `Ocgtk/Button/class-type-button_t/#method-set_label` |
| `{!Ocgtk.Button.button_t.method-set_label}` (no kind prefix) | same |
| `{!Ocgtk.Button.class-type-button_t.method-on_clicked}` (signal) | `…#method-on_clicked` |
| `{!Ocgtk.Widget.class-type-widget_t.method-show}` (shim of a cyclic group) | `Ocgtk/Widget/class-type-widget_t/#method-show` |
| `{!Ocgtk.Text_iter.class-type-text_iter_t.method-get_offset}` (record, shim) | `Ocgtk/Text_iter/class-type-text_iter_t/#method-get_offset` |
| `{!Ocgtk.Button.new_with_label}` (L2 constructor) | `Ocgtk/Button/#val-new_with_label` |
| `{!Ocgtk.Raw.Button.new_with_label}`, `{!Ocgtk.Raw.Button.set_label}` | `Ocgtk_raw/Button/#val-…` |
| `{!Ocgtk.Raw.Widget.show}` (L1, cyclic group) | `Ocgtk_raw/Widget/#val-show` |
| `{!Ocgtk.Enums.orientation}` | `Ocgtk/Enums/#type-orientation` |
| ``{!Ocgtk.Enums.type-orientation.constructor-HORIZONTAL}``, ``{!Ocgtk.Enums.type-orientation.`HORIZONTAL}`` | `Ocgtk/Enums/#type-orientation.HORIZONTAL` |
| `{!Ocgtk.Constants.accessible_attribute_background}` (from L1 too) | `Ocgtk/Constants/#val-…` |
| `{!Ocgdk.Rgb_a.class-type-rgb_a_t.method-to_string}` (cross-package) | `ocgdk/Ocgdk/Rgb_a/class-type-rgb_a_t/#method-to_string` |
| `{!Ocgio.Action_group.class-type-action_group_t}` (cross-package iface) | `ocgio/Ocgio/Action_group/class-type-action_group_t/` |

Findings:

- **The kind prefix is optional but is emitted.** `button_t.method-x` and
  `class-type-button_t.method-x` link identically; the resolver emits the
  `class-type-` form, which is what the generated docs already use for the
  Inherits block and the module preambles, and which cannot be shadowed by
  the `class button` of the same module.
- **Shims are transparent.** A method reached through
  `class type widget_t = <Combined>.widget_t` resolves, and the anchor exists
  on the shim's own class-type page. No reference needs the combined name.
- **L1 docs can link to L2 and vice versa.** References are resolved
  package-wide, so an L1 doc can name `Ocgtk.Button…` and an L2 doc
  `Ocgtk.Raw.Button…`, even though `ocgtk.raw` cannot depend on `ocgtk`.
- **`Oc<ns>.Raw.<Type>` resolves to the `Ocgtk_raw` page** (the canonical
  page of the alias), while `Oc<ns>.Enums` has a page of its own (it is an
  `include`). Both are written through the public paths.

**Comment attachment:**

- A comment separated from the following element by **no** blank line is
  that element's doc; with a blank line it is floating. The file's first
  floating comment becomes the module doc, rendered in the page preamble
  above the content — so a module comment is safe even when the first
  item below it is undocumented.

---

## 5. (Section reserved — see §6 for the translation table)

---

## 6. The translation: gi-docgen markdown → odoc

This is the core mapping. odoc is not markdown, so every construct is
translated. Examples use real GIR snippets (verbatim) and the resolved odoc,
assuming an **L2 doc** context (classes/interfaces → L2, everything else → L1;
see §7.8).

### 6.1 Formatting

| GIR (markdown) | odoc | Notes |
|---|---|---|
| blank line | blank line | paragraph |
| `**bold**` | `{b bold}` | |
| `*italic*` | `{i italic}` | |
| `` `code` `` | `[code]` | |
| ``` ```lang\n… ``` ``` | `{[ … ]}` + banner | odoc ignores `lang`; non-OCaml blocks get `{b ⚠ in C}` |
| `# H1` / `## H2` / … | `{1 …}` / `{2 …}` … | normalised: shallowest level → `{1}`, cap `{5}` (§6.6); only meaningful in module docs — item docs demote headings to paragraphs (§4.3) |
| `- item` / `1. item` | `- item` / `+ item` | odoc shortcut syntax |
| `> quote` | (no blockquote in odoc) | render as indented `{i …}` or a lead-in |
| `[text](https://url)` | `{{:url}text}` | |
| `[text](class.X.html#anchor)` | `{{:https://docs.gtk.org/<ns>/class.X.html#anchor}text}` | gi-docgen page link → upstream URL (§6.3) |
| `![alt](img)` | `{image:url}` or `{i alt}` | screenshots special-cased (§3.8) |
| `::: warning …` | `{b Warning.} …` | no admonition in odoc |
| `---` (hr) | (omit or `{v ---- v}`) | rare |
| table | `{t …}` light syntax | confirm volume |
| odoc specials `{ } [ ] @` | `\{` `\}` `\[` `\]` `\@` | must escape in prose |

Real formatting example — `Gtk.Button` class doc:

GIR:
```
The `GtkButton` widget can hold any valid child widget.

# Shortcuts and Gestures

The following signals have default keybindings:

- [signal@Gtk.Button::activate]
```
odoc:
```ocaml
(** The [GtkButton] widget can hold any valid child widget.

    {1 Shortcuts and Gestures}

    The following signals have default keybindings:

    - {!Ocgtk.Button.class-type-button_t.method-on_activate} *)
```

**Decision:** translate every markdown construct above; escape odoc specials.

**Alternatives considered and dismissed:**
- *Pass markdown through.* Dismissed (§3.3): odoc is not markdown; `@param`
  would be misparsed as a tag, `#`/code fences would not render, etc. This is
  the load-bearing constraint of the design.

### 6.2 Code blocks

GIR (real, `Gtk.AboutDialog.set_translator_credits`):
```
```c
GtkWidget *about = gtk_about_dialog_new ();
gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
                                         _("translator-credits"));
```
```
odoc (odoc ignores the language; flag non-OCaml):
```ocaml
(** {b ⚠ The following code is in C}

    {[ GtkWidget *about = gtk_about_dialog_new ();
        gtk_about_dialog_set_translator_credits (GTK_ABOUT_DIALOG (about),
                                                  _("translator-credits")); ]} *)
```

**Decision:** fenced code → `{[ … ]}`; prepend a `{b ⚠ in <lang>}` banner for
non-OCaml blocks (gtk-rs does this; otherwise odoc renders C as if it were
OCaml).

**Alternatives considered and dismissed:**
- *Drop the language banner.* Dismissed: misleading — odoc would syntax-style
  C as OCaml.
- *Drop non-OCaml blocks entirely.* Dismissed: loses real content.

### 6.3 gi-docgen page links (relative `.html`)

GIR (real, `Gtk.Application.get_menu_by_id`):
```
See [the section on Automatic resources](class.Application.html#automatic-resources)
for more information.
```
These are relative URLs to gi-docgen-generated HTML pages, not OCaml entities.
Map to the **upstream docs site** (the gi-docgen `baseURLs` idea):

```ocaml
(** See {{:https://docs.gtk.org/gtk4/class.Application.html#automatic-resources}
    the section on Automatic resources} for more information. *)
```

**Decision:** relative `.html` links → external `{{:baseURL + path}label}`
using a per-namespace upstream base URL table. Pure `https://…` markdown
links map directly to `{{:url}label}`.

**Alternatives considered and dismissed:**
- *Drop the link, keep the text.* Dismissed: loses navigation to the
  upstream reference, which is genuinely useful.
- *Resolve `class.X.html` to an internal odoc ref.* Dismissed: the `#anchor`
  has no odoc equivalent, and the `.html` denotes a gi-docgen page, not an
  OCaml entity; mapping it internally loses the anchor and is fragile.

**Outstanding questions:**
- Confirm the exact per-namespace upstream base URLs (Gtk/Gdk/Gsk →
  `https://docs.gtk.org/gtk4/`, Pango → `https://docs.gtk.org/Pango/`, Gio →
  `https://docs.gtk.org/gio/`, GdkPixbuf → `https://docs.gtk.org/gdk-pixbuf/`,
  Graphene → ?). Graphene has no gi-docgen site; fall back to keeping the text.

### 6.4 Admonitions, screenshots, tables

See §3.3 (admonitions → `{b Type.}`), §3.8 (screenshots → `{i alt}`), and the
table row above.

### 6.5 Legacy sigils → code (with resolution where possible — §7)

Per §3.5 and §7: `#Type`/`%CONST`/`#Type:prop`/`#Type::sig` are *attempted*
for resolution; on miss they become `[code]`. `@param`/`symbol()` become
`[code]` (always, in v1) because `@` is an odoc tag sigil and `symbol()`
needs a c-index. The `@param` conversion is **mandatory** regardless of
format: a bare `@self` would be misparsed by odoc as a tag.

### 6.6 Headings (interaction with the page model)

Measured in the corpus: **142 `<doc>` elements contain markdown headings** —
overwhelmingly entity-level docs (Gtk: 112 class + 6 interface + 1 property;
Gio: 8 class + 3 interface + 1 constructor + 1 record; Gdk 4 class; Gsk 1
class; GdkPixbuf 2 class + 1 record; Graphene 2 `<docsection>`). Level
counts: H1×174, H2×158, H3×17; 11 docs mix levels (e.g. `# CSS nodes` on
one class, `## CSS nodes` on its sibling). **No doc begins with a heading**
— upstream always opens with a prose synopsis.

How they interact with the odoc page model (§4.3, §11):

- Each generated module page already carries an implicit level-0 title
  (the module name). GIR headings therefore map to **page sections**, not
  page titles, and are **normalised**: the doc's shallowest markdown level
  maps to `{1}`, deeper levels keep their relative offsets, capped at
  `{5}`. Literal level-preservation would produce inconsistent TOC
  nesting across pages, because upstream mixes `#`/`##` for the same kind
  of section.
- **Entity docs** (module comments, §11.1): headings work — page sections
  + local-TOC entries. **Never emit a leading entity heading** (the PR
  #155 spec's `{1 <Button>}` style): the page title already names the
  entity, and a doc that starts with a heading loses its synopsis
  (§4.3). Upstream never starts heading-first, and we do not create it.
- **Member docs** (item comments): odoc silently demotes headings to
  plain paragraphs — the id is dropped too, so no anchors are possible
  (§4.3; the manual's rule: "a comment attached to a declaration
  shouldn't contain any heading"). The options, in decreasing order of
  value:
  1. **`{b …}` bold lead-in paragraph** — the best formatting odoc
     gives item docs; renders, costs nothing, deterministic. **This is the
     v1 rule.**
  2. *`{b …}` plus an upstream deep link* — since in-odoc anchors are
     impossible, a member doc with sections can append
     `{{:https://docs.gtk.org/<ns>/…}upstream section}` using the §6.3
     external-URL machinery, recovering the "jump to the section"
     navigation that other ecosystems get natively.
  3. *Emit `{1:label …}` anyway* — strictly worse: renders as a plain
     paragraph *without* the bold (probe, §4.3); the label is dropped.
  4. *Special-case via overrides* — viable because the corpus impact is
     two docs (below), but no need if (1) is acceptable.

  What other binding ecosystems do with the same member doc
  (`GtkDialog:use-header-bar`, whose GIR doc contains `## Creating a
  dialog with headerbar`), all verified on their live rendered docs:

  | Ecosystem | Renderer | Same heading renders as |
  |---|---|---|
  | C upstream (gi-docgen) | Python-Markdown | real heading on the property page |
  | Rust (gtk-rs `gir`) | rustdoc | real heading, auto-anchor + section list |
  | Python (PyGObject docs) | Sphinx | real heading |
  | Java (java-gi) | javadoc | heading preserved |
  | OCaml (ocgtk) | odoc 3.2.1 | **plain paragraph, anchor dropped** |

  odoc is the outlier because its item-doc model has no heading concept
  at all — every markdown-native pipeline preserves what upstream wrote,
  and we cannot. This is the documented trade-off of the odoc page model;
  the `{b}` lead-in is the honest ceiling for v1. Corpus impact: only 2
  member-level docs have headings (one property, one constructor).
- Prose after a heading must start on its own line (§4.3); the emitter
  puts a newline after the heading text.
- `<docsection>` (Graphene, 2) is a GIR element for standalone doc
  sections not attached to any symbol — fold into the namespace
  `index.mld` content (or drop for v1); no generated symbol carries them.

**Decision:** normalise GIR headings to `{1}`-based page sections in entity
docs; `{b …}` lead-ins in member docs; never a leading heading.

**Alternatives considered and dismissed:**
- *Literal level mapping (H1→`{1}`, H2→`{2}`).* Dismissed: upstream level
  usage is inconsistent for the same section kind; TOC nesting would
  differ from page to page for no content reason.
- *Strip headings to paragraphs everywhere.* Dismissed: 142 docs with real
  section structure (CSS nodes, Shortcuts and Gestures, Automatic
  resources) would lose their navigation.
- *Heading syntax in member docs.* Dismissed: odoc demotes them to
  paragraphs silently (§4.3) — emit what renders.

**Outstanding questions:**
- None blocking v1. (The Graphene `<docsection>` fold is a small design
  note for the `index.mld` planning.)
- Minor upstream contribution to consider: odoc demotes item-doc headings
  *silently* — a warning there (like the one for `{0}` in module docs)
  would have caught this class of mistake; worth a low-priority odoc
  issue, but nothing depends on it.
- Whether to adopt member-doc option (2) (`{b}` + upstream deep link for
  the 2 affected docs) — a small v1.1 refinement; decide with the first
  `dune build @doc` inspection of those two pages.

---

## 7. Cross-reference resolution design

This section defines the resolver: how a GIR symbol reference (gi-docgen
`[fragment@…]` or a legacy sigil) becomes an odoc `{!…}` path, and what
happens when it cannot.

### 7.1 The unified resolver

There is **one resolver** for both families. Its contract:

```
resolve : (kind_hint, namespace, symbol, member?) -> {!path} option
```

It consults the available indices (§7.4, §7.5) and the deterministic name
translators (§2.3); on any miss it returns `None`, and the emitter renders the
original `[endpoint]` text as an odoc inline-code span (gi-docgen parity).

The fragment keyword (§3.4) supplies `kind_hint` for gi-docgen links. For
legacy sigils, the kind comes from the indices (`#Type` → look up the type's
kind; `%CONST` → constant; `#Type:prop`/`#Type::sig` → the type's kind plus a
deterministic member name).

### 7.2 The fragment keyword gives the kind

For every gi-docgen fragment except `[id@]` and `[type@]`, the keyword *is* the
kind, so the module family is selectable with no lookup. With `P` the
package module of the endpoint's namespace (`Ocgtk`, `Ocgdk`, …; §2.3), `T`
the type's module name and `t` its lowercased form, the target is (the
column is the layer of the doc being emitted, §7.8):

| Fragment | From an L2 doc | From an L1 doc |
|---|---|---|
| `[class@Ns.Type]`, `[iface@…]`, `[struct@…]` | `{!P.T.class-type-t_t}` | `{!P.Raw.T}` |
| `[method@Ns.Type.m]` | `{!P.T.class-type-t_t.method-m}` | `{!P.Raw.T.m}` |
| `[ctor@Ns.Type.c]` | `{!P.T.c}` (module-level `val`) | `{!P.Raw.T.c}` |
| `[signal@Ns.Type::s]` | `{!P.T.class-type-t_t.method-on_s}` | `{!P.Raw.T.on_s}` |
| `[property@Ns.Type:p]` | the property's accessor method (below) | the property's accessor (below) |
| `[enum@Ns.E]`, `[flags@…]` | `{!P.Enums.e}` | same |
| `[enum@Ns.E.MEMBER]` | `{!P.Enums.type-e.constructor-MEMBER}` | same |
| `[const@Ns.C]` | `{!P.Constants.c}` | same |

`m`, `c`, `s` and `p` go through the name translators of §2.3
(`sanitize_identifier`, `ocaml_property_name`, `on_` prefix). Records
(`[struct@]`) route exactly like classes: every generated record has an L2
class type (`Ocgdk.Rgb_a.rgb_a_t`, `Ocgtk.Text_iter.text_iter_t`). A record
the generator does not emit (class structs such as `GtkButtonClass`, private
structs) has no target and falls back to code (§7.6); the resolver checks
that the type is known (§7.4, §7.5) before computing a path.

**Property targets.** A property has no page of its own; it links to its
accessor, and the accessor carries the property's doc. The accessor is
chosen from the live generation context (§7.5), in this order:

1. the GIR method that claims the property as its getter
   (`get-property="p"`, the `get_property` field of `gir_method`), e.g.
   `[property@Gtk.Button:label]` → `get_label`;
2. the generated getter when no method claims it and the property is
   readable — L2 `method p` (no `get_` prefix), L1 `get_p`;
3. the setter by the same two rules (`set-property` method, else the
   generated `set_p`) for a write-only property;
4. otherwise (construct-only and not readable, or filtered by
   `filtering.ml`: array-typed or an unsupported type) no target: code.

This needs the property's class and its methods, so it works only for the
current namespace in v1. Cross-namespace property references fall back to
code; they are rare (7 of 570 `[property@]` fragments in the bundled GIR, all
from Gtk) and the v2 emitted-symbol map (§7.7) covers them.

**Not generated, always code (out of scope):**

- `[func@Ns.f]`, `[func@Ns.Type.f]` — neither namespace-level nor
  class-static functions are generated (§2.1).
- `[callback@…]`, `[vfunc@…]` — not generated.
- `[alias@…]` / `[error@…]` — not generated; errors are bound by hand in
  `ocglib/gError.ml`.
- `[id@c_symbol]` — needs a C-symbol index (§7.5); code in v1.
- `[type@Ns.Type]` — ambiguous kind; resolved by looking the type up
  (§7.4, §7.5) like a `#Type` sigil, else code.

### 7.3 Stable shim paths — no SCC resolution needed

Per §2.2, every class has a **stable shim module name** that hides the
SCC combined module. So the reference path is a **pure function of the type
name + kind + layer**, e.g.:

- `[class@Gtk.Widget]` → `{!Ocgtk.Widget.class-type-widget_t}` (shim, not
  the combined `Event_controller_and__…_and__widget` module)
- `[class@Gtk.Window]` → `{!Ocgtk.Window.class-type-window_t}` (shim)
- `[ctor@Gtk.Window.new]` → `{!Ocgtk.Window.new_}` (L2 shim) or
  `{!Ocgtk.Raw.Window.new_}` (L1 shim)

The combined-module name **never** appears in a doc reference. This holds for
both cross-namespace and internal links.

**Decision:** compute paths from stable shim names. Do not consult the
SCC/dependency-analysis tables for the doc path.

**Alternatives considered and dismissed:**
- *Reference the SCC combined module directly.* Dismissed: shims exist
  precisely to provide stable names; the combined name is an implementation
  detail and would produce ugly, brittle references.
- *Require an SCC lookup for cross-namespace refs.* Dismissed: the shim names
  are stable across namespaces, so no lookup is needed.
- *Consult a symbol table to compute the path.* Dismissed: the path is
  deterministic from the name translators + the fragment kind.

**Outstanding questions:**
- None for path computation. (The `gir_context` already holds the SCC table
  for internal use, but the doc path does not need it.)

### 7.4 Role of `.refs` (narrow, optional)

`.refs` (§2.4) is used **only** to learn the **kind of a cross-namespace
legacy sigil** where the fragment does not already state it — specifically:
- `#TypeName` where `TypeName` is in another namespace → match `cr_c_type`
  (or `cr_name`) to get `cr_type` → compute the path.
- `%CONST` where the constant is in another namespace → match `Crt_Constant`
  by name → `{!<P>.Constants.<name>}` (this resolves the heavily-used
  `%GDK_KEY_*` constants cross-namespace).
- The *type* part of `#Type::signal` cross-namespace → `.refs` gives the
  type's kind; the signal name is then deterministic (`on_<s>`). A
  cross-namespace `#Type:property` still falls back to code, because the
  accessor depends on the type's methods (§7.2).

`.refs` does **not** help for: enum/bitfield **members** (`%ENUM_MEMBER`),
`symbol_name()`, `[id@…]`, `[type@…]`, or member existence — those need
member-level data (current-ns AST, or a serialized member table in v2). `.refs`
also has no SCC path, but that is moot (§7.3).

**Decision:** load the dependency `.refs` files (already loaded for codegen)
and build a `cr_c_type`/`cr_name` → kind index and a constant-name index. Use
them only for the legacy-sigil kind resolution above. This is a **partial,
cheap win for v1**: it resolves the common `#Type` and the heavily-used
`%GDK_KEY_*` constants, and is not a prerequisite (the translator works without
it, falling back to code).

**Alternatives considered and dismissed:**
- *Require `.refs` for all doc resolution.* Dismissed: the fragment keyword
  gives the kind for gi-docgen links; `.refs` is type-level (no members, no
  SCC path) so it is insufficient for verification anyway.
- *Build a full member-level symbol table for v1.* Dismissed: broken links
  are acceptable for a first pass; defer member-level verification to v2
  (§7.7).
- *Ignore `.refs` entirely for docs.* Dismissed as too pessimistic: the
  `#Type` / `%CONST` resolution it enables is real value for little cost.

### 7.5 Role of the live generation context (current namespace)

For the **current** namespace, the in-process `generation_context` (§2.5) is
richer than `.refs`: it has member lists and real c-identifiers. It supplies:
- the kind of a same-namespace `#Type` / `%CONST` / `#Type:prop` /
  `#Type::sig`,
- the accessor of a same-namespace property (`gir_method.get_property` /
  `set_property`, the property's `readable` / `writable` /
  `construct_only`; §7.2),
- a same-namespace c-symbol index for `symbol_name()` / `[id@…]` (each
  `gir_method`/`gir_function` has `c_identifier`),
- same-namespace enum member c-identifiers for `%ENUM_MEMBER`.

Cross-namespace member/c-symbol resolution is **not** available in v1 (the
other namespaces' member data is not in memory); those references fall back to
code. v2 can serialize a member/c-index (§7.7).

### 7.6 Fallback to inline code on miss

Any reference the resolver cannot satisfy is rendered as the original
`[endpoint]` text in an odoc inline-code span — exactly gi-docgen's behaviour
for the legacy sigils, and odoc's own behaviour for an unresolved `{!…}` is a
warning + code-span-ish text. So a miss is never worse than gi-docgen.

### 7.7 The one residual broken-link source (v1) and the v2 fix

Because paths are deterministic (§7.3) and the fragment kind is known (§7.2)
or resolvable (§7.4/§7.5), the **only** v1 cause of a broken `{!…}` link is a
**filtered/skipped member** (§2.7): a method/property/signal that
`filtering.ml` dropped because of an unsupported parameter/return type. The
computed `{!…method-x}` then points at something that was not emitted; odoc
warns and renders the text. This is acceptable for a first pass.

For a current-namespace reference the resolver can check most of this
itself, from the live context and `filtering.ml`'s predicates (§7.5;
property targets already do, §7.2). The miss is then a code span, not a
broken link. Cross-namespace member references are not checked in v1.

The **v2** refinement (out of scope for the design, but noted) is an
**emitted-symbol → module-path map produced during the generation pass** — a
byproduct of generation, member-level and carrying the real (shim) path. It
would let us either suppress or fall-back-to-code links to filtered members.
This is strictly richer than `.refs` and is the natural successor; `.refs`
itself is not extended for this.

**Decision (v1):** accept broken links to filtered members; do not build the
emitted-map yet.

**Alternatives considered and dismissed:**
- *Track emitted symbols in v1 to suppress broken links.* Dismissed for v1:
  adds a generation-pass coupling for marginal first-pass benefit; the user
  accepts broken links.

**Outstanding questions:**
- None that block v1. (v2 emitted-map design is a later concern.)

### 7.8 L1 vs L2 target selection

The target layer depends on **where the doc is emitted** (per the project
decision in the M3 discussion):

- **In an L1 doc** → link to L1 targets: classes, interfaces and records to
  the L1 module (`P.Raw.T`), members to its `external`s and `val`s.
- **In an L2 doc** → link to L2 for everything L2 has: classes, interfaces
  and records (`P.T.class-type-t_t`), their methods, signals and property
  accessors, and constructors (`P.T.c`, the module-level `val`).
- **Either layer** → enumerations, bitfields and constants have one home
  (`P.Enums`, `P.Constants`), so both layers link there.

Routing table (paths in §7.2):

| entity kind | from an L1 doc | from an L2 doc |
|---|---|---|
| class / interface / record | `P.Raw.T` | `P.T.class-type-t_t` |
| method / signal / property accessor | `P.Raw.T.<name>` | `P.T.class-type-t_t.method-<name>` |
| constructor | `P.Raw.T.<name>` | `P.T.<name>` |
| enum / bitfield / member | `P.Enums.…` | `P.Enums.…` |
| constant | `P.Constants.<name>` | `P.Constants.<name>` |
| function / callback | not generated: code | not generated: code |

References resolve package-wide (§4.3, second probe), so the layer rule is a
choice of what the reader is shown, not a constraint: `ocgtk.raw` cannot
depend on `ocgtk`, but an L1 doc can still link into it.

The resolver is one function parameterised by (layer, entity-kind).

**Decision:** parameterise the resolver by the layer of the doc being emitted.

**Alternatives considered and dismissed:**
- *Always link to L2.* Dismissed: an L1 reader working with `t` and
  `external`s would be sent to class pages for every type mention.
- *Always link to L1.* Dismissed: loses the L2 class-method navigation that an
  L2 user expects.

**Outstanding questions:**
- None. Records get an L2 class type (checked across all packages: every L1
  module has an L2 module of the same name with a class type; only the L2
  `Constants` module has none).
  Functions and callbacks are not generated and are out of scope until they
  are.

### 7.9 Worked reference examples (real GIR → resolved odoc)

All examples real; context = L2 doc. Every target below exists in the
generated bindings.

```
[class@Gtk.Button]                → {!Ocgtk.Button.class-type-button_t}
[iface@Gio.ActionGroup]          → {!Ocgio.Action_group.class-type-action_group_t}
[struct@Gtk.TextIter]            → {!Ocgtk.Text_iter.class-type-text_iter_t}   (record, cyclic-group shim)
[struct@Gdk.RGBA]                → {!Ocgdk.Rgb_a.class-type-rgb_a_t}
[ctor@Gtk.Builder.new_from_file] → {!Ocgtk.Builder.new_from_file}   (L2 val)
[method@Gtk.AboutDialog.set_logo_icon_name]
  → {!Ocgtk.About_dialog.class-type-about_dialog_t.method-set_logo_icon_name}
[method@Gtk.Widget.show]         → {!Ocgtk.Widget.class-type-widget_t.method-show}   (cyclic-group shim, §4.3)
[signal@Gtk.Button::activate]    → {!Ocgtk.Button.class-type-button_t.method-on_activate}
[property@Gtk.Button:label]      → {!Ocgtk.Button.class-type-button_t.method-get_label}   (claimed by get_label)
[property@Gtk.Settings:gtk-alternative-button-order]
  → {!Ocgtk.Settings.class-type-settings_t.method-gtk_alternative_button_order}   (generated getter)
[enum@Gtk.Orientation]           → {!Ocgtk.Enums.orientation}
[enum@Gtk.Orientation.HORIZONTAL] → {!Ocgtk.Enums.type-orientation.constructor-HORIZONTAL}
[flags@Gdk.PaintableFlags]       → {!Ocgdk.Enums.paintableflags}
[const@Gtk.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]
  → {!Ocgtk.Constants.accessible_attribute_overline_none}
[func@Gtk.Window.list_toplevels] → [Gtk.Window.list_toplevels]   (not generated; code)
[callback@Gtk.ListBoxUpdateHeaderFunc] → [Gtk.ListBoxUpdateHeaderFunc]   (not generated; code)
[vfunc@Gtk.Widget.measure]       → [Gtk.Widget.measure]   (not generated; code)
[id@gtk_window_new]              → [gtk_window_new]   (v1 code; v2 c-index)

#GtkWidget (legacy)              → {!Ocgtk.Widget.class-type-widget_t}   (via .refs/live AST kind)
#GObject  (legacy, not generated) → [GObject]   (code)
%GDK_KEY_a (legacy constant)     → {!Ocgdk.Constants.key_a}   (via .refs constant index)
%GTK_ALIGN_CENTER (enum member)  → [GTK_ALIGN_CENTER]   (cross-ns; v1 code; v2 member table)
@self / @amount / @row           → [self] / [amount] / [row]   (always code; @ is odoc tag sigil)
gtk_about_dialog_new()           → [gtk_about_dialog_new]   (v1 code; v2 c-index)
```

In an L1 doc, the class/interface/record, method, signal, property and
constructor rows flip to `P.Raw.T` and its `external`s / `val`s
(`{!Ocgtk.Raw.Button}`, `{!Ocgtk.Raw.Button.get_label}`,
`{!Ocgtk.Raw.Settings.get_gtk_alternative_button_order}`,
`{!Ocgtk.Raw.Button.on_activate}`); the enum and constant rows are the same.

A flags member (`Gdk.PaintableFlags.SIZE`) is a tag of the
`<flags>_flag` type, not of the list type:
`{!Ocgdk.Enums.type-paintableflags_flag.constructor-SIZE}`.

---

## 8. Deprecation and stability mapping (summary)

(See §3.6 for the data and decision.) Map GIR `deprecated-version` attribute
+ `<doc-deprecated>` sibling element to a single odoc `@deprecated` tag:

```ocaml
(** @deprecated Since 4.10: Use
    {!Ocgtk.Calendar.class-type-calendar_t.method-set_date} instead. *)
```

`<doc-deprecated>` prose reuses the §6/§7 translator (it contains links).
Implementation-note (for later planning): add `doc_deprecated : string option`
and `deprecated_version : string option` to the AST nodes (currently only
`version` is captured), and a `<doc-deprecated>` dispatch arm to the parser.

Stability (§3.10): no tag. `Unstable` maps to a prepended `{i Unstable
API.}` note in the doc body. Zero occurrences in the bundled corpus today, so
this is forward-compatibility only.

**Outstanding questions:**
- Confirm the full set of AST nodes carrying `deprecated`/`deprecated-version`
  attributes (methods, functions, classes, interfaces, properties, signals,
  enum members, constants…).

---

## 9. Parameter / return-value docs (summary)

(See §3.7 and the probe findings §4.3.) Map `<doc>` on
`<parameter>`/`<return-value>` to odoc `@param` and `@return` tags when the
OCaml arg name matches the GIR param name; else fold the prose into the
body. The prose itself goes through the §6/§7 translator (`@amount` →
`[amount]`, links resolved, etc.).

The probe (§4.3) settles how odoc processes these tags, and the answer
makes the name-match gate load-bearing rather than stylistic:

- odoc **renders `@param` exactly as written**, with **no validation**
  against the signature — a wrong parameter name is published verbatim,
  silently, and a `@param` renders even on a class type that has no
  parameters. There is no safety net; the emitter owns name correctness.
- Tags are **terminal** (§4.3): prose after a tag belongs to the tag until
  the next tag. Comments are therefore assembled in a fixed order —
  synopsis/body first, then `@param`s in declaration order, then
  `@return`, then `@since`/`@deprecated` — and any `@word` inside a tag
  body must be neutralised (§6.5 applies inside tags too, or the text is
  re-parsed as a nested tag).
- For L1 positional `external`s (no labelled arguments in the signature),
  a `@param` cannot mismatch anything — the tag name is documentation,
  not a claim about a label — so the GIR parameter name is emitted as-is.

**Outstanding questions:**
- Confirm generated signatures preserve GIR parameter names (so `@param`
  tags line up). Decide per-case for elided length params (P2) and renamed
  args.

---

## 10. `@since` (generalisation of existing behaviour)

(Already done for constants via `constant_code.ml:emit_doc`.) Generalise to
all entities: GIR `version` attribute → odoc `@since <version>`. Combined with
deprecation, a method doc may carry both `@since` and `@deprecated`.

---

---

## 11. The page model — where each translated doc attaches

The translation (§6) and the resolver (§7) produce a doc *string*; this
section defines where that string physically goes. Everything below is an
odoc page in the `dune build @doc` site. The dune `(documentation)` stanza
and `.mld` wiring that surrounds these pages stays out of scope (§1); the
attachment points themselves do not.

### 11.1 The two layers

The same GIR `<doc>` text lands on both generated layers of a type through
one shared pipeline; only the reference target paths (§7.8) and the `self`
adaptation differ:

- **L1** (`<pkg>/raw/generated/<type>.mli`, one module per type,
  `Oc<ns>.Raw.<Type>`): the entity doc becomes the module's leading comment;
  each `external`/`val` carries its member doc or a synthetic synopsis
  (§12). C-addressed prose is mechanically adapted: `GtkButton *button` →
  the module's `t`, `@button` → the argument.
- **L2** (`<pkg>/generated/<type>.mli`, `Oc<ns>.<Type>`): the same entity
  doc becomes the file's leading comment, and the `class type <type>_t`'s
  preceding comment; method prose is adapted to the method form —
  `gtk_button_set_label(button, label)` → `[set_label label]`, `@button` /
  `GtkButton *button` → the implicit `self`.
- **Package main modules** (`Ocgtk`, `Ocgdk`, …) are generated by dune from
  the library's modules, so they carry no per-module comment; the package
  `index.mld` and the generated `modules.mld` list (with each module's
  synopsis) stand in for them. `Oc<ns>.Raw` is a generated module of
  aliases (`module Button = Ocgtk_raw.Button`); odoc renders an alias as a
  link to the aliased module's page, which carries the docs.
- **Opening rule:** every module-level doc opens with the synopsis
  paragraph — never a heading. The page title already names the entity
  (implicit level 0), and a doc that starts with a heading loses its
  synopsis on index pages (§4.3, §6.6). This supersedes the PR #155
  spec's `{1 <EntityName>}` leading heading.

### 11.2 Grouping headings

Within an `.mli`, members are grouped under odoc floating headings in a
fixed order — `{1 Hierarchy accessors}`, `{1 Constructors}`, `{1 Methods}`,
`{1 Properties}`, `{1 Signals}` — each emitted only when its section is
non-empty. The existing plain separator comments (`(* Methods *)`,
`(* Properties *)` in e.g. `button.mli`) are replaced by these; a floating
grouping heading is followed by exactly one blank line. odoc is strict about
placement: no blank line between a doc comment and its element, exactly one
blank line between elements/sections.

Probe-confirmed (§4.3): floating `(** {1 …} *)` comments render as page
headings and appear in the local TOC.

### 11.3 Cyclic entities: the shim is the primary page

SCC-combined files (§2.2) need a rule for where the entity doc lands,
because the public name and the physical file differ:

- **L1**: the combined file (`raw/generated/<first>_and__<rest>.mli`) is
  `module rec A : sig … and B : sig … end`; each inner module is already its
  own odoc page. The entity doc is the **first special comment inside the
  inner module's `sig`** — the reliable form for a module-signature doc. The
  L1 **shim** (`raw/generated/<type>.mli`, `include module type of struct
  include <Combined>.<Type> end`) is the public page `Oc<ns>.Raw.<Type>`
  and repeats the entity doc as its leading comment. No physical splitting
  is required.
- **L2**: the combined file's `class type … and …` chain renders as several
  class types on **one** module page, so the standalone **shim**
  (`generated/<type>.mli` re-exporting `class type <type>_t`) is the
  authoritative public page `Oc<ns>.<Type>`, and §7.3 already resolves
  references to the shim path. The shim's single, non-`and`-chained
  `class type` takes a preceding doc comment reliably. The combined file's
  chained class types repeat the entity doc **best-effort** (preceding
  comment attempted on each `and`-chained `class type`; fallback: a leading
  `{1 …}` heading comment inside the `object … end` body) so the combined
  page is not bare — the shim remains authoritative.

**Decision:** duplicate the entity doc deliberately — shims authoritative at
both layers, combined files best-effort. The duplication is
regenerated, not hand-written, and guarantees that every public path shows
documentation.

**Alternatives considered and dismissed:**
- *Document only the combined file.* Dismissed: on L2 it is one page for
  several classes, and its `_and__` module name never appears in public
  paths (§7.3) — users would land on an undocumented shim.
- *Physically split the combined files.* Dismissed: the `module rec` /
  `class type … and` structure is what breaks the dependency cycle, and the
  L1 inner modules already paginate without splitting.

**Outstanding questions:**
- Whether odoc attaches a preceding comment to an **`and`-chained** class
  type (the best-effort form) — **resolved by the probe (§4.3): it does**,
  cleanly, in odoc 3.2.1; `module rec` inner-signature comments attach as
  the inner module's doc too. The `object … end` fallback stays as
  insurance for future odoc versions, not as a load-bearing form.

### 11.4 Inherits / Implements blocks

Each L2 class/interface doc carries the GIR hierarchy as cross-references:

- `{1 Inherits}` — one `{!…}` reference to the parent's L2 class type (from
  the `parent` attribute); interfaces with a prerequisite interface use the
  same block.
- `{1 Implements}` — one reference per `<implements>` interface.
- Both blocks are omitted when empty. Resolution is L2 → L2 per the §7.8
  routing (site layer picks target layer), including cross-namespace
  parents. The data is already in hand: the live AST for the current
  namespace, and `.refs`'s `Crt_Class of { parent; implements }` (§2.4) for
  cross-namespace targets.

**Decision:** emit the blocks mechanically from the hierarchy data; no
prose, just heading + references.

**Alternatives considered and dismissed:**
- *Narrative sentence ("Inherits from …").* Dismissed: heading + reference
  blocks render as navigation in odoc, which is the point.
- *L1-only or no hierarchy surfacing.* Dismissed: the L2 class API is where
  inheritance matters to the user, and the data is free.

### 11.5 Page inventory

| Page | Doc source |
|---|---|
| `<pkg>/index.mld` + generated `modules.mld` (package root) | hand-written intro; module list with synopses (§11.1) |
| `<pkg>/enums/generated/oc<ns>_enums.mli` (`Oc<ns>.Enums`) | each `<enum>`/`<bitfield>` type + `<member>` docs |
| `<pkg>/generated/constants.mli` (`Oc<ns>.Constants`) | already emitted (`constant_code.ml`); gains the §6 translation |
| `<pkg>/raw/generated/<type>.mli` (L1; the **shim** for cyclic entities) | entity `<doc>` + member docs (§11.1) |
| `<pkg>/generated/<type>.mli` (L2; the **shim** for cyclic entities) | entity `<doc>` + Inherits/Implements (§11.4) |
| `<pkg>/raw/generated/<first>_and__<rest>.mli` (L1 combined) | per-participant docs lifted into each inner `sig` (§11.3) |
| `<pkg>/generated/<first>_and__<rest>.mli` (L2 combined) | best-effort duplicate (§11.3) |

---

## 12. Synthetic synopses for generated items with no GIR doc

Generated items that have no upstream `<doc>` still need a one-line synopsis
(Merlin tooltip / odoc index), derived from the generated signature. The
synopsis is a single `[f x]`-style line and carries no tags. It is emitted
**only** when the GIR source has no doc; when GIR text exists it is used
as-is.

| Item | Actual shape today (verified) | Synthetic synopsis |
|---|---|---|
| Hierarchy accessor | L2 `method as_button : Raw.Button.t` (`ocgtk/generated/button.mli`) — the PR spec assumed an L1 `external`; in this codebase they are L2 methods | `[as_<type>] returns [self] typed as [Raw.<Type>.t].` |
| Enum/bitfield converters | `val <name>_of_int : int -> <name>` / `<name>_to_int` in `Oc<ns>.Enums` | `[of_int n]` converts the C integer `[n]` to the variant; `[to_int v]` converts back |
| Signal connector | `val on_<sig>` / `method on_<sig>` — currently emitted with **no doc at all** | `[on_<sig> ~callback …] connects [callback] to the [<sig>] signal.`, then the signal's GIR doc as body if present |
| Docless `new_*` constructor | currently an unconditional `(** Create a new <Entity> *)` that ignores `ctor_doc` (e.g. `pixbuf_loader.mli`), even though `ctor_doc` is parsed | GIR doc when present; else `[new_<…> args] creates a new [<entity>].` |

**Decision:** centralise the synopsis producers; replace the unconditional
`Create a new %s` text and the docless signal connectors with the rules
above.

**Outstanding questions:**
- Property getter/setter pairs: `prop_doc` is parsed then dropped at
  construction (`gir_parser.ml` builds `prop_doc = None`); decide whether a
  docless property's getter and setter share one adapted doc or get
  per-accessor synopses.

---

## 13. Errors: `throws`, `@return`, and why generated code never documents `@raise`

Generated bindings never raise (§2.8): `throws="1"` callables are bound
returning `('a, GError.t) result`. Documenting an exception the code cannot
throw would be actively misleading, so the generated pipeline **never emits
an `@raise` tag** — not from `throws`, not inferred from prose.

- **`throws` callables:** the `@return` tag describes both branches —
  `@return [Ok v] on success, [Error e] on failure` (`[Ok ()]` for a `unit`
  payload), with `v` from the GIR return-value doc when available (§9).
  Measured `throws="1"` counts: Gio 763, Gtk 62, GdkPixbuf 32, Gdk 25,
  Pango 6, Gsk 4, Graphene/PangoCairo/cairo 0 — mostly a Gio concern.
- **Non-`throws` callables:** the GIR return-value doc (§9), or a short
  type-derived line (`string option` → "the value, or `[None]` if unset");
  omit `@return` when nothing meaningful can be derived — a vacuous tag is
  worse than none.
- **Handwritten code raises and documents itself, by hand:** the exceptional
  raisers — the `ocglib/` integer and GVariant wrappers (`@raise
  Invalid_argument`, `@raise Failure` in their handwritten `.mli`) and
  `ocgtk/core/main.ml` (raises on GTK initialisation failure, e.g. when the
  C-level `gtk_init` fails or another internal C issue) — keep hand-written
  `@raise` tags. The generator has no part in them: an `@raise` appearing in
  generated output is a bug.

**Decision:** `@raise` is a handwritten-code-only tag; the generated pipeline
surfaces errors exclusively via `@return` on the `result` type.

**Alternatives considered and dismissed:**
- *Emit `@raise GError` for `throws`.* Dismissed: describes an exception the
  binding never raises.
- *Fold the error branch into body prose only.* Dismissed: the `result`
  return type is the first thing a caller must handle; `@return` is where
  odoc users look for it.

---

## 14. Consolidated outstanding questions

These are the open items that should be resolved (mostly by a `dune build
@doc` baseline probe) before the mapping is finalised:

1. **`dune build @doc` baseline** — **resolved by the probe (§4.3)**:
   cross-library `{!…}` references resolve in a two-library workspace;
   the working forms are recorded there.
2. **odoc reference kind for class methods** — **resolved (§4.3)**:
   `{!method:P.C.m}` and `{!P.class-type-C.method-m}` resolve; the hash
   form `{!P.C#m}` does not.
3. **odoc reference form for polymorphic-variant constructors** (enum
   members) — **resolved (§4.3)**: `{!P.type-t.constructor-X}` and
   `{!constructor:P.t.X}` both resolve; `[NAME]` code stays the fallback
   for exotic targets (§7.9).
4. **Module layout of standalone functions, records, callbacks** —
   **resolved (§2.1, §7.2)**: records are per-type modules at both layers;
   functions and callbacks are not generated, so `[func@…]` and
   `[callback@…]` are out of scope and render as code.
5. **Records in L2?** — **resolved (§7.8)**: every generated record has an
   L2 class type and routes like a class.
6. **`deprecated`/`deprecated-version` AST capture** — confirm they are not
   on `gir_method`/etc. today; enumerate which nodes carry them (§8).
7. **Parameter-name alignment** — confirm generated signatures preserve GIR
   param names; decide per-case for elided/rename args (§9).
8. **Per-namespace upstream docs base URLs** — confirm exact URLs for the
   gi-docgen page-link mapping (§6.3); Graphene has no gi-docgen site.
9. **Tables / definition-lists volume** — confirm frequency and pick an odoc
   rendering before finalising (§3.3).
10. **`.refs` vs filtering order** — confirm `.refs` is built such that
    `#Type` resolution targets types that are actually generated (types are
    usually generated even when methods are filtered) (§3.5).
11. **odoc attachment to `and`-chained class types** — **resolved (§4.3)**:
   preceding comments attach cleanly in odoc 3.2.1; the `object … end`
   fallback (§11.3) stays as insurance.
12. **Hierarchy-accessor shape** — the PR #155 spec assumed L1 `external`
    accessors; in this codebase `as_<type>` are L2 methods (§12) — write the
    synthetic synopsis for the method form.
13. **Property getter/setter docs** — `prop_doc` is parsed then dropped
    (§12); decide shared-adapted vs per-accessor docs.
14. **Stability attribute spelling** — zero corpus hits (§3.10); confirm the
    GIR schema spelling before capture.

---

## 15. Decisions summary (quick reference)

- **Target:** odoc (not a markdown sidecar). Translation, not pass-through.
- **Format:** format-agnostic translator handling both gi-docgen `[frag@]`
  and legacy sigils; `<doc:format>` parsed for diagnostics only; default
  gi-docgen when absent.
- **Legacy sigils:** attempt resolution (`.refs` for cross-ns kind, live AST
  for current-ns), fall back to `[code]` on miss. Guard rules prevent
  URL/heading false positives. `@param`/`symbol()` → `[code]` in v1.
- **Reference paths:** deterministic from stable **shim** module names
  (`Oc<ns>.<Type>`, `Oc<ns>.Raw.<Type>`, `Oc<ns>.Enums`, `Oc<ns>.Constants`)
  + the fragment kind (or `.refs`/AST kind for legacy sigils) + the name
  translators. **No SCC resolution** (shims hide it). Methods and signals
  use `class-type-<t>_t.method-<m>`. Properties link to their accessor,
  chosen from the live context; cross-namespace properties are code in v1.
- **`.refs`:** optional, narrow — only cross-ns legacy-sigil *kind* and
  constant resolution. Not a prerequisite; not extended for v1.
- **Fallback:** unresolved references → odoc inline code (gi-docgen parity;
  never worse than gi-docgen).
- **Broken links (v1):** only filtered/skipped members. Accepted. v2
  emitted-map suppresses them (out of scope here).
- **L1/L2:** resolver parameterised by the doc's layer; L2 docs link to L2
  for classes, interfaces, records, their members and constructors; L1 docs
  link to L1; both link enums, bitfields and constants to `Oc<ns>.Enums` /
  `Oc<ns>.Constants`. Functions and callbacks are not generated: code.
- **Deprecation:** `deprecated-version` + `<doc-deprecated>` → one
  `@deprecated Since V: prose` tag.
- **Params/returns:** → `@param`/`@return` when arg names match; else fold
  into body. odoc renders tags exactly as written with **zero validation**,
  and tags are terminal — so: prose first, then tags, in fixed order; the
  name-match gate is load-bearing, not stylistic (§9, §4.3).
- **Headings (§6.6):** normalise GIR markdown headings to `{1}`-based page
  sections in entity docs (shallowest level → `{1}`, cap `{5}`); `{b …}`
  lead-ins in member docs (odoc demotes headings there to paragraphs);
  never `{0}` in `.mli`s and never a leading heading — the page title is
  the module name and a heading-first doc loses its synopsis (§4.3).
- **Screenshots:** strip `<picture>`/`<source>`, render `<img alt>` as
  `{i alt}`; config hook for `{image:}` later.
- **Code blocks:** `{[ … ]}` + `{b ⚠ in <lang>}` banner for non-OCaml.
- **Admonitions:** `{b Type.}` lead-in.
- **gi-docgen page links:** → external `{{:baseURL+path}label}` to the
  upstream docs site.
- **`@since`:** generalise the existing constant behaviour to all entities.
- **Page model (§11):** one shared translation; L1 module + member comments,
  L2 file + class-type comments with `self` adaptation; grouping `{1 …}`
  floating headings replace plain separator comments (fixed order, only
  when non-empty); cyclic entities document the **shims** as the
  authoritative pages at both layers, the combined files best-effort.
- **Inherits/Implements (§11.4):** mechanical `{1 Inherits}` / `{1
  Implements}` reference blocks on L2 docs; L2 → L2 resolution, `.refs`
  supplies cross-namespace hierarchy.
- **Synthetic synopses (§12):** one `[f x]`-style line for docless generated
  items (hierarchy accessors, enum converters, signal connectors, docless
  `new_*`); never emitted when a GIR doc exists.
- **Stability (§3.10):** absent from the corpus (zero occurrences); capture
  cheaply if present; `Unstable` → `{i Unstable API.}` prefix; no tag.
- **Errors (§13):** `throws` → `@return [Ok v]` / `[Error e]`; `@raise` is
  never generated — only handwritten modules (`ocglib/`, `ocgtk/core/`) document
  raises, by hand.