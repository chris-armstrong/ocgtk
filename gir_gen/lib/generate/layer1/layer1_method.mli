(* Layer 1 Method - Method generation for OCaml interfaces *)

val generate_method_decl :
  ctx:Types.generation_context ->
  class_name:string ->
  c_type:string ->
  c_symbol_prefix:string option ->
  buf:Buffer.t ->
  Types.gir_method ->
  unit
(** Generate a single method declaration and write it to the buffer. The caller
    selects the methods ({!Emitted_members.l1_methods}). *)
