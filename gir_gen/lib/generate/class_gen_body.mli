(* Class body generation (Step 3) - orchestrators

   Internal helpers for emitting the contents of L2 class implementations
   and class type signatures.  These functions are re-exported by
   [Class_gen] via [include Class_gen_body]. *)

open Types

val generate_class_module_body :
  ctx:generation_context ->
  buf:Buffer.t ->
  layer1_module_name:string ->
  current_layer2_module:string ->
  class_name:string ->
  class_snake:string ->
  c_type:string ->
  methods:gir_method list ->
  entity_kind:Filtering.entity_kind ->
  properties:gir_property list ->
  signals:gir_signal list ->
  same_cluster_classes:string list ->
  parent_name:string option ->
  unit ->
  unit
(** Generate the body of a class module (implementation) *)

val generate_class_signature_body :
  ctx:generation_context ->
  buf:Buffer.t ->
  layer1_module_name:string ->
  current_layer2_module:string ->
  class_name:string ->
  class_snake:string ->
  c_type:string ->
  methods:gir_method list ->
  entity_kind:Filtering.entity_kind ->
  properties:gir_property list ->
  signals:gir_signal list ->
  same_cluster_classes:string list ->
  parent_name:string option ->
  unit ->
  unit
(** Generate the body of a class signature *)
