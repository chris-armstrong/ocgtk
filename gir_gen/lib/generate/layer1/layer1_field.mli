(* Layer 1 Field - Record field accessor external declarations for OCaml interfaces *)

(** Generate a single field getter external declaration.
    Writes to [buf] an [external] declaration of the form:
    [external get_<field> : t -> <ocaml_type> = "<c_getter_name>"] *)
val generate_field_getter_decl :
  buf:Buffer.t ->
  Field_analysis.field_info ->
  unit

(** Generate a single field setter external declaration.
    Writes to [buf] an [external] declaration of the form:
    [external set_<field> : t -> <ocaml_type> -> unit = "<c_setter_name>"] *)
val generate_field_setter_decl :
  buf:Buffer.t ->
  Field_analysis.field_info ->
  unit

(** Generate all field getter external declarations for a list of field_infos. *)
val generate_field_getters :
  buf:Buffer.t ->
  Field_analysis.field_info list ->
  unit

(** Generate all field setter external declarations for a list of field_infos. *)
val generate_field_setters :
  buf:Buffer.t ->
  Field_analysis.field_info list ->
  unit

(** Generate the [make] constructor external declaration.
    The make function takes all writable fields as parameters and returns [t].
    For 0 writable fields, generates: [external make : unit -> t]
    For 1-5 writable fields, generates a simple [external].
    For >5 writable fields, generates bytecode/native entry points. *)
val generate_field_make_decl :
  buf:Buffer.t ->
  Field_analysis.field_info list ->
  unit
