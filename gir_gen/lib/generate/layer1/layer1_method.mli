(* Layer 1 Method - Method generation for OCaml interfaces *)

val generate_method_decl :
  ctx:Types.generation_context ->
  class_name:string ->
  c_type:string ->
  c_symbol_prefix:string option ->
  entity_kind:Filtering.entity_kind ->
  buf:Buffer.t ->
  Types.gir_method ->
  unit
(** Generate a single method declaration and write it to the buffer. *)
