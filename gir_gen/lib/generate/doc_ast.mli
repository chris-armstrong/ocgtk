(* Doc_ast — the flat AST that joins Doc_parse and Doc_render.

   [Doc_parse.parse] must not bake in escaping or odoc syntax: markup stays
   in AST nodes ([Code], [Bold], [Link], [Sym_ref], ...), raw prose stays in
   [Text]. [Doc_render.render] must not make parse-time policy decisions:
   the heading policy (GIR plan §6.6) is chosen per [context] at render
   time. [Ref] is produced only by the future cross-reference resolver leg;
   [parse] never emits it. Keeping this line clean is what lets the
   deferred resolver and upstream-URL legs run as pure AST rewrites. *)

(** Threaded from [Doc_parse.parse] to [Doc_render.render_as] by
    [Doc_translate.translate]; see the parse/render split above. *)
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

(** One lossy or degraded translation, with enough payload to classify and count
    it for the warnings report (GIR plan Phase 5). *)
type fallback =
  | Inline_code_unbalanced of string
      (** v1 inline code would break its span — rendered as escaped plain prose.
      *)
  | Code_block_verbatim of string
      (** v1 code block would break its block delimiter — rendered with the
          verbatim form instead. *)
  | Code_block_stripped of string
      (** v1 code block contains [}] and the verbatim fallback would break too —
          the block is dropped. *)
  | Sym_ref_degraded of string
      (** Fragment / legacy sigil rendered as [[endpoint]] code, awaiting the §7
          resolver leg. *)
  | Page_ref_degraded of string
      (** Relative gi-docgen [.html] link rendered as bare text, awaiting the
          §6.3 upstream-URL leg. *)
  | Link_degraded of string
      (** Markdown link to a non-https target — v1 [Link] is https-only — kept
          as bare text. *)
  | Admonition_stripped of string
      (** [::: type] admonition stripped to its plain content. *)
  | Table_stripped  (** Markdown table dropped (cell text is not prose). *)
  | Picture_stripped of string option
      (** [<picture>]/[<source>] wrappers stripped; the [<img alt>] text (when
          present) is kept as plain prose. *)
  | Image_stripped of string
      (** Markdown image or bare [<img>]: the alt text is kept as plain prose.
      *)
  | Quote_stripped
      (** [> blockquote] marker stripped, content kept as plain prose. *)
[@@deriving eq]

val equal_inline : inline -> inline -> bool
val equal_block : block -> block -> bool

val equal_t : t -> t -> bool
(** Structural equality on the AST (required for the round-trip invariants in
    plans: string idempotence of [Doc_translate.translate] is false by design).
*)
