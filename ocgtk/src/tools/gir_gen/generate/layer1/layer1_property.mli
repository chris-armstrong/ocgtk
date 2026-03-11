(* Layer 1 Property - Property generation for OCaml interfaces *)

val generate_property_decl :
  ctx:Types.generation_context ->
  class_name:string ->
  buf:Buffer.t ->
  methods:Types.gir_method list ->
  Types.gir_property ->
  unit
(** Generate a single property's getter and/or setter declarations *)
