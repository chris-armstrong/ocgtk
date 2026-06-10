(* Field Analysis — centralizes type resolution and C conversion pattern
   computation for record field accessors. *)

(** Per-field metadata computed once and reused by C_stub_field, Layer1_field,
    and Class_gen_field. *)
type field_info = {
  field_name : string;
      (** OCaml snake_case name (e.g., "left", "line_break"). *)
  c_field_name : string;
      (** C struct member name (e.g., "left", "is_line_break"). *)
  getter_c_name : string;
      (** C function name for the getter (e.g., "ml_gtk_border_get_left"). *)
  setter_c_name : string;
      (** C function name for the setter (e.g., "ml_gtk_border_set_left"). *)
  make_c_name : string;
      (** C function name for the make constructor (e.g., "ml_gtk_border_make"). *)
  ocaml_type : string;
      (** OCaml type expression (e.g., "int", "string option", "Gdk.RGBA.t"). *)
  c_getter_body : string;
      (** C function body for the getter (without CAMLparam declaration). *)
  c_setter_body : string;
      (** C function body for the setter (without CAMLparam declaration). *)
  c_make_assignment : string;
      (** C assignment statement for the make constructor. *)
  needs_g_free : bool;
      (** True if the setter must [g_free] the old value (strings, SList). *)
  needs_g_strdup : bool;
      (** True if the setter/make must [g_strdup] new string values. *)
  is_array : bool;
      (** True if the field is an array type. *)
  is_bitfield : bool;
      (** True if the field is a bit-field (parser support pending). *)
  bit_shift : int option;
      (** Bit shift for bit-field access (None for non-bit-fields). *)
}

val compute_field_info :
  ctx:Types.generation_context ->
  record_name:string ->
  c_type:string ->
  Types.gir_record_field ->
  field_info option
(** Compute [field_info] for a single record field. Returns [None] if the field
    type cannot be resolved or should not be generated. [record_name] is the
    GIR record name (e.g., "Border"). [c_type] is the C struct type name
    (e.g., "GtkBorder"). *)

val compute_record_field_info :
  ctx:Types.generation_context ->
  record_name:string ->
  c_type:string ->
  Types.gir_record_field list ->
  field_info list
(** Compute [field_info] for all fields of a record that should be generated.
    Filters out fields that fail [Field_filter.should_generate_field]. *)
