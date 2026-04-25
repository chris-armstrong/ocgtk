(* Shared filtering helpers for GIR generators *)

open Types

(* Check if a type is simple (has known mapping) *)
val has_simple_type : ctx:generation_context -> gir_type -> bool

(* Check if a type is an array type *)
val is_array_type : gir_type -> bool

(* Check if a property should be generated *)
val should_generate_property :
  ctx:generation_context ->
  class_name:'a ->
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

(* Check if a method should be skipped *)
val should_skip_method_binding : ctx:generation_context -> gir_method -> bool

(* Check if a constructor has varargs *)
val constructor_has_varargs : gir_constructor -> bool

(* Check if a constructor should be generated *)
val should_generate_constructor :
  ctx:generation_context -> gir_constructor -> bool

(* Check if a record should be generated. For example, private records are excluded from generation *)
val should_generate_record : gir_record -> bool
val should_generate_class : gir_class -> bool
val should_generate_interface : gir_interface -> bool

(* Check if a C type is a string type *)
val is_string_type : string option -> bool

(* Check if an array contains string elements *)
val is_string_array : gir_array -> bool

(* Check if an array type lacks length information for C code generation *)
val array_lacks_length_info : gir_array -> bool

(* Check if a standalone function should be generated *)
val should_generate_function : gir_function -> bool
