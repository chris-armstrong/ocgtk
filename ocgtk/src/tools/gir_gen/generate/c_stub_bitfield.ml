(* C Stub Code Generation - Bitfield Support *)

open Printf
open StdLabels
open Types

let emit_bitfield_proto buf ~namespace (bitfield : gir_bitfield) =
  (* Special case: GdkPixbufFormatFlags is in GIR but marked skip in C headers *)
  if String.equal bitfield.bitfield_c_type "GdkPixbufFormatFlags" then begin
    bprintf buf
      "/* GdkPixbufFormatFlags is in GIR but marked skip in C headers */\n";
    bprintf buf "#ifndef GDK_PIXBUF_FORMAT_WRITABLE\n";
    bprintf buf "typedef enum {\n";
    List.iter
      ~f:(fun flag ->
        bprintf buf "  %s = %d,\n" flag.flag_c_identifier flag.flag_value)
      bitfield.flags;
    bprintf buf "} GdkPixbufFormatFlags;\n";
    bprintf buf "#endif\n"
  end;
  bprintf buf "value Val_%s%s(%s flags);\n" namespace bitfield.bitfield_name
    bitfield.bitfield_c_type;
  bprintf buf "%s %s%s_val(value list);\n" bitfield.bitfield_c_type namespace
    bitfield.bitfield_name

let generate_forward_decls ~namespace_prefix ~gtk_bitfields ~external_bitfields =
  let buf = Buffer.create 1024 in

  if List.length gtk_bitfields > 0 then begin
    Buffer.add_string buf
      "/* Forward declarations for bitfield converters */\n";
    List.iter
      ~f:(fun (bitfield : gir_bitfield) ->
        bprintf buf "value Val_%s%s(%s flags);\n" namespace_prefix
          bitfield.bitfield_name bitfield.bitfield_c_type;
        bprintf buf "%s %s%s_val(value list);\n" bitfield.bitfield_c_type
          namespace_prefix bitfield.bitfield_name)
      gtk_bitfields;
    Buffer.add_string buf "\n"
  end;

  (* Add forward declarations for external namespace bitfield converters *)
  if List.length external_bitfields > 0 then begin
    Buffer.add_string buf
      "\n/* Forward declarations for external namespace bitfield converters */\n";
    List.iter
      ~f:(fun ((ns, bitfield) : string * gir_bitfield) ->
        emit_bitfield_proto buf ~namespace:ns bitfield)
      external_bitfields
  end;

  Buffer.contents buf
