(* Doc_translate — pure GIR [<doc>] markdown → odoc markup translation.

   Two pure stages joined by a flat AST: [parse] reads the gi-docgen markdown
   dialect (plus the legacy gtk-doc sigils) into the AST; [render] walks the
   AST to odoc markup. [translate] is their composition, and is the entry
   point emission sites will call (Phase 2 of the M3 plan). The module does
   no I/O, holds no global state, and is deterministic: the same input always
   yields the same output.

   {2 Parse / render split}

   [parse] must not bake in escaping or odoc syntax: markup stays in AST
   nodes ([Code], [Bold], [Link], [Sym_ref], ...), raw prose stays in
   [Text]. [render] must not make parse-time policy decisions: the heading
   policy (GIR plan §6.6) is chosen per [context] at render time. [Ref] is
   produced only by the future cross-reference resolver leg; [parse] never
   emits it. Keeping this line clean is what lets the deferred resolver and
   upstream-URL legs run as pure AST rewrites.

   {2 Heading policy}

   [Entity] docs (module comments) render headings as odoc page sections: the
   doc's shallowest markdown level is normalised to [{1}], deeper levels
   keep their relative offsets, capped at [{5}] (GIR plan §6.6). [Member]
   docs (item comments) render headings as [{b ...}] bold lead-in
   paragraphs — odoc silently demotes headings inside item docs to plain
   paragraphs, so the bold lead-in is the rendering ceiling odoc actually
   supports. [render] is the [Entity] policy (module comments are the
   canonical doc attachment in the emission inventory); [render_as] selects
   the policy explicitly and is what [translate] uses.

   {2 v1 render policy}

   | AST node            | v1 rendering                              | counted |
   |---------------------|-------------------------------------------|---------|
   | [Text]              | odoc-escaped prose: [\{] [\}] [\[] [\@]   | —       |
   | [Code]              | [[code]] ([Inline_code_unbalanced] when the content contains []] | yes |
   | [Bold] / [Italic]   | [{b ...}] / [{i ...}]                     | —       |
   | [Link] (https only) | [{{:url}text}]                            | —       |
   | [Page_ref]          | bare text (link dropped)                  | yes     |
   | [Sym_ref]           | [[endpoint]] code span                    | yes     |
   | [Param_ref]         | [[name]] code span (GIR plan §6.5)        | —       |
   | [Ref]               | [{!path}] (unreachable in v1)              | —       |
   | [Para]              | paragraph (blank line separated)          | —       |
   | [Heading]           | per [context] above                        | —       |
   | [List]              | odoc shortcut lists ([{- item}] / [{+ item}]) | —    |
   | [Code_block]        | [{[ ... ]}] ([Code_block_verbatim] / [Code_block_stripped] on [}]]) | yes |

   Text escaping is exactly the four odoc specials [\{] [\}] [\[] [\@]
   (plan invariant 2). A stray [] in prose is left bare — odoc treats it as
   literal text (it emits a benign warning at worst, never a misparse), and
   code spans manage their own []] via the balance fallback.

   {2 Comment-safety pass}

   The final rendered string is passed through the comment-hazard pass:
   the star-paren / paren-star sequences (the two sequences that would
   terminate or nest an OCaml comment) get a backslash inserted between
   their two characters, exactly like the established [Utils.sanitize_doc].
   This runs once over the whole render output — after every span/block
   transformation — so no fallback can reintroduce a hazard, inside code
   spans and verbatim blocks included (plan invariant 1). The final
   assembled-comment sanitisation that Doc_emit will own in Phase 2 is
   then a second, idempotent pass over the same sequences. A hazard
   sequence in the source is *not* reported as a fallback: the
   neutralisation loses no content and involves no policy trade-off, so it
   stays silent.

   {2 Fallback / warning collection}

   The plan assigns fallback/warning collection to this module but leaves
   the mechanism open. Decision (recorded): every lossy or degraded
   translation is one [fallback] *event* with enough payload to classify and
   count it; events arise in both stages, so both stages have a collection
   variant that returns [t / string] plus the event list while the plain
   signatures stay untouched:

   - [parse_with_fallbacks] collects the parse-time strips (admonitions,
     tables, pictures, images, quotes — constructs the plan strips to plain
     prose at parse, each forward-compatible with the full GIR-PRD mapping
     in a later leg);
   - [render_with_fallbacks] collects the render-time degradations
     ([Page_ref], [Sym_ref], unbalanced inline code, code-block fallbacks,
     non-https links — plan invariant 3 and the v1 policy table);
   - [translate_with_fallbacks] merges both, in stage order.

   Non-https markdown links ([http://...]) are not in the plan's v1 [Link]
   row (https only): they degrade to bare text, counted as [Link_degraded].

   Tables are dropped entirely (not rendered as prose): cell text is not
   meaningful prose, and the GIR-PRD table mapping is a structural `{t ...}`
   rewrite that a later leg runs from the raw text anyway; the
   [Table_stripped] event marks where the construct was.

   {2 Parse grammar notes (corpus-derived)}

   - Fenced blocks come in two gi-docgen dialects: triple-backtick and the
     pipe form [|[...]|] (with an optional [<!-- language="X" -->] first
     line); the double-backtick multi-line block form (`` ``c `` ``) is the
     same fence with an opening run of two backticks. All three become
     [Code_block] with the raw content; fence markers and language hints are
     dropped (the non-OCaml banner is a deferred leg).
   - Markdown images ([![alt](src)]) are treated like [<img alt=...>]:
     alt text kept as plain prose, counted as [Image_stripped];
     [<picture>]/[<source>] wrappers are stripped, counted as
     [Picture_stripped].
   - Legacy sigils follow the GIR-PRD §3.5 guard rules, implemented in
     [parse]: [#] not preceded by [/], [#]/[%] followed by an uppercase
     identifier with no space (so URL fragments, heading markers, CSS/hex
     and "50%" never match); [#Type:property]/[#Type::signal] keep their
     suffix on the endpoint. [@param] names must start lowercase, not be
     preceded by an identifier character and not be followed by [.]+letter
     (the email/namespace guard); any other bare [@] is literal prose and is
     escaped at render — a literal [@word] can never start an odoc tag.
   - Fragments ([keyword@endpoint]) may be backtick-wrapped whole
     ([`class@Foo`] per the gi-docgen linking grammar); the wrapping
     backticks are stripped, and a backtick-wrapped endpoint
     ([class@`Foo`]) is unwrapped too. A trailing [#anchor] may be
     appended and is preserved on the node.
   - An unmatched backtick in prose is literal text (some corpus docs have
     unbalanced backticks; swallowing the rest of the paragraph into a code
     span would be worse).
   - Backslash escapes follow markdown: [\] before a markdown-escapable
     character yields the literal character — the exact inverse of the
     render-side escaping. One-step string idempotence is *false* by
     design (plan invariant 5), and even the one-step AST fixed point
     `parse (render (parse x)) ≅ parse x` holds only for docs whose
     rendered output carries no re-triggerable sigils (a rendered link
     URL contains literal '#anchor' text that a re-parse legitimately
     reads as a legacy sigil). The property the pipeline actually needs
     is the wiring invariant — no emission site feeds translator output
     back through the translator — so the round-trip test certifies
     CONVERGENCE: after at most two applications of parse∘render the AST
     stops changing. Use [equal_t], never string equality, for all of
     these.

   The [context] parameter of [parse] is threaded so [translate] can hand
   it to [render]; the current phase's parse itself is context-independent
   (raw heading levels are recorded in [Heading], policy is applied at
   render). *)

type context = Entity | Member

type sym_kind =
  | Class
  | Iface
  | Enum
  | Flags
  | Struct
  | Alias
  | Callback
  | Const
  | Ctor
  | Func
  | Method
  | Property
  | Signal
  | Vfunc
  | Error
  | Id
  | Type_kind
[@@deriving eq]

type inline =
  | Text of string
  | Code of string
  | Bold of inline list
  | Italic of inline list
  | Link of { text : inline list; url : string }
  | Page_ref of { text : inline list; path : string; anchor : string option }
  | Sym_ref of {
      kind : sym_kind option;
      endpoint : string;
      anchor : string option;
    }
  | Param_ref of string
  | Ref of string
[@@deriving eq]

type block =
  | Para of inline list
  | Heading of int * inline list
  | List of bool * inline list list
  | Code_block of string
[@@deriving eq]

type t = { blocks : block list }

(** One lossy or degraded translation, with enough payload to classify and
    count it for the warnings report (GIR plan Phase 5). *)
type fallback =
  | Inline_code_unbalanced of string
  (** v1 inline code contains []] — rendered as escaped plain prose. *)
  | Code_block_verbatim of string
  (** v1 code block contains [}] — rendered as [{[ {v ... v} ]}] verbatim. *)
  | Code_block_stripped of string
  (** v1 code block contains [}] and the verbatim fallback would break too —
      the block is dropped. *)
  | Sym_ref_degraded of string
  (** Fragment / legacy sigil rendered as [\[endpoint\]] code, awaiting the
      §7 resolver leg. *)
  | Page_ref_degraded of string
  (** Relative gi-docgen [.html] link rendered as bare text, awaiting the
      §6.3 upstream-URL leg. *)
  | Link_degraded of string
  (** Markdown link to a non-https target — v1 [Link] is https-only — kept
      as bare text. *)
  | Admonition_stripped of string
  (** [::: type] admonition stripped to its plain content. *)
  | Table_stripped
  (** Markdown table dropped (cell text is not prose). *)
  | Picture_stripped of string option
  (** [<picture>]/[<source>] wrappers stripped; the [<img alt>] text (when
      present) is kept as plain prose. *)
  | Image_stripped of string
  (** Markdown image or bare [<img>]: the alt text is kept as plain prose. *)
  | Quote_stripped
  (** [> blockquote] marker stripped, content kept as plain prose. *)
[@@deriving eq]

val parse : context -> string -> t
(** [parse ctx gir_markdown] parses raw GIR [<doc>] content into the AST.
    [ctx] is threaded to [render]; see module comment. *)

val parse_with_fallbacks : context -> string -> t * fallback list
(** [parse] plus the parse-time fallback events (stripped constructs). *)

val render : t -> string
(** Renders with the [Entity] heading policy (module comments are the
    canonical attachment). Output is comment-hazard neutralised and contains
    no unescaped [@] in prose. *)

val render_as : context -> t -> string
(** [render] with the heading policy selected explicitly. *)

val render_with_fallbacks : context -> t -> string * fallback list
(** [render_as] plus the render-time fallback events. *)

val translate : context -> string -> string
(** [translate ctx s = render_as ctx (parse ctx s)]. *)

val translate_with_fallbacks : context -> string -> string * fallback list
(** [translate] plus all fallback events, parse events before render events.
    This is the call the emission sites and the corpus smoke test use. *)

val equal_inline : inline -> inline -> bool
val equal_block : block -> block -> bool
val equal_t : t -> t -> bool
(** Structural equality on the module's own AST (required for the round-trip
    invariants in plans: string idempotence of [translate] is false by
    design). *)
