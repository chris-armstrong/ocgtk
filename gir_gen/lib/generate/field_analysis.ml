(* Field Analysis — centralizes type resolution and C conversion pattern
   computation for record field accessors.  All three generator layers
   (C_stub_field, Layer1_field, Class_gen_field) consume [field_info] values
   produced by this module. *)

open Printf
open Containers
open StdLabels
open Types

module Log =
  (val Logs.src_log
         (Logs.Src.create "gir_gen.field_analysis"
            ~doc:"Field analysis for record accessor generation"))

type field_info = {
  field_name : string;                 (* OCaml snake_case name *)
  c_field_name : string;               (* C struct member name *)
  getter_c_name : string;               (* ml_<prefix>_<record>_get_<field> *)
  setter_c_name : string;               (* ml_<prefix>_<record>_set_<field> *)
  make_c_name : string;                (* ml_<prefix>_<record>_make *)
  ocaml_type : string;                  (* e.g. "int", "string option", "Gdk.RGBA.t" *)
  c_getter_body : string;              (* C function body for getter *)
  c_setter_body : string;              (* C function body for setter *)
  c_make_assignment : string;          (* C assignment for make constructor *)
  needs_g_free : bool;                  (* setter must g_free old string/SList *)
  needs_g_strdup : bool;                (* setter/make must g_strdup new strings *)
  is_array : bool;
  is_bitfield : bool;
  bit_shift : int option;
  field_gir_type : Types.gir_type option;
}

(* Build C function names for getter, setter, and make. *)
let build_c_names ~ctx ~record_name field_name =
  let prefix = Utils.extract_ml_prefix ctx in
  let record_snake = Utils.to_snake_case record_name in
  let field_snake = Utils.to_snake_case field_name in
  let getter_c_name = sprintf "%s%s_get_%s" prefix record_snake field_snake in
  let setter_c_name = sprintf "%s%s_set_%s" prefix record_snake field_snake in
  let make_c_name = sprintf "%s%s_make" prefix record_snake in
  (getter_c_name, setter_c_name, make_c_name)

(* Resolve the OCaml type for a field's GIR type. *)
let resolve_ocaml_type ~ctx (gir_type : gir_type) =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some tm ->
      let base = tm.ocaml_type in
      if gir_type.nullable then base ^ " option" else base
  | None ->
      Log.warn (fun m ->
          m "resolve_ocaml_type: no mapping for %s, defaulting to 'unit'\n"
            gir_type.name);
      "unit"

(* Determine the C struct member access expression.
   e.g., "rec->left" for a field named "left" in a struct accessed via "rec". *)
let c_field_access_expr c_field_name = "rec->" ^ c_field_name

(* Build a getter body for a primitive type using c_to_ml mapping. *)
let primitive_getter_body c_to_ml c_field_expr =
  sprintf "CAMLreturn(%s(%s));" c_to_ml c_field_expr

(* Build a setter body for a primitive type using ml_to_c mapping. *)
let primitive_setter_body ml_to_c c_field_expr =
  sprintf "%s = %s(v_val);\n    CAMLreturn(Val_unit);" c_field_expr ml_to_c

(* Build a make assignment for a primitive type. *)
let primitive_make_assignment ml_to_c c_field_expr param_name =
  sprintf "%s = %s(%s);" c_field_expr ml_to_c param_name

(* Build getter body for a string field. *)
let string_getter_body c_field_expr =
  sprintf "CAMLreturn(caml_copy_string(%s));" c_field_expr

(* Build setter body for a string field. *)
let string_setter_body c_field_expr =
  sprintf "g_free(%s);\n    %s = g_strdup(String_val(v_val));\n    CAMLreturn(Val_unit);"
    c_field_expr c_field_expr

(* Build make assignment for a string field. *)
let string_make_assignment c_field_expr param_name =
  sprintf "%s = g_strdup(String_val(%s));" c_field_expr param_name

(* Build getter body for an enum field. *)
let enum_getter_body c_to_ml c_field_expr =
  sprintf "CAMLreturn(%s(%s));" c_to_ml c_field_expr

(* Build setter body for an enum field. *)
let enum_setter_body ml_to_c c_field_expr =
  sprintf "%s = %s(v_val);\n    CAMLreturn(Val_unit);" c_field_expr ml_to_c

(* Build make assignment for an enum field. *)
let enum_make_assignment ml_to_c c_field_expr param_name =
  sprintf "%s = %s(%s);" c_field_expr ml_to_c param_name

(* Build getter body for a nullable pointer field (e.g., nested record pointer). *)
let nullable_getter_body c_to_ml c_field_expr =
  sprintf "CAMLreturn(Val_option(%s, %s));" c_field_expr c_to_ml

(* Build setter body for a nullable pointer field. *)
let nullable_setter_body ml_to_c c_field_expr =
  sprintf
    "if (%s) g_free(%s);\n    %s = Is_block(v_val) ? %s(Field(v_val, 0)) : NULL;\n    CAMLreturn(Val_unit);"
    c_field_expr c_field_expr c_field_expr ml_to_c

(* Build make assignment for a nullable pointer field. *)
let nullable_make_assignment ml_to_c c_field_expr param_name =
  sprintf "%s = Is_block(%s) ? %s(Field(%s, 0)) : NULL;" c_field_expr param_name
    ml_to_c param_name

(* Build getter body for an inline nested record field (embedded by value). *)
let inline_record_getter_body c_to_ml c_field_expr =
  sprintf "CAMLreturn(%s(&%s));" c_to_ml c_field_expr

(* Build setter body for an inline nested record field (embedded by value). *)
let inline_record_setter_body ml_to_c c_field_expr =
  sprintf "%s = *%s(v_val);\n    CAMLreturn(Val_unit);" c_field_expr ml_to_c

(* Build make assignment for an inline nested record field (embedded by value). *)
let inline_record_make_assignment ml_to_c c_make_field_expr param_name =
  sprintf "%s = *%s(%s);" c_make_field_expr ml_to_c param_name

(* Build getter body for an SList field. *)
let slist_getter_body (gir_type : gir_type) c_field_expr element_mapping =
  let elem_c_to_ml = element_mapping.c_to_ml in
  let _c_type =
    Option.value gir_type.c_type
      ~default:(if Type_mappings.is_glist_type gir_type then "GList*" else "GSList*")
  in
  if Filtering.is_string_type (Some element_mapping.c_type) then
    sprintf
      "CAMLlocal1(result);\n    \
       Val_GSList_with(%s, result, item, cell, caml_copy_string(item));\n    \
       CAMLreturn(result);"
      c_field_expr
  else
    sprintf
      "CAMLlocal1(result);\n    \
       Val_GSList_with(%s, result, item, cell, %s(cell));\n    \
       CAMLreturn(result);"
      c_field_expr elem_c_to_ml

(* Build setter body for an SList field. *)
let slist_setter_body (_gir_type : gir_type) c_field_expr element_mapping =
  let elem_ml_to_c = element_mapping.ml_to_c in
  if Filtering.is_string_type (Some element_mapping.c_type) then
    sprintf
      "g_slist_free_full(%s, g_free);\n    \
       GSList_val_with(v_val, %s, g_strdup(String_val(Field(_iter, 0))));\n    \
       CAMLreturn(Val_unit);"
      c_field_expr c_field_expr
  else
    sprintf
      "g_slist_free(%s);\n    \
       GSList_val_with(v_val, %s, %s(Field(_iter, 0)));\n    \
       CAMLreturn(Val_unit);"
      c_field_expr c_field_expr elem_ml_to_c

(* Build make assignment for an SList field. *)
let slist_make_assignment c_make_field_expr element_mapping param_name =
  let elem_ml_to_c = element_mapping.ml_to_c in
  if Filtering.is_string_type (Some element_mapping.c_type) then
    sprintf
      "GSList_val_with(%s, %s, g_strdup(String_val(Field(_iter, 0))));"
      param_name c_make_field_expr
  else
    sprintf
      "GSList_val_with(%s, %s, %s(Field(_iter, 0)));"
      param_name c_make_field_expr elem_ml_to_c

(* Determine if an element type is a struct (C record), meaning boxing/unboxing
   macros take/return a pointer rather than a value. *)
let element_is_struct_type ~ctx (element_type : gir_type) : bool =
  match Type_mappings.classify_type ~ctx element_type with
  | Type_mappings.Tk_Record -> true
  | _ -> false

(* Build getter body for a fixed-size array field. *)
let array_getter_body ~ctx (gir_type : gir_type) c_field_expr =
  match gir_type.array with
  | Some arr -> (
      match arr.fixed_size with
      | Some size -> (
          match Type_mappings.find_type_mapping_for_gir_type ~ctx arr.element_type with
          | Some elem_tm ->
              let element_is_struct = element_is_struct_type ~ctx arr.element_type in
              C_stub_helpers.generate_array_getter_body
                ~element_c_type:elem_tm.c_type ~element_c_to_ml:elem_tm.c_to_ml
                ~element_is_struct ~size ~c_field:c_field_expr
          | None ->
              failwith
                (sprintf "array_getter_body: no element mapping for %s"
                   arr.element_type.name))
      | None ->
          failwith "array_getter_body: fixed-size array without fixed_size")
  | None -> failwith "array_getter_body: not an array type"

(* Build setter body for a fixed-size array field. *)
let array_setter_body ~ctx (gir_type : gir_type) c_field_expr =
  match gir_type.array with
  | Some arr -> (
      match arr.fixed_size with
      | Some size -> (
          match Type_mappings.find_type_mapping_for_gir_type ~ctx arr.element_type with
          | Some elem_tm ->
              let element_is_struct = element_is_struct_type ~ctx arr.element_type in
              C_stub_helpers.generate_array_setter_body
                ~element_c_type:elem_tm.c_type ~element_ml_to_c:elem_tm.ml_to_c
                ~element_is_struct ~size ~c_field:c_field_expr
          | None ->
              failwith
                (sprintf "array_setter_body: no element mapping for %s"
                   arr.element_type.name))
      | None ->
          failwith "array_setter_body: fixed-size array without fixed_size")
  | None -> failwith "array_setter_body: not an array type"

(* Build make assignment for a fixed-size array field. *)
let array_make_assignment ~ctx (gir_type : gir_type) c_make_field_expr param_name =
  match gir_type.array with
  | Some arr -> (
      match arr.fixed_size with
      | Some size -> (
          match Type_mappings.find_type_mapping_for_gir_type ~ctx arr.element_type with
          | Some elem_tm ->
              let is_float =
                String.equal elem_tm.c_type "gdouble"
                || String.equal elem_tm.c_type "gfloat"
                || String.equal elem_tm.c_type "double"
                || String.equal elem_tm.c_type "float"
              in
              let element_is_struct = element_is_struct_type ~ctx arr.element_type in
              if is_float then
                sprintf
                  "for (int i = 0; i < %d; i++)\n      \
                     %s[i] = Double_field(%s, i);"
                  size c_make_field_expr param_name
              else
                let deref = if element_is_struct then "*" else "" in
                sprintf
                  "for (int i = 0; i < %d; i++)\n      \
                     %s[i] = %s%s(Field(%s, i));"
                  size c_make_field_expr deref elem_tm.ml_to_c param_name
          | None ->
              failwith
                (sprintf "array_make_assignment: no element mapping for %s"
                   arr.element_type.name))
      | None -> failwith "array_make_assignment: fixed-size array without fixed_size")
  | None -> failwith "array_make_assignment: not an array type"

(* Build getter body for a gchar** field. *)
let strv_getter_body c_field_expr =
  C_stub_helpers.generate_strv_getter_body ~c_field:c_field_expr

(* Build setter body for a gchar** field. *)
let strv_setter_body c_field_expr =
  C_stub_helpers.generate_strv_setter_body ~c_field:c_field_expr

(* Build make assignment for a gchar** field. *)
let strv_make_assignment c_field_expr param_name =
  sprintf "Strv_val(%s, %s);" param_name c_field_expr

(** Compute [field_info] for a single record field.
    Returns [None] if the field type cannot be resolved. *)
let compute_field_info ~ctx ~record_name ~c_type:_ (field : gir_record_field) :
    field_info option =
  match field.field_type with
  | None -> None
  | Some field_type ->
      let field_name = Utils.to_snake_case field.field_name in
      let c_field_name = field.field_name in
      let c_field_expr = c_field_access_expr c_field_name in
      let c_make_field_expr = "obj->" ^ c_field_name in
      let getter_c_name, setter_c_name, make_c_name =
        build_c_names ~ctx ~record_name field.field_name
      in

      let ocaml_type = resolve_ocaml_type ~ctx field_type in

      (* Determine type classification to pick the right conversion pattern. *)
      let type_kind = Type_mappings.classify_type ~ctx field_type in
      let is_list = Type_mappings.is_list_type field_type in
      let is_array = Option.is_some field_type.array in
      let is_string = Filtering.is_string_type field_type.c_type in
      let is_nullable = field_type.nullable in

      (* Check if the field type is a gchar** (null-terminated string array) *)
      let is_strv =
        match field_type.c_type with
        | Some "gchar**" | Some "char**" -> true
        | _ -> false
      in

      (* Check if this is an SList with a known element type. *)
      let is_slist_with_element =
        is_list
        &&
        match field_type.array with
        | Some arr -> (
            match
              Type_mappings.find_type_mapping_for_gir_type ~ctx arr.element_type
            with
            | Some _ -> true
            | None -> false)
        | None -> false
      in

      (* Build getter/setter/make bodies based on type classification. *)
      let ( c_getter_body,
            c_setter_body,
            c_make_assignment,
            needs_g_free,
            needs_g_strdup ) =
        if is_strv then
          ( strv_getter_body c_field_expr,
            strv_setter_body c_field_expr,
            strv_make_assignment c_make_field_expr ("v_" ^ field_name),
            true,
            true )
        else if is_array then
          ( array_getter_body ~ctx field_type c_field_expr,
            array_setter_body ~ctx field_type c_field_expr,
            array_make_assignment ~ctx field_type c_make_field_expr ("v_" ^ field_name),
            false,
            false )
        else if is_slist_with_element then
          let elem_tm =
            match field_type.array with
            | Some arr ->
                CCOption.get_exn_or "slist element mapping"
                  (Type_mappings.find_type_mapping_for_gir_type ~ctx arr.element_type)
            | None -> failwith "is_slist_with_element: no array info"
          in
          ( slist_getter_body field_type c_field_expr elem_tm,
            slist_setter_body field_type c_field_expr elem_tm,
            slist_make_assignment c_make_field_expr elem_tm ("v_" ^ field_name),
            true,
            true )
        else if is_string then
          ( string_getter_body c_field_expr,
            string_setter_body c_field_expr,
            string_make_assignment c_make_field_expr ("v_" ^ field_name),
            true,
            true )
        else if is_nullable && (match type_kind with Type_mappings.Tk_Primitive -> false | _ -> true) then
          (* Nullable non-primitive: record pointer, enum pointer, etc. *)
          match Type_mappings.find_type_mapping_for_gir_type ~ctx field_type with
          | Some tm ->
              ( nullable_getter_body tm.c_to_ml c_field_expr,
                nullable_setter_body tm.ml_to_c c_field_expr,
                nullable_make_assignment tm.ml_to_c c_make_field_expr ("v_" ^ field_name),
                true,
                false )
          | None ->
              ( primitive_getter_body "Val_int" c_field_expr,
                primitive_setter_body "Int_val" c_field_expr,
                primitive_make_assignment "Int_val" c_make_field_expr ("v_" ^ field_name),
                false,
                false )
        else
          match type_kind with
          | Type_mappings.Tk_Record -> (
              (* Record field: either inline (by value) or pointer.
                 Use the field's own type mapping to get the right Val_/val_ functions.
                 Pointer fields (c_type ends with '*') need no & deref; inline fields do. *)
              let field_c_type_ends_with_ptr =
                match field_type.c_type with
                | Some ct ->
                    String.length ct > 0 && Char.equal ct.[String.length ct - 1] '*'
                | None -> false
              in
              match Type_mappings.find_type_mapping_for_gir_type ~ctx field_type with
              | Some tm ->
                  if field_c_type_ends_with_ptr then
                    (* Pointer to record: accessor takes/returns pointer directly *)
                    ( primitive_getter_body tm.c_to_ml c_field_expr,
                      primitive_setter_body tm.ml_to_c c_field_expr,
                      primitive_make_assignment tm.ml_to_c c_make_field_expr ("v_" ^ field_name),
                      false,
                      false )
                  else
                    (* Inline record (embedded by value): need & for getter, * for setter *)
                    ( inline_record_getter_body tm.c_to_ml c_field_expr,
                      inline_record_setter_body tm.ml_to_c c_field_expr,
                      inline_record_make_assignment tm.ml_to_c c_make_field_expr ("v_" ^ field_name),
                      false,
                      false )
              | None ->
                  ( primitive_getter_body "Val_int" c_field_expr,
                    primitive_setter_body "Int_val" c_field_expr,
                    primitive_make_assignment "Int_val" c_make_field_expr ("v_" ^ field_name),
                    false,
                    false ))
          | Type_mappings.Tk_Enum | Type_mappings.Tk_Bitfield ->
              let tm =
                CCOption.get_exn_or "enum mapping"
                  (Type_mappings.find_type_mapping_for_gir_type ~ctx field_type)
              in
              ( enum_getter_body tm.c_to_ml c_field_expr,
                enum_setter_body tm.ml_to_c c_field_expr,
                enum_make_assignment tm.ml_to_c c_make_field_expr ("v_" ^ field_name),
                false,
                false )
          | _ -> (
              match
                Type_mappings.find_type_mapping_for_gir_type ~ctx field_type
              with
              | Some tm ->
                  ( primitive_getter_body tm.c_to_ml c_field_expr,
                    primitive_setter_body tm.ml_to_c c_field_expr,
                    primitive_make_assignment tm.ml_to_c c_make_field_expr
                      ("v_" ^ field_name),
                    false,
                    false )
              | None ->
                  ( primitive_getter_body "Val_int" c_field_expr,
                    primitive_setter_body "Int_val" c_field_expr,
                    primitive_make_assignment "Int_val" c_make_field_expr
                      ("v_" ^ field_name),
                    false,
                    false ))
      in

      Some
        {
          field_name;
          c_field_name;
          getter_c_name;
          setter_c_name;
          make_c_name;
          ocaml_type;
          c_getter_body;
          c_setter_body;
          c_make_assignment;
          needs_g_free;
          needs_g_strdup;
          is_array;
          is_bitfield = false;
          bit_shift = None;
          field_gir_type = field.field_type;
        }

(** Compute [field_info] for all fields of a record entity.
    Only computes info for fields that pass [Field_filter.should_generate_field].
    Returns a list of [field_info] values. *)
let compute_record_field_info ~ctx ~record_name ~c_type (fields : gir_record_field list) :
    field_info list =
  List.filter_map
    ~f:(fun field ->
      if Field_filter.should_generate_field field then
        compute_field_info ~ctx ~record_name ~c_type field
      else None)
    fields
