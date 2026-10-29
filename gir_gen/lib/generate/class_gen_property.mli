module StringSet = Common.StringSet

type module_names = Class_gen_helpers.module_names = {
  layer1 : string;
  layer2 : string;
}

val sanitize_name : string -> string

val require_type :
  location:string -> gir_type_name:string -> string option -> string

val get_module_names : ctx:Types.generation_context -> string -> module_names
val is_same_cluster_class : same_cluster_classes:'a list -> 'a -> bool
val structural_type_for_class : ctx:'a -> string -> string
val ocaml_method_name : class_name:'a -> c_type:'b -> Types.gir_method -> string
val has_type_variable : string -> bool
val gir_type_of_name : string -> Types.gir_type

val resolve_parent_gir_type :
  same_cluster_classes:StdLabels.String.t list ->
  parent_name:StdLabels.String.t option ->
  Types.gir_type option

val should_skip_method :
  ctx:Types.generation_context ->
  entity_kind:Filtering.entity_kind ->
  Types.gir_method ->
  bool

val map_param_sig :
  ctx:Types.generation_context ->
  same_cluster_classes:'a ->
  current_layer2_module:StdLabels.String.t ->
  Types.gir_param ->
  string

val generate_property_code :
  generate_getter:(Types.gir_property -> string -> string) ->
  generate_setter:(Types.gir_property -> string -> string) ->
  Emitted_members.accessors ->
  string

val generate_property_methods :
  ctx:Types.generation_context ->
  module_name:string ->
  current_layer2_module:StdLabels.String.t ->
  same_cluster_classes:'a ->
  Emitted_members.accessors ->
  string

val generate_property_signatures :
  ctx:Types.generation_context ->
  class_name:string ->
  current_layer2_module:StdLabels.String.t ->
  same_cluster_classes:'a ->
  Emitted_members.accessors ->
  string
