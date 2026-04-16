(* Enum and Bitfield Code Generation *)

open StdLabels
open Printf
open Types

(** Emit a single converter branch, optionally wrapped in a per-member version
    guard. [~class_version]: the enum/bitfield entity-level version (outer
    guard, if any) [~member_version]: this specific member's version override
    [~fallback_line]: if [Some s], emit [#else s] between guard and [#endif]; if
    [None], emit only [#if branch #endif] (C->OCaml direction, where the
    [default:] case handles unknown values) [~branch]: the C source line(s) to
    guard (no trailing newline required) *)
let emit_member_branch ~namespace ~class_version ~member_version ~fallback_line
    ~branch buf =
  match Version_guard.resolve_guard ~class_version ~member_version with
  | Error _ | Ok (Version_guard.No_guard | Version_guard.Class_guard _) ->
      Buffer.add_string buf branch
  | Ok (Version_guard.Member_guard v) -> (
      match Version_guard.emit_c_guard namespace v ~is_opening:true with
      | Error _ -> Buffer.add_string buf branch
      | Ok guard_if -> (
          bprintf buf "%s\n%s\n" guard_if branch;
          (match fallback_line with
          | None -> ()
          | Some fb -> bprintf buf "%s\n%s\n" Version_guard.c_guard_else fb);
          match Version_guard.emit_c_guard namespace v ~is_opening:false with
          | Ok guard_endif -> Buffer.add_string buf (guard_endif ^ "\n")
          | Error _ -> Buffer.add_string buf "#endif\n"))

(* Generate OCaml enum type definition *)
let generate_ocaml_enum enum =
  let buf = Buffer.create 512 in

  bprintf buf "(* %s - enumeration *)\n" enum.enum_name;
  (match enum.enum_doc with
  | Some doc -> bprintf buf "(** %s *)\n" (Utils.sanitize_doc doc)
  | None -> ());

  bprintf buf "type %s = [\n" (Utils.ocaml_enum_name enum);

  List.iteri
    ~f:(fun i member ->
      let variant_name = String.uppercase_ascii member.member_name in
      (* Prefix variant names that start with a digit *)
      let variant_name =
        if
          String.length variant_name > 0
          && variant_name.[0] >= '0'
          && variant_name.[0] <= '9'
        then "V" ^ variant_name
        else variant_name
      in
      (match member.member_doc with
      | Some doc -> bprintf buf "  (** %s *)\n" (Utils.sanitize_doc doc)
      | None -> ());
      bprintf buf "  | `%s" variant_name;
      if i < List.length enum.members - 1 then bprintf buf "\n"
      else bprintf buf "\n]\n\n")
    enum.members;

  Buffer.contents buf

(* Generate OCaml bitfield type definition *)
let generate_ocaml_bitfield bitfield =
  let buf = Buffer.create 512 in

  bprintf buf "(* %s - bitfield/flags *)\n" bitfield.bitfield_name;
  (match bitfield.bitfield_doc with
  | Some doc -> bprintf buf "(** %s *)\n" (Utils.sanitize_doc doc)
  | None -> ());

  bprintf buf "type %s_flag = [\n" (Utils.ocaml_bitfield_name bitfield);

  List.iteri
    ~f:(fun i flag ->
      let variant_name = String.uppercase_ascii flag.flag_name in
      (* Prefix variant names that start with a digit *)
      let variant_name =
        if
          String.length variant_name > 0
          && variant_name.[0] >= '0'
          && variant_name.[0] <= '9'
        then "V" ^ variant_name
        else variant_name
      in
      (match flag.flag_doc with
      | Some doc -> bprintf buf "  (** %s *)\n" (Utils.sanitize_doc doc)
      | None -> ());
      bprintf buf "  | `%s" variant_name;
      if i < List.length bitfield.flags - 1 then bprintf buf "\n"
      else bprintf buf "\n]\n\n")
    bitfield.flags;

  bprintf buf "type %s = %s_flag list\n\n"
    (Utils.ocaml_bitfield_name bitfield)
    (Utils.ocaml_bitfield_name bitfield);

  Buffer.contents buf

(* Generate C conversion functions for enum *)
let generate_c_enum_converters ~namespace ~class_version enum =
  (* Skip enums with no members *)
  if List.length enum.members = 0 then ""
  else begin
    let buf = Buffer.create 1024 in
    let val_func = sprintf "Val_%s%s" namespace enum.enum_name in
    let c_val_func = sprintf "%s%s_val" namespace enum.enum_name in
    (* Generate C to OCaml converter *)
    bprintf buf "/* Convert %s to OCaml value */\n" enum.enum_c_type;
    bprintf buf "value %s(%s val) {\n" val_func enum.enum_c_type;
    bprintf buf "  switch (val) {\n";

    (* Track seen values to avoid duplicate case statements *)
    let seen_values = Hashtbl.create 10 in
    List.iter
      ~f:(fun enum_member ->
        if not (Hashtbl.mem seen_values enum_member.member_value) then begin
          Hashtbl.add seen_values enum_member.member_value true;
          let variant_name = String.uppercase_ascii enum_member.member_name in
          (* Prefix variant names that start with a digit *)
          let variant_name =
            if
              String.length variant_name > 0
              && variant_name.[0] >= '0'
              && variant_name.[0] <= '9'
            then "V" ^ variant_name
            else variant_name
          in
          let case_line =
            sprintf "    case %s: return caml_hash_variant(\"%s\"); /* `%s */\n"
              enum_member.c_identifier variant_name variant_name
          in
          emit_member_branch ~namespace ~class_version
            ~member_version:enum_member.member_version ~fallback_line:None
            ~branch:case_line buf
        end)
      enum.members;

    bprintf buf "    default: {\n";
    bprintf buf "      char msg[128];\n";
    bprintf buf
      "      g_snprintf(msg, sizeof(msg), \"Unknown %s value: %%d\", (int)val);\n"
      enum.enum_c_type;
    bprintf buf "      g_warning(\"%%s\", msg);\n";
    bprintf buf "      caml_failwith(msg);\n";
    bprintf buf "    }\n";
    bprintf buf "  }\n";
    bprintf buf "}\n\n";

    (* Generate OCaml to C converter *)
    bprintf buf "/* Convert OCaml value to %s */\n" enum.enum_c_type;
    bprintf buf "%s %s(value val) {\n" enum.enum_c_type c_val_func;

    List.iteri
      ~f:(fun i enum_member ->
        let variant_name = String.uppercase_ascii enum_member.member_name in
        (* Prefix variant names that start with a digit *)
        let variant_name =
          if
            String.length variant_name > 0
            && variant_name.[0] >= '0'
            && variant_name.[0] <= '9'
          then "V" ^ variant_name
          else variant_name
        in
        let fallback_line =
          match enum_member.member_version with
          | None -> None
          | Some v_str ->
              let msg =
                sprintf
                  "  %sif (val == caml_hash_variant(\"%s\")) \
                   caml_failwith(\"%s.%s requires %s\");"
                  (if i = 0 then "" else "else ")
                  variant_name enum.enum_c_type variant_name v_str
              in
              Some msg
        in
        let branch_line =
          sprintf
            "  %sif (val == caml_hash_variant(\"%s\")) return %s; /* `%s */\n"
            (if i = 0 then "" else "else ")
            variant_name enum_member.c_identifier variant_name
        in
        emit_member_branch ~namespace ~class_version
          ~member_version:enum_member.member_version ~fallback_line
          ~branch:branch_line buf)
      enum.members;

    bprintf buf "  else {\n";
    bprintf buf "    char msg[128];\n";
    bprintf buf
      "    g_snprintf(msg, sizeof(msg), \"Unknown %s tag: %%ld\", val);\n"
      enum.enum_c_type;
    bprintf buf "    g_warning(\"%%s\", msg);\n";
    bprintf buf "    caml_failwith(msg);\n";
    bprintf buf "  }\n";
    bprintf buf "}\n\n";

    Buffer.contents buf
  end

(* Generate C conversion functions for bitfield *)
let generate_c_bitfield_converters ~namespace ~class_version bitfield =
  (* Skip bitfields with no flags *)
  if List.length bitfield.flags = 0 then ""
  else begin
    let buf = Buffer.create 1024 in
    let val_func = sprintf "Val_%s%s" namespace bitfield.bitfield_name in
    let c_val_func = sprintf "%s%s_val" namespace bitfield.bitfield_name in

    (* Special case: GdkPixbufFormatFlags is in GIR but marked skip in C headers *)
    if bitfield.bitfield_c_type = "GdkPixbufFormatFlags" then begin
      bprintf buf
        "/* GdkPixbufFormatFlags is in GIR but marked skip in C headers */\n";
      bprintf buf "#ifndef GDK_PIXBUF_FORMAT_WRITABLE\n";
      bprintf buf "typedef enum {\n";
      List.iter
        ~f:(fun flag ->
          bprintf buf "  %s = %d,\n" flag.flag_c_identifier flag.flag_value)
        bitfield.flags;
      bprintf buf "} GdkPixbufFormatFlags;\n";
      bprintf buf "#endif\n\n"
    end;

    (* Generate C to OCaml converter (int flags -> list of variants) *)
    bprintf buf "/* Convert %s to OCaml flag list */\n" bitfield.bitfield_c_type;
    bprintf buf "value %s(%s flags) {\n" val_func bitfield.bitfield_c_type;
    bprintf buf "  CAMLparam0();\n";
    bprintf buf "  CAMLlocal2(result, cons);\n";
    bprintf buf "  result = Val_emptylist;\n\n";

    (* Check each flag bit and add to list if set *)
    List.iter
      ~f:(fun flag ->
        let variant_name = String.uppercase_ascii flag.flag_name in
        (* Prefix variant names that start with a digit *)
        let variant_name =
          if
            String.length variant_name > 0
            && variant_name.[0] >= '0'
            && variant_name.[0] <= '9'
          then "V" ^ variant_name
          else variant_name
        in
        let branch =
          sprintf
            "  if (flags & %s) {\n\
            \    cons = caml_alloc(2, 0);\n\
            \    Store_field(cons, 0, Val_int(caml_hash_variant(\"%s\"))); /* \
             `%s */\n\
            \    Store_field(cons, 1, result);\n\
            \    result = cons;\n\
            \  }\n"
            flag.flag_c_identifier variant_name variant_name
        in
        emit_member_branch ~namespace ~class_version
          ~member_version:flag.flag_version ~fallback_line:None ~branch buf)
      bitfield.flags;

    bprintf buf "\n  CAMLreturn(result);\n";
    bprintf buf "}\n\n";

    (* Generate OCaml to C converter (list of variants -> int flags) *)
    bprintf buf "/* Convert OCaml flag list to %s */\n" bitfield.bitfield_c_type;
    bprintf buf "%s %s(value list) {\n" bitfield.bitfield_c_type c_val_func;
    bprintf buf "  %s result = 0;\n" bitfield.bitfield_c_type;
    bprintf buf "  while (list != Val_emptylist) {\n";
    bprintf buf "    int tag = Int_val(Field(list, 0));\n";

    List.iteri
      ~f:(fun i flag ->
        let variant_name = String.uppercase_ascii flag.flag_name in
        (* Prefix variant names that start with a digit *)
        let variant_name =
          if
            String.length variant_name > 0
            && variant_name.[0] >= '0'
            && variant_name.[0] <= '9'
          then "V" ^ variant_name
          else variant_name
        in
        let fallback_line =
          match flag.flag_version with
          | None -> None
          | Some v_str ->
              let msg =
                sprintf
                  "    %sif (tag == caml_hash_variant(\"%s\")) \
                   caml_failwith(\"%s.%s requires %s\");"
                  (if i = 0 then "" else "else ")
                  variant_name bitfield.bitfield_c_type variant_name v_str
              in
              Some msg
        in
        let branch_line =
          sprintf
            "    %sif (tag == caml_hash_variant(\"%s\")) result |= %s; /* `%s */\n"
            (if i = 0 then "" else "else ")
            variant_name flag.flag_c_identifier variant_name
        in
        emit_member_branch ~namespace ~class_version
          ~member_version:flag.flag_version ~fallback_line ~branch:branch_line
          buf)
      bitfield.flags;

    bprintf buf "    list = Field(list, 1);\n";
    bprintf buf "  }\n";
    bprintf buf "  return result;\n";
    bprintf buf "}\n\n";

    Buffer.contents buf
  end
