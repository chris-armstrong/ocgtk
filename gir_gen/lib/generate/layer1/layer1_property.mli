(* Layer 1 Property - Property generation for OCaml interfaces *)

val generate_property_decl :
  ctx:Types.generation_context ->
  class_name:string ->
  buf:Buffer.t ->
  Emitted_members.accessors ->
  unit
(** Generate a property's getter and/or setter declarations. The caller selects
    the properties and accessors ({!Emitted_members.l1_properties}). *)
