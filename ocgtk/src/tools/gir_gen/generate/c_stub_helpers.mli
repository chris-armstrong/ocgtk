(** C Stub Code Generation - Shared Helpers This module provides organized C
    stub code generation functionality. Internal modules (Type_analysis,
    Array_conv, GValue, Code_gen, Forward_decl) are hidden to maintain clean
    module boundaries. *)

val include_header_for_namespace : string -> string
(** Get C include header for a namespace. *)

type property_gvalue_info = {
  base_type : string;  (** Base C type name *)
  base_lower : string;  (** Lowercase base type name *)
  has_pointer : bool;  (** True if type has pointer indirection *)
  pointer_like : bool;  (** True if type behaves like a pointer *)
  record_info : (Types.gir_record * bool * bool) option;
      (** Record type info if applicable *)
  class_info : Types.gir_class option;  (** Class type info if applicable *)
  is_enum : bool;  (** True if enum type *)
  is_bitfield : bool;  (** True if bitfield type *)
  stack_allocated : bool;
      (** True if stack-allocated (enums, bitfields, primitives) *)
}
(** Property type analysis *)

val analyze_property_type :
  ctx:Types.generation_context -> Types.gir_type -> property_gvalue_info
(** Analyze property type and extract GValue conversion information *)

val is_copy_method : Types.gir_method -> bool
(** Check if a method is a copy method that should be skipped in bindings *)

val is_free_method : Types.gir_method -> bool
(** Check if a method is a free method that should be skipped in bindings *)

val is_copy_or_free : Types.gir_method -> bool
(** Check if a method is a copy or free method that should be skipped in
    bindings *)

val fold_mapi :
  f:(int -> 'a -> 'b -> 'a * 'c) -> init:'a -> 'b list -> 'a * 'c list
(** Fold with map and index - combines fold_left_map with index tracking *)

val list_contains : value:string -> string list -> bool
(** Check if list contains a value (case-insensitive comparison for type names)
*)

val is_string_type : string option -> bool
(** Check if a C type is a string type *)

val generate_array_ml_to_c :
  ctx:Types.generation_context ->
  var:string ->
  array_info:Types.gir_array ->
  element_mapping:Types.type_mapping ->
  element_c_type:string ->
  transfer_ownership:Types.transfer_ownership ->
  nullable:bool ->
  string * string * string * string
(** Array conversion - generate conversion code for OCaml array to C array.
    Returns (conversion_code, c_array_var, length_var, cleanup_code) *)

val generate_array_c_to_ml :
  ctx:Types.generation_context ->
  var:string ->
  array_info:Types.gir_array ->
  length_expr:string option ->
  element_c_type:string ->
  transfer_ownership:Types.transfer_ownership ->
  string * string * string
(** Array conversion - generate conversion code for C array to OCaml array.
    Returns (conversion_code, ml_array_var, cleanup_code) *)

val is_string_array : Types.gir_array -> bool
(** Check if an array contains string elements *)

val generate_gvalue_getter_assignment :
  ml_name:string ->
  prop:Types.gir_property ->
  c_type_name:string ->
  prop_info:property_gvalue_info ->
  string
(** GValue getter/setter generation *)

val generate_gvalue_setter_assignment :
  ml_name:string -> prop_info:property_gvalue_info -> string

val generate_c_file_header :
  ctx:Types.generation_context -> ?class_name:string -> unit -> string
(** Code generation utilities *)

val base_c_type_of : string -> string
(** Extract base C type by removing trailing pointer *)

val build_return_statement :
  throws:bool ->
  string option (** Primary return value expression *) ->
  string list (** Out parameter conversions *) ->
  string
(** Build return statement code based on return type and out parameters. Handles
    both throwing and non-throwing methods. *)

val generate_constructors :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  buf:Buffer.t ->
  generator:
    (ctx:Types.generation_context ->
    c_type:string ->
    class_name:string ->
    Types.gir_constructor ->
    string) ->
  Types.gir_constructor list ->
  unit
(** Generate C code for constructors by iterating and filtering. Applies
    [Filtering.should_generate_constructor] filter and appends generated code to
    the buffer. *)

val generate_methods :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  buf:Buffer.t ->
  generator:
    (ctx:Types.generation_context ->
    c_type:string ->
    Types.gir_method ->
    string ->
    string) ->
  ?extra_filter:(Types.gir_method -> bool) ->
  Types.gir_method list ->
  unit
(** Generate C code for methods by iterating and filtering. Applies
    [Filtering.should_skip_method_binding] filter plus an optional extra filter
    predicate, then appends generated code to the buffer. Methods are processed
    in reverse order (List.rev). *)

val default_type_mapping : Types.type_mapping
(** Default type mapping for when no mapping is found *)

type param_acc = {
  ocaml_idx : int;
  decls : Buffer.t;
  args : string list;
  cleanups : string list;
}
(** Accumulator for parameter processing - kept at top level for record field
    access *)

val nullable_c_to_ml_expr :
  ctx:Types.generation_context ->
  var:string ->
  gir_type:Types.gir_type ->
  mapping:Types.type_mapping ->
  ?direction:Types.gir_direction ->
  unit ->
  string
(** Generate C-to-ML conversion expression handling nullable types. out
    parameters that are record types are stack allocated, so we need to pass by
    reference to their Val_x function, which will copy them into the OCaml heap
*)

val nullable_ml_to_c_expr :
  var:string -> gir_type:Types.gir_type -> mapping:Types.type_mapping -> string
(** Generate ML-to-C conversion expression handling nullable types. Check for
    string types with transfer-ownership="full" - need to copy to mutable buffer
*)

val generate_forward_decl_section :
  buf:Buffer.t ->
  items:'a list ->
  section_comment:string ->
  generate_one:('a -> unit) ->
  ?deduplicate:bool ->
  unit ->
  unit
(** Forward declaration helper - generate a section of forward declarations.
    Common pattern across record, class, enum, and bitfield modules.

    Parameters:
    - buf: Buffer to append declarations to
    - items: List of items to generate declarations for
    - section_comment: Comment header for this section
    - generate_one: Function to generate declarations for a single item
    - deduplicate: Whether to track seen types with Hashtbl (default: true) *)

(** {1 Version Guard Support} *)

val namespace_display_name : string -> string
(** Get display name for namespace for use in failwith messages *)

val format_version_for_message : Version_guard.version -> string
(** Format version string for failwith messages *)

val emit_fallback_constructor_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  c_identifier:string ->
  version:Version_guard.version ->
  Types.gir_constructor ->
  string
(** Emit a fallback stub for a constructor when class version check fails *)

val emit_fallback_method_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  c_identifier:string ->
  version:Version_guard.version ->
  Types.gir_method ->
  string
(** Emit a fallback stub for a method when class version check fails *)

val emit_fallback_property_getter_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  version:Version_guard.version ->
  Types.gir_property ->
  string
(** Emit a fallback stub for a property getter when class version check fails *)

val emit_fallback_property_setter_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  version:Version_guard.version ->
  Types.gir_property ->
  string
(** Emit a fallback stub for a property setter when class version check fails *)

val emit_fallback_record_method_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  version:Version_guard.version ->
  Types.gir_method ->
  string
(** Emit a fallback stub for a record method when class version check fails *)

val emit_with_member_guard :
  ctx:Types.generation_context ->
  ?version_namespace:string option ->
  class_version:string option ->
  member_version:string option ->
  fallback:(Version_guard.version -> string) ->
  stub:string ->
  Buffer.t ->
  unit
(** Wrap a generated stub in a member-level version guard when [resolve_guard]
    returns [Member_guard]. [fallback v] is called with the member version to
    produce the [#else] stub. Falls through to plain emit on parse errors or
    when no guard is needed. *)

(** {1 OS Guard Support} *)

val os_to_c_guard_open : string -> string
(** Map an OS string to the opening C preprocessor guard.
    E.g. ["linux"] -> ["#ifdef __linux__"]. *)

val os_to_c_guard_close : string -> string
(** Map an OS string to the closing C preprocessor guard.
    E.g. ["linux"] -> ["#endif /* __linux__ */"]. *)

val os_display_name : string -> string
(** Human-readable display name for an OS string (for failwith messages).
    E.g. ["linux"] -> ["Linux"]. *)

val emit_with_os_guard :
  os:string option ->
  failwith_stub:string ->
  stub:string ->
  Buffer.t ->
  unit
(** Wrap a generated stub in an OS guard.
    [os]: OS string (e.g. ["linux"]), or [None] to emit stub as-is.
    [failwith_stub]: content for the [#else] branch.
    [stub]: the actual implementation in the [#ifdef] branch. *)

val emit_os_fallback_constructor_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  c_identifier:string ->
  os:string ->
  Types.gir_constructor ->
  string
(** Emit a fallback constructor stub for the [#else] branch of an OS guard. *)

val emit_os_fallback_method_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  c_identifier:string ->
  os:string ->
  Types.gir_method ->
  string
(** Emit a fallback method stub for the [#else] branch of an OS guard. *)

val emit_os_fallback_property_getter_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  os:string ->
  Types.gir_property ->
  string
(** Emit a fallback property getter stub for the [#else] branch of an OS guard. *)

val emit_os_fallback_property_setter_stub :
  ctx:Types.generation_context ->
  c_type:string ->
  class_name:string ->
  ml_name:string ->
  os:string ->
  Types.gir_property ->
  string
(** Emit a fallback property setter stub for the [#else] branch of an OS guard. *)
