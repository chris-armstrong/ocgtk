(* Converter method generation for hierarchies and classes *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

let generate_hierarchy_converter_method_impl ~ctx ~(hierarchy_info : hierarchy_info) ~class_name buf =
  if String.equal class_name (hierarchy_info.gir_root) then
    (* bprintf buf "  method %s = obj\n"  hierarchy_info.accessor_method  *)
    ()
  else

  bprintf buf "  method %s = (%s.%s obj)\n"  hierarchy_info.accessor_method (Class_utils.get_qualified_module_name ~ctx class_name) hierarchy_info.accessor_method

let generate_hierarchy_converter_method_sig ~hierarchy_info ~class_name buf =
  if String.equal class_name (hierarchy_info.gir_root) then
    ()
  else
    bprintf buf "  method %s : %s\n" hierarchy_info.accessor_method hierarchy_info.layer1_base_type

let generate_class_converter_method_sig ~ctx ~class_name buf = bprintf buf "    method as_%s : %s.t\n" (Utils.ocaml_class_name class_name) (Class_utils.get_qualified_module_name ~ctx class_name)
let generate_class_converter_method_impl ~class_name buf = bprintf buf "    method as_%s = obj\n" (Utils.ocaml_class_name class_name)