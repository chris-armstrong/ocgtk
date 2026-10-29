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
   the layer.

   Members link in every namespace in the index, and only to a member the
   type emits at the doc's layer: another namespace's references file lists
   what that namespace emits, from the same code that drives its emitters.
   From a layer 1 doc, a method, constructor, signal or
   property links to the layer 1 value ([Ocgtk.Raw.Button.val-get_label]);
   from a layer 2 doc, a constructor links to the module's value
   ([Ocgtk.Button.val-new_]) and the others to the class type's method
   ([Ocgtk.Button.class-type-button_t.method-on_clicked]). A property links
   to its accessor (see [Emitted_members.names]). An enumeration or bitfield
   member links to its polymorphic variant tag in [Enums].

   Legacy sigils and C calls name C symbols and follow the same rules: a
   [#CType] sigil links like a type, and [#CType:prop] and [#CType::sig] like
   a member; a [%CONSTANT] sigil links to the constant, in any namespace, and
   otherwise to the enumeration or bitfield member with that C identifier; a
   C call ([gtk_widget_show()]) and an [[id@symbol]] fragment link to the
   method or constructor with that C identifier. A C name is looked up in the
   current namespace first, then in the others. A resolved C call keeps its [" ()"]. *)

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
      (** The namespace is indexed but does not generate the target, or the type
          does not emit the member at the doc's layer. *)
  | Members_not_listed
      (** A member of a namespace whose references file has no member tables, as
          an older file has none: its members can't be checked. *)
  | Kind_not_generated
      (** Functions, callbacks, virtual functions, aliases and error domains:
          never generated. *)
[@@deriving eq]

val miss_reason_name : miss_reason -> string
(** Name in the summary: ["unknown-target"], ... *)

type outcome = {
  origin : Doc_ast.sym_origin;
  kind : Doc_ast.sym_kind option;
      (** The fragment keyword; [None] for a sigil or a C call. *)
  endpoint : string;
  result : (unit, miss_reason) result;  (** [Ok ()] when linked. *)
}

val resolve : env -> Doc_ast.t -> Doc_ast.t * outcome list
(** [resolve env doc] links the references of [doc] the index can satisfy, and
    returns one outcome per [Sym_ref], in document order. *)

val pp_summary : outcome list Fmt.t
(** Counts of linked references and of each miss reason per fragment kind and
    per sigil or C call, then every distinct reference that missed with
    [Unknown_target]. *)
