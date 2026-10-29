(* Doc_resolve — GIR symbol references to odoc links.

   A pure rewrite of the AST between [Doc_parse] and [Doc_render]: a [Sym_ref]
   whose target the index lists becomes a [Ref], whose link text is the
   endpoint the [Sym_ref] showed, and every other [Sym_ref] is left alone, so
   it still renders as code. A reference is linked only when the index says
   its target is generated, because odoc warns on a link to anything else.

   Types link from both layers, to every namespace in the index. The layer of
   the doc decides the target: from a layer 1 doc, a class, interface or
   record links to its layer 1 module ([Ocgtk.Raw.Button]); from a layer 2
   doc, to its class type ([Ocgtk.Button.class-type-button_t]). Enumerations,
   bitfields and constants have one home, [Enums] and [Constants], whatever
   the layer. Members, legacy sigils and C symbols are not linked. *)

type env = {
  namespace : string;  (** The namespace the doc belongs to. *)
  layer : Types.target_library;
      (** The library the doc is emitted into: [Raw_library] for layer 1. *)
  index : Types.doc_index;
}

val env_of_ctx : Types.generation_context -> env
(** The namespace, target library and index of the context. Enumeration,
    bitfield and constant docs are shared by both layers and pass the
    [Main_library] context. *)

val no_links : namespace:string -> env
(** An empty index: every reference stays code. For callers with no generation
    context, such as unit tests. *)

val class_member : env -> env
(** [env] for the doc of a method, signal or property accessor inside a [class]
    or [class type]: it links nothing. odoc 3.2 resolves no reference in the doc
    of a class or class type member: it renders each as unresolved text, without
    a warning. The class type's own doc links as usual. *)

(** Why a reference stays code. *)
type miss_reason =
  | Namespace_not_generated
      (** The endpoint's namespace is not in the index: not generated (GLib,
          GObject), or not a dependency of the doc's namespace. *)
  | Unknown_target
      (** The namespace is indexed but does not generate the target. *)
  | Member_in_other_namespace
      (** A member of a type of another namespace: only members of the current
          namespace can be checked. *)
  | Kind_not_generated
      (** Functions, callbacks, virtual functions, aliases and error domains:
          never generated. *)
  | Not_resolved_yet  (** Members, legacy sigils and C symbols. *)
[@@deriving eq]

val miss_reason_name : miss_reason -> string
(** Name in the summary: ["unknown-target"], ... *)

type outcome = {
  kind : Doc_ast.sym_kind option;
      (** The fragment keyword; [None] for a legacy sigil. *)
  endpoint : string;
  result : (unit, miss_reason) result;  (** [Ok ()] when linked. *)
}

val resolve : env -> Doc_ast.t -> Doc_ast.t * outcome list
(** [resolve env doc] links the references of [doc] the index can satisfy, and
    returns one outcome per [Sym_ref], in document order. *)

val pp_summary : outcome list Fmt.t
(** Counts of linked references and of each miss reason per fragment kind, then
    every distinct endpoint that missed with [Unknown_target]. *)
