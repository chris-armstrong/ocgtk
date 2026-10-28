(* Class_gen_inheritance — what a layer 2 class type page says it inherits,
   implements or requires: the GIR names resolved to the classes that have a
   layer 2 class type. *)

val of_entity :
  ctx:Types.generation_context ->
  entity_kind:Filtering.entity_kind ->
  string ->
  Entity_doc.inheritance
(** [of_entity ~ctx ~entity_kind class_name]: a class's parent and interfaces,
    an interface's prerequisites, nothing for a record. *)
