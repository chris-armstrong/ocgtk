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

val build_hierarchy_type :
  ctx:Types.generation_context ->
  current_layer2_module:StdLabels.String.t ->
  gir_type:Types.gir_type ->
  is_nullable:bool ->
  string

val build_base_type : is_nullable:bool -> string -> string option

val build_param_type_with_hierarchy :
  ctx:Types.generation_context ->
  same_cluster_classes:'a ->
  current_layer2_module:StdLabels.String.t ->
  Types.gir_param ->
  string

val map_param_sig :
  ctx:Types.generation_context ->
  same_cluster_classes:'a ->
  current_layer2_module:StdLabels.String.t ->
  Types.gir_param ->
  string

val build_class_type :
  ctx:Types.generation_context ->
  current_layer2_module:StdLabels.String.t ->
  same_cluster_classes:'a ->
  Types.gir_param ->
  'b ->
  string

val build_param_type :
  ctx:Types.generation_context ->
  same_cluster_classes:'a ->
  current_layer2_module:StdLabels.String.t ->
  string option list * 'b ->
  'c * Types.gir_param ->
  string option list * 'b

val convert_param_in_string :
  ctx:'a ->
  current_layer2_module:'b ->
  same_cluster_classes:'c ->
  'd ->
  'e ->
  Types.gir_param ->
  'd * 'e

val convert_param_type_in_string :
  ctx:Types.generation_context ->
  current_layer2_module:'a ->
  same_cluster_classes:'b ->
  'c * 'd ->
  'e * Types.gir_param ->
  'c * 'd

val find_accessor_name :
  ctx:Types.generation_context -> Types.gir_param -> string

val generate_hierarchy_param_binding :
  Buffer.t -> string -> Types.gir_param -> string -> unit

val generate_method_wrappers :
  ctx:Types.generation_context ->
  module_name:string ->
  class_name:'a ->
  c_type:'b ->
  current_layer2_module:StdLabels.String.t ->
  same_cluster_classes:'c ->
  Emitted_members.l2_method ->
  string

val generate_signature_content :
  ctx:Types.generation_context ->
  same_cluster_classes:'a ->
  current_layer2_module:StdLabels.String.t ->
  Types.gir_method ->
  bool * string

val generate_method_signatures :
  ctx:Types.generation_context ->
  current_layer2_module:StdLabels.String.t ->
  same_cluster_classes:'a ->
  Emitted_members.l2_method ->
  string
