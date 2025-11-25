(* Signal class generation for high-level wrappers *)

open StdLabels
open Printf
open Types

let sanitize_signal_name name =
  name
  |> String.map ~f:(function '-' -> '_' | c -> c)
  |> Utils.to_snake_case

let has_widget_parent class_name parent_chain =
  let normalized_class = Utils.normalize_class_name class_name |> String.lowercase_ascii in
  normalized_class = "widget" ||
  List.exists parent_chain ~f:(fun p ->
    String.lowercase_ascii (Utils.normalize_class_name p) = "widget")

let connect_target_expr module_name ~has_widget_parent =
  if has_widget_parent then
    sprintf "(%s.as_widget obj :> [`widget] Gobject.obj)" module_name
  else
    "(Obj.magic obj :> _ Gobject.obj)"

let is_void_signal (signal : gir_signal) =
  let c_type = String.lowercase_ascii signal.return_type.c_type in
  let name = String.lowercase_ascii signal.return_type.name in
  c_type = "void" || name = "none"

let generate_signal_class ~class_name ~signals ~parent_chain =
  let buf = Buffer.create 512 in
  let module_name = Utils.module_name_of_class class_name in
  let class_snake = Utils.to_snake_case class_name in
  let signal_class_name = sprintf "%s_signals" class_snake in
  let widget_parent = has_widget_parent class_name parent_chain in
  let target_expr = connect_target_expr module_name ~has_widget_parent:widget_parent in

  bprintf buf "(* Signal handlers for %s *)\n" class_name;
  bprintf buf "class %s (obj : %s.t) = object\n" signal_class_name module_name;

  let supported, skipped =
    List.partition signals ~f:(fun s ->
      is_void_signal s && List.length s.sig_parameters = 0)
  in

  List.iter skipped ~f:(fun s ->
    eprintf "Skipping signal '%s' for %s (non-void return or parameters not supported yet)\n"
      s.signal_name class_name);

  if List.length supported = 0 then
    bprintf buf "  (* No parameterless void signals parsed from GIR *)\n"
  else
    List.iter supported ~f:(fun (signal : gir_signal) ->
      let method_name = sanitize_signal_name signal.signal_name in
      (match signal.doc with
      | Some doc -> bprintf buf "  (** %s *)\n" (String.trim doc)
      | None -> ());
      bprintf buf "  method %s ~callback =\n" method_name;
      bprintf buf "    Gobject.Signal.connect_simple %s ~name:\"%s\" ~callback ~after:false\n\n"
        target_expr signal.signal_name;
    );

  bprintf buf "end\n";
  Buffer.contents buf
