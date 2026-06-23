(** C Stub Code Generation — Record Field Accessor Stubs

    This module generates C wrapper functions for record field getters, setters,
    and the synthetic [make] constructor.  It is a thin rendering layer that
    consumes pre-computed [field_info] values from {!Field_analysis}. *)

(** Generate a C getter stub for a single record field.
    [c_type] is the C struct type (e.g. "GtkBorder").
    [field_info] is the pre-computed [field_info] for this field.
    Returns [Some code] if the getter should be generated, or [None] if
    the getter is suppressed (no_getter override). *)
val generate_field_getter :
  c_type:string ->
  Field_analysis.field_info ->
  string option

(** Generate C getter stubs for all fields of a record.
    Only generates stubs for fields that pass
    {!Field_filter.should_generate_field_getter}.
    Returns a list of C function code strings. *)
val generate_field_getters :
  c_type:string ->
  Field_analysis.field_info list ->
  string list

(** Generate a C setter stub for a single record field.
    [c_type] is the C struct type (e.g. "GtkBorder").
    [field_info] is the pre-computed [field_info] for this field.
    Returns [Some code] if the setter should be generated, or [None] if
    the setter is suppressed (no_setter override). *)
val generate_field_setter :
  c_type:string ->
  Field_analysis.field_info ->
  string option

(** Generate C setter stubs for all fields of a record.
    Only generates stubs for fields that pass
    {!Field_filter.should_generate_field_setter}.
    Returns a list of C function code strings. *)
val generate_field_setters :
  c_type:string ->
  Field_analysis.field_info list ->
  string list

(** Generate a C [make] constructor stub for a record.
    [c_type] is the C struct type (e.g. "GtkBorder").
    [make_c_name] is the C function name (e.g. "ml_gtk_border_make").
    [fields] is the list of writable [field_info] values.
    For 0 writable fields, emits a zero-arg allocator.
    For 1-5 fields, emits a simple [CAMLparam<n>] function.
    For >5 fields, emits both [_native] and [_bytecode] entry points.
    Returns [Some code] or [None] if fields list is empty. *)
val generate_field_make :
  c_type:string ->
  string ->
  Field_analysis.field_info list ->
  string option

(** Generate the [make] constructor stub for a record, deriving the function
    name from the first writable field's [make_c_name].
    Returns [None] if fields list is empty. *)
val generate_field_make_from_fields :
  c_type:string ->
  Field_analysis.field_info list ->
  string option
