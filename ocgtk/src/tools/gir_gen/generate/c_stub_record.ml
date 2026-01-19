(* C Stub Code Generation - Record Support *)

open Printf
open Containers
open StdLabels
open Types

(* Check if a record has a copy method, indicating it's a value-like record
    that should be stack-allocated in C but heap-allocated in OCaml *)
let has_copy_method (record : gir_record) =
  List.exists record.methods ~f:C_stub_helpers.is_copy_method

let is_non_opaque_record (record : gir_record) =
  (not record.opaque) && not record.disguised

let is_value_like_record (record : gir_record) =
  is_non_opaque_record record && has_copy_method record

let generate_forward_decls ~records =
  let buf = Buffer.create 2048 in
  let seen = Hashtbl.create 97 in

  (* Generate macros for value-like records that have copy methods *)
  let value_like_records, non_value_like_records =
    List.partition ~f:is_value_like_record records
  in
  if List.length value_like_records > 0 then begin
    Buffer.add_string buf "/* Value-returning structs copied into OCaml */\n";

    (* First, add forward declarations for the copy functions *)
    List.iter
      ~f:(fun (record : gir_record) ->
        if not (Hashtbl.mem seen record.c_type) then begin
          bprintf buf "value copy_%s(const %s *ptr);\n" record.c_type
            record.c_type
        end)
      value_like_records;
    Buffer.add_string buf "\n";

    (* Then add the macros that use those functions *)
    List.iter
      ~f:(fun (record : gir_record) ->
        if not (Hashtbl.mem seen record.c_type) then begin
          Hashtbl.add seen record.c_type ();
          (* Find the copy method to get its C identifier *)
          let copy_func =
            List.find_opt record.methods ~f:(fun (meth : gir_method) ->
                let lower_name = String.lowercase_ascii meth.method_name in
                String.equal lower_name "copy")
          in
          match copy_func with
          | Some _ ->
              bprintf buf "#ifndef Val_%s\n" record.c_type;
              bprintf buf "#define %s_val(val) ((%s*)ext_of_val(val))\n"
                record.c_type record.c_type;
              bprintf buf "#define Val_%s(obj) copy_%s((obj))\n" record.c_type
                record.c_type;
              bprintf buf
                "#define Val_%s_option(ptr) ((ptr) ? Val_some(copy_%s(ptr)) : \
                 Val_none)\n"
                record.c_type record.c_type;
              bprintf buf "#endif /* Val_%s */\n\n" record.c_type
          | None -> ()
        end)
      value_like_records;
    Buffer.add_string buf "\n"
  end;

  List.iter
    ~f:(fun (record : gir_record) ->
      (* Forward declarations for functions *)
      bprintf buf
        "/* Forward declarations for %s converters (non-opaque record with  *)\n\
        \              fields) */\n"
        record.c_type;
      bprintf buf "%s *%s_val(value val);\n" record.c_type record.c_type;
      bprintf buf "value Val_%s(const %s *ptr);\n" record.c_type record.c_type;
      bprintf buf "value Val_%s_option(const %s *ptr);\n\n" record.c_type
        record.c_type)
    non_value_like_records;

  Buffer.contents buf

let generate_opaque_record_conversions ~buf (record : gir_record) =
  (* Generate public conversion functions for opaque records *)
  bprintf buf
    "/* Conversion functions for %s (opaque record with hidden fields) */\n"
    record.c_type;

  (* X_val function *)
  bprintf buf "%s *%s_val(value v) {\n" record.c_type record.c_type;
  bprintf buf "  return *(%s **)Data_custom_val(v);\n" record.c_type;
  bprintf buf "}\n\n";

  (* Val_X function *)
  bprintf buf "value Val_%s(const %s *ptr) {\n" record.c_type record.c_type;
  bprintf buf "  if (ptr == NULL) return Val_none;\n";
  bprintf buf "  return ml_gir_record_val_ptr(ptr);\n";
  bprintf buf "}\n\n";

  (* Val_X_option function *)
  bprintf buf "value Val_%s_option(const %s *ptr) {\n" record.c_type
    record.c_type;
  bprintf buf "  if (ptr == NULL) return Val_none;\n";
  bprintf buf "  return Val_some(Val_%s(ptr));\n" record.c_type;
  bprintf buf "}\n\n"

let generate_value_record_conversions ~buf (record : gir_record) =
  (* Generate copy function for value-like records *)
  bprintf buf
    "/* Copy function for %s (value-like record with copy method) */\n"
    record.c_type;

  (* Find the copy function from the methods *)
  let copy_method =
    List.find_opt record.methods ~f:(fun (meth : gir_method) ->
        let lower_name = String.lowercase_ascii meth.method_name in
        String.equal lower_name "copy")
  in

  match copy_method with
  | Some copy_meth ->
      (* Generate the copy_TypeName function that wraps the GTK copy function *)
      bprintf buf "value copy_%s(const %s *ptr) {\n" record.c_type
        record.c_type;
      bprintf buf "  if (ptr == NULL) return Val_none;\n";
      bprintf buf "  %s *copy = %s((%s*)ptr);\n" record.c_type
        copy_meth.c_identifier record.c_type;
      bprintf buf "  return ml_gir_record_val_ptr(g_new0(%s, 1));\n"
        record.c_type;
      bprintf buf "}\n\n"
  | None ->
      (* Fallback: generate a simple memcpy-based copy *)
      bprintf buf "value copy_%s(const %s *ptr) {\n" record.c_type
        record.c_type;
      bprintf buf "  if (ptr == NULL) return Val_none;\n";
      bprintf buf "  %s *copy = g_malloc(sizeof(%s));\n" record.c_type
        record.c_type;
      bprintf buf "  memcpy(copy, ptr, sizeof(%s));\n" record.c_type;
      bprintf buf "  return ml_gir_record_val_ptr(copy));\n";
      bprintf buf "}\n\n"

let generate_record_c_code ~ctx (record : gir_record) =
  let buf = Buffer.create 2048 in

  Buffer.add_string buf
    (C_stub_helpers.generate_c_file_header ~ctx ~class_name:record.record_name
       ~external_enums:ctx.external_enums
       ~external_bitfields:ctx.external_bitfields ());

  let class_snake = Utils.to_snake_case record.record_name in

  (* Generate conversion functions for non-opaque records *)
  let is_value_record = is_value_like_record record in

  if not is_value_record then
    generate_opaque_record_conversions ~buf record
  else
    generate_value_record_conversions ~buf record;

  C_stub_helpers.generate_constructors ~ctx ~c_type:record.c_type
     ~class_name:record.record_name ~buf
     ~generator:C_stub_class.generate_c_constructor record.constructors;

  let namespace_snake = Utils.to_snake_case ctx.namespace.namespace_name in

  (* Synthetic allocator for non-opaque records without constructors *)
  if is_non_opaque_record record && List.length record.constructors = 0 then begin
    let ml_name = sprintf "ml_%s_%s_new" namespace_snake class_snake in
    bprintf buf "\n/* Synthetic allocator for non-opaque record %s */\n"
      record.record_name;
    bprintf buf "CAMLexport CAMLprim value %s(value unit)\n{\n" ml_name;
    bprintf buf "    CAMLparam1(unit);\n";
    bprintf buf "    %s *obj = g_new0(%s, 1);\n" record.c_type record.c_type;
    bprintf buf
      "    if (obj == NULL) caml_failwith(\"%s allocation failed\");\n"
      record.c_type;
    bprintf buf "    CAMLreturn(Val_%s(obj));\n" record.c_type;
    bprintf buf "}\n"
  end;

  C_stub_helpers.generate_methods ~ctx ~c_type:record.c_type
    ~class_name:record.record_name ~buf
    ~generator:C_stub_class.generate_c_method
    ~extra_filter:(fun meth -> not (C_stub_helpers.is_copy_or_free meth))
    record.methods;

  Buffer.contents buf
