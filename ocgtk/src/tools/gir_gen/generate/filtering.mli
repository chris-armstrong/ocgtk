(* Shared filtering helpers for GIR generators *)

open Types

(* Check if a type name refers to a cross-namespace enum or bitfield *)
val is_cross_namespace_enum_or_bitfield :
  ctx:generation_context -> string -> bool

(* Check if a method has cross-namespace enum/bitfield parameters or return type *)
val method_has_cross_namespace_types : ctx:generation_context -> gir_method -> bool

(* Check if a constructor has cross-namespace enum/bitfield parameters *)
val constructor_has_cross_namespace_types :
  ctx:generation_context -> gir_constructor -> bool

(* Check if a type is simple (has known mapping) *)
val has_simple_type : ctx:generation_context -> gir_type -> bool

(* Check if a type is an array type *)
val is_array_type : gir_type -> bool

(* Check if a property should be generated *)
val should_generate_property :
  ctx:generation_context ->
  class_name:string ->
  methods:gir_method list ->
  gir_property ->
  bool

(* Get property method names *)
val property_method_names :
  ctx:generation_context ->
  class_name:string ->
  methods:gir_method list ->
  gir_property list ->
  string list

(* Get property base names *)
val property_base_names :
  ctx:generation_context ->
  class_name:string ->
  methods:gir_method list ->
  gir_property list ->
  string list

(* Check if a method has excluded type *)
val method_has_excluded_type : gir_method -> bool

(* Check if a method should be skipped *)
val should_skip_method_binding :
  ctx:generation_context -> gir_method -> bool

(* Check if a constructor has varargs *)
val constructor_has_varargs : gir_constructor -> bool

(* Check if a constructor should be generated *)
val should_generate_constructor :
  ctx:generation_context -> gir_constructor -> bool

(* Check if a record name ends with "Private" *)
val should_skip_private_record : gir_record -> bool

(* Check if a method has a parameter with interface type *)
val method_has_interface_param :
  ctx:generation_context -> gir_method -> bool