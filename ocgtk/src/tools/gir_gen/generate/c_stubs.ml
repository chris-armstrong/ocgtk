(* C Stub Code Generation - Main orchestration module *)

open Printf
open StdLabels
open Types

(* Re-export helpers *)
include C_stub_helpers

(* Re-export property generation functions directly from property module *)
let generate_c_property_getter = C_stub_property.generate_c_property_getter
let generate_c_property_setter = C_stub_property.generate_c_property_setter

(* Re-export record generation functions *)
let has_copy_method = C_stub_record.has_copy_method
let is_value_like_record = C_stub_record.is_value_like_record
let generate_record_c_code = C_stub_record.generate_record_c_code

(* Re-export enum/bitfield proto emission *)
let emit_enum_proto = C_stub_enum.emit_enum_proto
let emit_bitfield_proto = C_stub_bitfield.emit_bitfield_proto

(* Generate common header file with forward declarations for enum/bitfield converters *)
let generate_forward_decls_header ~ctx ~classes ~interfaces ~gtk_enums
    ~gtk_bitfields ~external_enums ~external_bitfields ~records =
  let buf = Buffer.create 4096 in
  Buffer.add_string buf "/* GENERATED CODE - DO NOT EDIT */\n";
  Buffer.add_string buf
    "/* Forward declarations for generated enum, bitfield, class and record \
     converters */\n";
  Buffer.add_string buf "\n";
  bprintf buf "#ifndef _%s_generated_forward_decls_\n"
    (String.lowercase_ascii ctx.namespace.namespace_name);
  bprintf buf "#define _%s_generated_forward_decls_\n"
    (String.lowercase_ascii ctx.namespace.namespace_name);
  Buffer.add_string buf "\n";
  bprintf buf "%s\n" (include_header_for_namespace ctx.namespace.namespace_name);
  Buffer.add_string buf "#include <caml/mlvalues.h>\n";
  Buffer.add_string buf "\n";

  (* Generate class/interface forward declarations *)
  Buffer.add_string buf
    (C_stub_class.generate_forward_decls ~classes ~interfaces);

  (* Generate record forward declarations *)
  Buffer.add_string buf (C_stub_record.generate_forward_decls ~records);

  Buffer.add_string buf "/* Const-safe string extraction for setters */\n";
  Buffer.add_string buf
    "#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar \
     *)(expr)\n";
  Buffer.add_string buf "\n";
  Buffer.add_string buf
    "/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in \
     wrappers.h */\n";
  Buffer.add_string buf "\n";

  (* Generate enum forward declarations *)
  let namespace_prefix = ctx.namespace.namespace_name in
  if List.length gtk_enums > 0 || List.length gtk_bitfields > 0 then begin
    Buffer.add_string buf
      (C_stub_enum.generate_forward_decls ~namespace_prefix ~gtk_enums
         ~external_enums)
  end;

  (* Generate bitfield forward declarations *)
  if List.length gtk_bitfields > 0 || List.length external_bitfields > 0 then begin
    Buffer.add_string buf
      (C_stub_bitfield.generate_forward_decls ~namespace_prefix ~gtk_bitfields
         ~external_bitfields)
  end;

  Buffer.add_string buf "\n";
  Buffer.add_string buf "#endif /* _gtk4_generated_forward_decls_ */\n";
  Buffer.contents buf
