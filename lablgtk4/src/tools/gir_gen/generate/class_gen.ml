(* High-level class generation (Step 3) *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

let sanitize_name s =
  s |> String.map ~f:(function '-' -> '_' | c -> c) |> Utils.to_snake_case

let has_widget_parent class_name parent_chain =
  let normalized = Utils.normalize_class_name class_name |> String.lowercase_ascii in
  normalized = "widget" ||
  List.exists parent_chain ~f:(fun p ->
    String.lowercase_ascii (Utils.normalize_class_name p) = "widget")

let signal_class_name class_name =
  sanitize_name class_name ^ "_signals"

let ocaml_method_name class_name (meth : gir_method) =
  let class_snake = Utils.to_snake_case class_name in
  meth.c_identifier
  |> Str.global_replace (Str.regexp (sprintf "gtk_%s_" class_snake)) ""
  |> sanitize_name

let parameter_name (p : gir_param) =
  sanitize_name p.param_name

let generate_property_methods ~module_name (prop : gir_property) =
  let prop_snake = sanitize_name prop.prop_name in
  let buf = Buffer.create 128 in
  if prop.readable then
    bprintf buf "  method %s = %s.get_%s obj\n"
      prop_snake module_name prop_snake;
  if prop.writable && not prop.construct_only then
    bprintf buf "  method set_%s v = %s.set_%s obj v\n"
      prop_snake module_name prop_snake;
  Buffer.contents buf

let generate_method_wrappers ~module_name ~class_name (meth : gir_method) =
  (* Skip methods with out parameters or variadics for now *)
  if List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.varargs) then
    None
  else
    let params = List.map meth.parameters ~f:parameter_name in
    let param_list =
      match params with
      | [] -> "()"
      | _ -> String.concat ~sep:" " params
    in
    let ocaml_name = ocaml_method_name class_name meth in
    let buf = Buffer.create 128 in
    bprintf buf "  method %s %s = %s.%s obj%s\n"
      ocaml_name
      (if param_list = "()" then "()" else param_list)
      module_name
      ocaml_name
      (if param_list = "()" then "" else " " ^ param_list);
    Some (Buffer.contents buf)

let generate_class_module ~class_name ~parent_chain ~methods:_ ~properties:_ ~signals:_ =
  let buf = Buffer.create 1024 in
  let module_name = Utils.module_name_of_class class_name in
  let class_snake = sanitize_name class_name in
  let widget_parent = has_widget_parent class_name parent_chain in

  if not widget_parent then begin
    bprintf buf "(* Class generation skipped for non-widget class %s *)\n" class_name;
    Buffer.contents buf
  end else begin
    bprintf buf "(* High-level class for %s *)\n" class_name;
    bprintf buf "class %s_skel (obj : %s.t) = object (self)\n" class_snake module_name;
    bprintf buf "  inherit GObj.widget_impl (%s.as_widget obj)\n\n" module_name;
    bprintf buf "end\n\n";

    bprintf buf "class %s obj = object\n" class_snake;
    bprintf buf "  inherit %s_skel obj\n" class_snake;
    bprintf buf "end\n";

    Buffer.contents buf
  end
