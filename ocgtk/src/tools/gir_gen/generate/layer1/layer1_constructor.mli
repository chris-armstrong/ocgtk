(* Layer 1 Constructor - Constructor generation for OCaml interfaces *)

val should_generate_constructor :
  ctx:Types.generation_context -> Types.gir_constructor -> bool
(** Check if a constructor should be generated in the interface. Returns [true]
    if the constructor does not throw and has no cross-namespace types. *)

val generate_constructor_decl :
  ctx:Types.generation_context ->
  class_name:string ->
  buf:Buffer.t ->
  Types.gir_constructor ->
  unit
(** Generate a single constructor declaration and write it to the buffer. *)
