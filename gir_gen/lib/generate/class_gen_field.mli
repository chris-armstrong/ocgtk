(* L2 class method generation for record field accessors. *)

open Types

val generate_field_methods :
  ctx:generation_context ->
  layer1_module_name:string ->
  current_layer2_module:string ->
  fields:gir_record_field list ->
  field_infos:Field_analysis.field_info list ->
  methods:gir_method list ->
  buf:Buffer.t ->
  unit
(** Generate getter/setter method implementations in the class body.
    Respects [no_getter]/[no_setter] overrides and skips methods that already
    exist at the L1 level (same name conflict). *)

val generate_field_method_sigs :
  ctx:generation_context ->
  current_layer2_module:string ->
  fields:gir_record_field list ->
  field_infos:Field_analysis.field_info list ->
  methods:gir_method list ->
  buf:Buffer.t ->
  unit
(** Generate getter/setter method signatures in the class type definition. *)

val generate_field_make_fn :
  ctx:generation_context ->
  class_snake:string ->
  class_type_name:string ->
  layer1_module_name:string ->
  current_layer2_module:string ->
  field_infos:Field_analysis.field_info list ->
  buf:Buffer.t ->
  unit
(** Generate module-level [let make ...] for a record entity.
    No-ops when [field_infos] is empty. *)

val generate_field_make_fn_sig :
  ctx:generation_context ->
  class_type_name:string ->
  current_layer2_module:string ->
  field_infos:Field_analysis.field_info list ->
  buf:Buffer.t ->
  unit
(** Generate module-level [val make ...] for a record entity. *)
