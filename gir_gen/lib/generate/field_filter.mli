(* Field filtering predicates for record field accessor generation *)

open Types

(** [should_generate_field field] returns [true] if the field should be
    considered for accessor generation. Returns [false] for:
    - gpointer type fields
    - Callback function pointer type fields
    - AttrClass struct-of-function-pointers fields
    - Dynamic C arrays without fixed size or zero-terminator
    - Private fields (when parser support lands)
    - Bit-fields (when parser support lands) *)
val should_generate_field : gir_record_field -> bool

(** [should_generate_field_getter field] returns [true] if a getter should be
    generated for the field. In addition to [should_generate_field], also
    checks the [no_getter] override flag. *)
val should_generate_field_getter : gir_record_field -> bool

(** [should_generate_field_setter field] returns [true] if a setter should be
    generated for the field. In addition to [should_generate_field], also
    checks the [no_setter] override flag and the [writable] flag. *)
val should_generate_field_setter : gir_record_field -> bool
