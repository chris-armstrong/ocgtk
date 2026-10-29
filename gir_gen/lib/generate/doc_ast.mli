(* Doc_ast — the flat AST that joins Doc_parse and Doc_render.

   [Doc_parse.parse] must not bake in escaping or odoc syntax: markup stays
   in AST nodes ([Code], [Bold], [Link], [Sym_ref], ...), raw prose stays in
   [Text]. [Doc_render.render] must not make parse-time policy decisions:
   the heading policy (GIR plan §6.6) is chosen per [context] at render
   time. [Ref] is produced only by [Doc_resolve], a pure rewrite of [Sym_ref]
   nodes between the two stages; [parse] never emits it. Keeping this line
   clean is what lets the resolver and the deferred upstream-URL leg run as
   AST rewrites. *)

(** Threaded from [Doc_parse.parse] to [Doc_render.render_as] by
    [Doc_translate.translate]; see the parse/render split above. *)
type context = Entity | Member

(** What the item a doc is attached to returns, as far as the doc's C idioms
    care: [Throws] items return [(_, GError.t) result], so a null return "on
    error" is an [Error] result instead. *)
type ret_shape = Plain | Throws

val ret_shape_of_throws : bool -> ret_shape
(** [Throws] for an item GIR marks [throws="1"]. *)

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

(** Where a [Sym_ref] came from: a gi-docgen [[kind@endpoint]] fragment, a
    legacy [#Type] or [%CONSTANT] sigil, or a C call ([gtk_widget_show()]). *)
type sym_origin = Fragment | Hash | Percent | C_call [@@deriving eq]

type c_lit =
  | True
  | False
  | Null
  | Null_on_error of string
      (** A null literal followed by an error phrase ([" on error"],
          [" if an error occurred"], ...); the phrase is the payload. Separate
          from [Null] because a throwing item reports the error as an [Error]
          result, not as a null return. *)
[@@deriving eq]

type inline =
  | Text of string
  | Code of string
  | Bold of inline list
  | Italic of inline list
  | Link of { text : inline list; url : string }
  | Page_ref of { text : inline list; path : string; anchor : string option }
  | Sym_ref of {
      origin : sym_origin;
      kind : sym_kind option;
      endpoint : string;
      anchor : string option;
    }
  | Param_ref of string
  | Ref of { path : string; text : string }
      (** A reference [Doc_resolve] resolved: the odoc reference [path], shown
          as the code span [text], the endpoint its [Sym_ref] showed. *)
  | C_lit of c_lit
      (** [%TRUE], [%FALSE] or [%NULL], or the same name as a whole code span: a
          C literal the bindings spell differently. *)
  | C_prim of string
      (** A [#gint]-style C primitive type sigil, holding the C name. [parse]
          produces it only for names [Doc_c_idiom.ocaml_of_c_prim] knows. *)
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
  | Ownership_stripped of string
      (** A sentence telling C callers how to free a value, dropped; the payload
          names the matching pattern. *)
[@@deriving eq]

val equal_inline : inline -> inline -> bool
val equal_block : block -> block -> bool

val equal_t : t -> t -> bool
(** Structural equality on the AST (required for the round-trip invariants in
    plans: string idempotence of [Doc_translate.translate] is false by design).
*)

val sym_ref_text : sym_origin -> string -> string
(** The code span a reference shows, resolved or not: its endpoint, followed by
    [" ()"] for a C call, as gi-docgen renders one. *)
