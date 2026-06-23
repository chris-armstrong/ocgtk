(* Field filtering predicates for record field accessor generation *)

open Containers
open StdLabels
open Types

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.field_filter"
            ~doc:"Field filtering predicates for record field accessor generation"))

(* Check if a field type is gpointer.
   gpointer fields cannot be meaningfully accessed from OCaml. *)
let is_gpointer_type (field_type : gir_type) : bool =
  String.equal field_type.name "gpointer"
  || (match field_type.c_type with Some "gpointer" -> true | _ -> false)

(* Check if a field type is a callback function pointer type.
   Callback fields require marshalling infrastructure (Milestone 4).
   These are filtered by type-name pattern rather than per-field overrides
   because the set of callback-typed fields is large and changes across
   GTK versions; individual fields can still be suppressed via the
   [Ignore] override action if needed. *)
let is_callback_field_type (field_type : gir_type) : bool =
  let lower = String.lowercase_ascii field_type.name in
  CCString.mem ~sub:"func" lower || CCString.mem ~sub:"callback" lower

(* Check if a field type is an AttrClass struct-of-function-pointers.
   These are structs whose members are all function pointers, treated as
   callback-equivalent and skipped. Same rationale as [is_callback_field_type]:
   pattern-based filtering avoids maintaining a per-field override list. *)
let is_attr_class_type (field_type : gir_type) : bool =
  String.equal field_type.name "AttrClass"

(* Check if a field type is a dynamic C array without fixed size or
   zero-terminator. These have a companion length field but we have no
   mechanism to pair length+data. *)
let is_dynamic_array (field_type : gir_type) : bool =
  match field_type.array with
  | Some arr ->
      Option.is_none arr.fixed_size && not arr.zero_terminated
      && not (Filtering.is_string_array arr)
  | None -> false

(* Check if a fixed-size array's element type is gpointer.
   GIR records like GtkBitsetIter have fixed-size gpointer arrays as opaque
   private storage.  We cannot generate meaningful accessors for these. *)
let is_gpointer_array (field_type : gir_type) : bool =
  match field_type.array with
  | Some arr -> is_gpointer_type arr.element_type
  | None -> false

(* Check if a field should be generated at all.
   Returns false for fields that cannot be generated:
   - not readable AND not writable (private/internal-only fields)
   - gpointer type
   - gpointer fixed-size array (opaque private storage)
   - Callback function pointer type
   - Dynamic C arrays without fixed size or zero-terminator
   - AttrClass struct-of-function-pointers *)
let should_generate_field (field : gir_record_field) : bool =
  match field.field_type with
  | None -> false
  | Some field_type ->
      let private_field = not field.readable && not field.writable in
      let gpointer = is_gpointer_type field_type in
      let gpointer_arr = is_gpointer_array field_type in
      let callback = is_callback_field_type field_type in
      let attr_class = is_attr_class_type field_type in
      let dynamic_arr = is_dynamic_array field_type in
      let skip = private_field || gpointer || gpointer_arr || callback || attr_class || dynamic_arr in
      Log.debug (fun m ->
          m "should_generate_field: %s -> skip=%b (private=%b gpointer=%b \
             gpointer_arr=%b callback=%b attr_class=%b dynamic_arr=%b)\n"
            field.field_name skip private_field gpointer gpointer_arr callback
            attr_class dynamic_arr);
      not skip

(* Check if a field getter should be generated.
   In addition to should_generate_field, also checks readable and no_getter override. *)
let should_generate_field_getter (field : gir_record_field) : bool =
  should_generate_field field && field.readable && not field.no_getter

(* Check if a field setter should be generated.
   In addition to should_generate_field, also checks no_setter override
   and writable flag. *)
let should_generate_field_setter (field : gir_record_field) : bool =
  should_generate_field field && not field.no_setter && field.writable
