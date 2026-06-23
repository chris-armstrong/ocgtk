(* C Stub Code Generation — Record Field Accessor Stubs
 *
 * This module generates C wrapper functions for record field getters, setters,
 * and the synthetic [make] constructor.  It is a thin rendering layer that
 * consumes pre-computed [field_info] values from [Field_analysis]; all type
 * resolution and conversion-pattern selection lives there.
 *
 * Each generated function follows the standard OCaml C stub pattern:
 *   CAMLexport CAMLprim value <name>(value self)
 *   {
 *       CAMLparam1(self);
 *       <c_type> *rec = <c_type>_val(self);
 *       <body>
 *   }
 *
 * The [make] constructor is a multi-param function that allocates a new struct
 * via g_new0, assigns each writable field, and returns the wrapped result. *)

open Printf
open Containers
open StdLabels

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.c_stub_field"
            ~doc:"C stub code generation for record field accessors"))

(* ------------------------------------------------------------------ *)
(*  Getter stubs                                                      *)
(* ------------------------------------------------------------------ *)

(** Generate a C getter stub for a single record field.
    [c_type] is the C struct type (e.g. "GtkBorder").
    [field_info] is the pre-computed [field_info] for this field.
    Returns the complete C function code as a string, or [None] if the
    getter should not be generated (no_getter override). *)
let generate_field_getter ~c_type
    (field_info : Field_analysis.field_info) : string option =
  let ml_name = field_info.getter_c_name in

  let body =
    sprintf
      {|\
CAMLexport CAMLprim value %s(value self)
{
    CAMLparam1(self);
    %s *rec = %s_val(self);
    %s
}
|}
      ml_name c_type c_type field_info.c_getter_body
  in
  Some body

(** Generate C getter stubs for all fields of a record.
    Only generates stubs for fields that pass
    [Field_filter.should_generate_field_getter].
    Returns a list of C function code strings. *)
let generate_field_getters ~c_type
    (fields : Field_analysis.field_info list) : string list =
  List.filter_map fields ~f:(fun (field_info : Field_analysis.field_info) ->
      generate_field_getter ~c_type field_info)

(* ------------------------------------------------------------------ *)
(*  Setter stubs                                                      *)
(* ------------------------------------------------------------------ *)

(** Generate a C setter stub for a single record field.
    [c_type] is the C struct type (e.g. "GtkBorder").
    [field_info] is the pre-computed [field_info] for this field.
    Returns the complete C function code as a string, or [None] if the
    setter should not be generated (no_setter override). *)
let generate_field_setter ~c_type
    (field_info : Field_analysis.field_info) : string option =
  let ml_name = field_info.setter_c_name in

  let body =
    sprintf
      {|\
CAMLexport CAMLprim value %s(value self, value v_val)
{
    CAMLparam2(self, v_val);
    %s *rec = %s_val(self);
    %s
}
|}
      ml_name c_type c_type field_info.c_setter_body
  in
  Some body

(** Generate C setter stubs for all fields of a record.
    Only generates stubs for fields that pass
    [Field_filter.should_generate_field_setter].
    Returns a list of C function code strings. *)
let generate_field_setters ~c_type
    (fields : Field_analysis.field_info list) : string list =
  List.filter_map fields ~f:(fun (field_info : Field_analysis.field_info) ->
      generate_field_setter ~c_type field_info)

(* ------------------------------------------------------------------ *)
(*  Make constructor stubs                                           *)
(* ------------------------------------------------------------------ *)

(** Format a CAMLparam line for [n] params (1-5).
    Uses [CAMLparam<n>(...)] directly. *)
let format_camlparam_line param_names =
  let n = List.length param_names in
  if n = 0 then "CAMLparam0();"
  else
    sprintf "CAMLparam%d(%s);" n
      (String.concat ~sep:", " param_names)

(** Format CAMLxparam lines for extra params beyond the first five.
    Splits into chunks of at most 5. *)
let format_camlxparam_lines param_names =
  let rec chunk_params params =
    match params with
    | [] -> []
    | _ ->
        let chunk = List.filteri ~f:(fun i _ -> i < 5) params in
        let remaining = List.filteri ~f:(fun i _ -> i >= 5) params in
        chunk :: chunk_params remaining
  in
  chunk_params param_names
  |> List.map ~f:(fun chunk ->
         sprintf "CAMLxparam%d(%s);" (List.length chunk)
           (String.concat ~sep:", " chunk))
  |> String.concat ~sep:"\n"

(** Generate a C [make] constructor stub for a record.
    The function allocates a new struct via [g_new0], assigns each writable
    field from its parameter, and returns the wrapped result.

    [make_c_name] is the C function name (e.g. "ml_gtk_border_make").
    [c_type] is the C struct type (e.g. "GtkBorder").
    [fields] is the list of writable [field_info] values (each supplies a
    [c_make_assignment] that uses [v_<field_name>] as the parameter name).

    For 0-5 parameters, emits a simple [CAMLparam<n>] function.
    For >5 parameters, emits both [_native] and [_bytecode] entry points
    using [CAMLparam5] + [CAMLxparam] for the native variant. *)
let generate_field_make ~c_type (make_c_name : string)
    (fields : Field_analysis.field_info list) : string option =
  (* Filter to only writable fields (non-writable fields cannot be set) *)
  let writable_fields =
    List.filter fields ~f:(fun (field_info : Field_analysis.field_info) ->
        (* Exclude fields that generate assignment code that is a no-op
           (bitfield without explicit shift gets dropped via filtering) —
           currently all computed fields are valid.  We keep writable
           fields that have a non-empty assignment body. *)
        String.length field_info.c_make_assignment > 0)
  in

  match writable_fields with
  | [] ->
      (* Zero writable fields — generate a simple zero-arg allocator *)
      let body =
        sprintf
          {|\
CAMLexport CAMLprim value %s(value unit)
{
    CAMLparam1(unit);
    %s *obj = g_new0(%s, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    CAMLreturn(Val_%s(obj));
}
|}
          make_c_name c_type c_type c_type
      in
      Some body

  | _ ->
      let param_names =
        List.map writable_fields ~f:(fun (field_info : Field_analysis.field_info) ->
            "v_" ^ field_info.field_name)
      in
      let param_count = List.length param_names in
      let assignments =
        List.map writable_fields ~f:(fun (field_info : Field_analysis.field_info) ->
            sprintf "    %s" field_info.c_make_assignment)
        |> String.concat ~sep:"\n"
      in

      if param_count <= 5 then
        (* Simple case: CAMLparam<n> directly *)
        let camlparam_line = format_camlparam_line param_names in
        let body =
          sprintf
            {|\
CAMLexport CAMLprim value %s(%s)
{
    %s
    %s *obj = g_new0(%s, 1);
    if (obj == NULL) caml_failwith("allocation failed");
%s
    CAMLreturn(Val_%s(obj));
}
|}
            make_c_name
            (String.concat ~sep:", " (List.map ~f:(fun p -> "value " ^ p) param_names))
            camlparam_line
            c_type c_type assignments c_type
        in
        Some body
      else
        (* Multi-param: native + bytecode entry points *)
        let first_five =
          List.filteri ~f:(fun i _ -> i < 5) param_names
        in
        let rest =
          List.filteri ~f:(fun i _ -> i >= 5) param_names
        in
        let xparam_lines = format_camlxparam_lines rest in
        let params_decl =
          String.concat ~sep:", " (List.map ~f:(fun p -> "value " ^ p) param_names)
        in

        let native_body =
          sprintf
            {|\
CAMLexport CAMLprim value %s_native(%s)
{
    CAMLparam5(%s);
%s
    %s *obj = g_new0(%s, 1);
    if (obj == NULL) caml_failwith("allocation failed");
%s
    CAMLreturn(Val_%s(obj));
}
|}
            make_c_name params_decl
            (String.concat ~sep:", " first_five)
            (if String.length xparam_lines > 0 then xparam_lines ^ "\n" else "")
            c_type c_type assignments c_type
        in

        let bytecode_body =
          sprintf
            {|\
CAMLexport CAMLprim value %s_bytecode(value * argv, int argn)
{
    return %s_native(%s);
}
|}
            make_c_name make_c_name
            (String.concat ~sep:", "
               (List.mapi ~f:(fun i _ -> sprintf "argv[%d]" i) param_names))
        in

        Some (native_body ^ bytecode_body)

(** Generate the [make] constructor stub for a record.
    Uses the first writable field's [make_c_name] as the function name.
    Returns [None] if no fields were provided. *)
let generate_field_make_from_fields ~c_type
    (fields : Field_analysis.field_info list) : string option =
  match fields with
  | [] -> None
  | first :: _ ->
      generate_field_make ~c_type first.make_c_name fields
