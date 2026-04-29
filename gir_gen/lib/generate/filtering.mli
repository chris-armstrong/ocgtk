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

(* Check if a method should be skipped. When [is_record] is true the predicate
   also returns true for copy/free/unref methods, since the gir_record
   custom-block finalizer already owns the wrapped pointer's lifetime and
   exposing those methods would race the GC. Defaults to [false]. *)
val should_skip_method_binding :
  ctx:generation_context -> ?is_record:bool -> gir_method -> bool

(* True if the method's name or c-identifier looks like a record copy
   constructor (e.g. [gtk_tree_path_copy], [pango_attribute_copy]). *)
val is_copy_method : gir_method -> bool

(* True if the method's name or c-identifier looks like a record destructor
   (matches [free] / [_free] / [unref] / [_unref]). *)
val is_free_method : gir_method -> bool

(* True if the method is a record copy or destructor and so should be
   filtered out for record entities. Equivalent to
   [is_copy_method m || is_free_method m]. *)
val is_copy_or_free : gir_method -> bool

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

(* Filter the methods of an entity to those that should be emitted by Layer 1
   and Layer 2 generators. For records this drops copy/free/unref methods
   because the custom-block finalizer already disposes of the wrapped pointer
   (manual free/unref is a double-free, manual copy is redundant). For
   classes and interfaces the methods list is returned unchanged. *)
val methods_for_emission : entity -> gir_method list
