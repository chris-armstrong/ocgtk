(* Doc_translate — pure GIR [<doc>] markdown → odoc markup translation.

   Two pure stages joined by a flat AST ([Doc_ast]): [Doc_parse.parse] reads
   the gi-docgen markdown dialect (plus the legacy gtk-doc sigils) into the
   AST; [Doc_render.render] walks the AST to odoc markup. [translate] here
   is their composition, and is the entry point emission sites will call
   (Phase 2 of the M3 plan). The module does no I/O, holds no global state,
   and is deterministic: the same input always yields the same output.

   See [Doc_ast] for the AST types and the parse/render split invariant,
   [Doc_parse] for the parse grammar, and [Doc_render] for the heading
   policy and the v1 render policy table.

   {2 Fallback / warning collection}

   The plan assigns fallback/warning collection to this module but leaves
   the mechanism open. Decision (recorded): every lossy or degraded
   translation is one [fallback] *event* with enough payload to classify and
   count it; events arise in both stages, so both stages have a collection
   variant that returns [t / string] plus the event list while the plain
   signatures stay untouched:

   - [Doc_parse.parse_with_fallbacks] collects the parse-time strips
     (admonitions, tables, pictures, images, quotes);
   - [Doc_render.render_with_fallbacks] collects the render-time
     degradations ([Page_ref], [Sym_ref], unbalanced inline code, code-block
     fallbacks, non-https links — plan invariant 3);
   - [translate_with_fallbacks] merges both, in stage order.

   {2 Round-trip invariant (plan invariant 5)}

   One-step string idempotence is *false* by design, and even the one-step
   AST fixed point `parse (render (parse x)) ≅ parse x` holds only for docs
   whose rendered output carries no re-triggerable sigils (a rendered link
   URL contains literal '#anchor' text that a re-parse legitimately reads as
   a legacy sigil). The property the pipeline actually needs is the wiring
   invariant — no emission site feeds translator output back through the
   translator — so the round-trip test certifies CONVERGENCE: after at most
   two applications of parse∘render the AST stops changing. Use [equal_t],
   never string equality, for all of these. *)

type context = Doc_ast.context = Entity | Member

type sym_kind = Doc_ast.sym_kind =
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

type inline = Doc_ast.inline =
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

type block = Doc_ast.block =
  | Para of inline list
  | Heading of int * inline list
  | List of bool * inline list list
  | Code_block of string

type t = Doc_ast.t = { blocks : block list }

type fallback = Doc_ast.fallback =
  | Inline_code_unbalanced of string
  | Code_block_verbatim of string
  | Code_block_stripped of string
  | Sym_ref_degraded of string
  | Page_ref_degraded of string
  | Link_degraded of string
  | Admonition_stripped of string
  | Table_stripped
  | Picture_stripped of string option
  | Image_stripped of string
  | Quote_stripped

val parse : context -> string -> t
(** [parse ctx gir_markdown] parses raw GIR [<doc>] content into the AST. [ctx]
    is threaded to [render]; see [Doc_parse]. *)

val parse_with_fallbacks : context -> string -> t * fallback list
(** [parse] plus the parse-time fallback events; see [Doc_parse]. *)

val render : t -> string
(** Renders with the [Entity] heading policy; see [Doc_render]. *)

val render_as : context -> t -> string
(** [render] with the heading policy selected explicitly. *)

val render_with_fallbacks : context -> t -> string * fallback list
(** [render_as] plus the render-time fallback events; see [Doc_render]. *)

val translate : context -> string -> string
(** [translate ctx s = render_as ctx (parse ctx s)]. *)

val translate_with_fallbacks : context -> string -> string * fallback list
(** [translate] plus all fallback events, parse events before render events.
    This is the call the emission sites and the corpus smoke test use. *)

val equal_inline : inline -> inline -> bool
val equal_block : block -> block -> bool

val equal_t : t -> t -> bool
(** Structural equality on the module's own AST (required for the round-trip
    invariants in plans: string idempotence of [translate] is false by design).
*)
