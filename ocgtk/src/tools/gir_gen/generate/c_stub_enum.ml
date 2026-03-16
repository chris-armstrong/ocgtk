(* C Stub Code Generation - Enum Support *)

open Printf
open StdLabels
open Types

(** Generate forward declarations for enum converters.

    Note: This function now only generates declarations for enums in the current
    namespace. External enum declarations come from included headers as part of
    Phase 2 cross-namespace header refactoring. *)
let generate_forward_decls ~namespace_prefix ~gtk_enums =
  let buf = Buffer.create 1024 in

  (* Add forward declarations for local namespace enum converters *)
  if List.length gtk_enums > 0 then begin
    Buffer.add_string buf "/* Forward declarations for enum converters */\n";
    List.iter
      ~f:(fun (enum : gir_enum) ->
        bprintf buf "value Val_%s%s(%s val);\n" namespace_prefix enum.enum_name
          enum.enum_c_type;
        bprintf buf "%s %s%s_val(value val);\n" enum.enum_c_type
          namespace_prefix enum.enum_name)
      gtk_enums;
    Buffer.add_string buf "\n"
  end;

  Buffer.contents buf
