(* Entity_doc — the docs of a class, interface or record's modules, class
   type and class at both layers: the translated GIR doc where there is one,
   and the fixed text that tells a reader how the modules fit together. *)

val l1_module :
  namespace:string ->
  class_name:string ->
  c_type:string ->
  class_doc:string option ->
  Doc_emit.t option
(** The layer 1 module's floating doc: the class doc, then a pointer to the
    layer 2 module. Without a class doc, it starts with "Bindings for [c_type]."
    instead, because the first paragraph is also the module's synopsis on its
    parent's page. *)

val l2_module :
  namespace:string ->
  class_name:string ->
  c_type:string ->
  class_doc:string option ->
  Doc_emit.t option
(** The layer 2 module's floating doc: the class doc, then where its members are
    (the class type) and the layer 1 module it is built on. *)

val class_type : c_type:string -> Doc_emit.t option
(** The canned doc of the layer 2 [class type]. *)

val class_ :
  namespace:string -> class_name:string -> c_type:string -> Doc_emit.t option
(** The canned doc of the layer 2 [class]: when to apply it directly. *)

type layer = Layer1 | Layer2

val combined_module :
  namespace:string ->
  layer:layer ->
  class_names:string list ->
  Doc_emit.t option
(** The floating doc of a module that defines a cycle's classes together: which
    modules re-export them, and that those are the ones to use. *)
