(* C Stub Code Generation - Enum Support *)

open Printf
open StdLabels
open Types

let emit_enum_proto buf ~namespace (enum : gir_enum) =
  bprintf buf "value Val_%s%s(%s val);\n" namespace enum.enum_name
    enum.enum_c_type;
  bprintf buf "%s %s%s_val(value val);\n" enum.enum_c_type namespace
    enum.enum_name

let generate_forward_decls ~namespace_prefix ~gtk_enums ~external_enums =
  let buf = Buffer.create 1024 in

  (* Add forward declarations for Gtk enum converters *)
  if List.length gtk_enums > 0 then begin
    Buffer.add_string buf
      "/* Forward declarations for enum converters */\n";
    List.iter
      ~f:(fun (enum : gir_enum) ->
        bprintf buf "value Val_%s%s(%s val);\n" namespace_prefix enum.enum_name
          enum.enum_c_type;
        bprintf buf "%s %s%s_val(value val);\n" enum.enum_c_type
          namespace_prefix enum.enum_name)
      gtk_enums;
    Buffer.add_string buf "\n"
  end;

  (* Add forward declarations for external namespace enum converters *)
  if List.length external_enums > 0 then begin
    Buffer.add_string buf
      "\n/* Forward declarations for external namespace enum converters */\n";
    List.iter
      ~f:(fun ((ns, enum) : string * gir_enum) ->
        emit_enum_proto buf ~namespace:ns enum)
      external_enums
  end;

  Buffer.contents buf
