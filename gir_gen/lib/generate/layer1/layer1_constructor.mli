(* Layer 1 Constructor - Constructor generation for OCaml interfaces *)

val generate_constructor_decl :
  ctx:Types.generation_context ->
  class_name:string ->
  buf:Buffer.t ->
  Types.gir_constructor ->
  unit
(** Generate a single constructor declaration, with its doc
    ({!Entity_doc.constructor}), and write it to the buffer. *)
