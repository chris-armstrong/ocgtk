(* High-level class generation (Step 3) *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

module StringSet = Set.Make(String)

let sanitize_name s =
  s |> String.map ~f:(function '-' -> '_' | c -> c) |> Utils.to_snake_case

let has_widget_parent class_name parent_chain =
  let normalized = Utils.normalize_class_name class_name |> String.lowercase_ascii in
  normalized = "widget" ||
  List.exists parent_chain ~f:(fun p ->
    String.lowercase_ascii (Utils.normalize_class_name p) = "widget")

let signal_class_name class_name =
  sanitize_name class_name ^ "_signals"

let ocaml_method_name ~class_name ~c_type (meth : gir_method) =
  Filtering.ocaml_method_name ~class_name ~c_type meth |> sanitize_name

let parameter_name (p : gir_param) =
  sanitize_name p.param_name

let generate_signal_class ~class_name ~module_name ~signals =
  let buf = Buffer.create 256 in
  let signals =
    List.filter signals ~f:(fun s ->
      let is_void =
        let c_type = String.lowercase_ascii s.return_type.c_type in
        let name = String.lowercase_ascii s.return_type.name in
        c_type = "void" || name = "none"
      in
      is_void && s.sig_parameters = [])
  in
  if signals = [] then
    ""
  else begin
    let sig_class = signal_class_name class_name in
    bprintf buf "(* Signal handlers for %s *)\n" class_name;
    bprintf buf "class %s (obj : %s.t) = object\n" sig_class module_name;
    List.iter signals ~f:(fun s ->
      let m = sanitize_name s.signal_name in
      bprintf buf "  method %s ~callback =\n" m;
      bprintf buf "    Gobject.Signal.connect_simple (%s.as_widget obj :> [`widget] Gobject.obj) ~name:\"%s\" ~callback ~after:false\n\n"
        module_name s.signal_name;
    );
    bprintf buf "end\n\n";
    Buffer.contents buf
  end

let ocaml_type_of_gir_type ~classes ~enums ~bitfields ~records (gir_type : gir_type) =
  match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes ~records gir_type with
  | Some mapping ->
      let base = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some gir_type.name) mapping.ocaml_type in
      let base = if gir_type.nullable then base ^ " option" else base in
      Some base
  | None -> None

let generate_property_methods ~classes ~enums ~bitfields ~records ~module_name ~seen (prop : gir_property) =
  if not (Filtering.should_generate_property ~classes ~enums ~bitfields ~records prop) then ("", seen)
  else
    let prop_snake = sanitize_name prop.prop_name in
    if StringSet.mem prop_snake seen then ("", seen) else
    let seen = StringSet.add prop_snake seen in
    let buf = Buffer.create 128 in
    if prop.readable then begin
      bprintf buf "  method get_%s () = %s.get_%s obj\n" prop_snake module_name prop_snake;
      bprintf buf "  method %s () = %s.get_%s obj\n" prop_snake module_name prop_snake;
    end;
    if prop.writable && not prop.construct_only then
      bprintf buf "  method set_%s v = %s.set_%s obj v\n" prop_snake module_name prop_snake;
    let seen =
      let seen = if prop.readable then StringSet.add ("get_" ^ prop_snake) seen else seen in
      if prop.writable && not prop.construct_only then StringSet.add ("set_" ^ prop_snake) seen
      else seen
    in
    (Buffer.contents buf, seen)

let generate_property_signatures ~classes ~enums ~bitfields ~records ~seen (prop : gir_property) =
  if not (Filtering.should_generate_property ~classes ~enums ~bitfields ~records prop) then ("", seen)
  else
    match ocaml_type_of_gir_type ~classes ~enums ~bitfields ~records prop.prop_type with
    | None -> ("", seen)
    | Some ocaml_type ->
        let prop_snake = sanitize_name prop.prop_name in
        if StringSet.mem prop_snake seen then ("", seen) else
        let seen = StringSet.add prop_snake seen in
        let buf = Buffer.create 128 in
        if prop.readable then begin
          bprintf buf "    method get_%s : unit -> %s\n" prop_snake ocaml_type;
          bprintf buf "    method %s : unit -> %s\n" prop_snake ocaml_type;
        end;
        if prop.writable && not prop.construct_only then
          bprintf buf "    method set_%s : %s -> unit\n" prop_snake ocaml_type;
        let seen =
          let seen = if prop.readable then StringSet.add ("get_" ^ prop_snake) seen else seen in
          if prop.writable && not prop.construct_only then StringSet.add ("set_" ^ prop_snake) seen
          else seen
        in
        (Buffer.contents buf, seen)

let generate_method_wrappers ~classes ~enums ~bitfields ~records ~property_method_names ~property_base_names ~module_name ~class_name ~c_type ~seen (meth : gir_method) =
  let should_skip =
    Filtering.should_skip_method_binding ~classes ~enums ~bitfields ~records ~property_method_names ~property_base_names ~class_name ~c_type meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut)
  in
  if should_skip then ("", seen)
  else
    let params = List.map meth.parameters ~f:parameter_name in
    let param_list =
      match params with
      | [] -> "()"
      | _ -> String.concat ~sep:" " params
    in
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    if StringSet.mem ocaml_name seen then ("", seen) else
    let seen = StringSet.add ocaml_name seen in
    let buf = Buffer.create 256 in
    bprintf buf "  method %s %s = %s.%s obj%s\n"
      ocaml_name
      (if param_list = "()" then "()" else param_list)
      module_name
      ocaml_name
      (if param_list = "()" then "" else " " ^ param_list);

    (* Convenience alias for getters: get_x -> x *)
    let seen =
      if String.length ocaml_name > 4 && String.sub ocaml_name ~pos:0 ~len:4 = "get_" then
        let base = String.sub ocaml_name ~pos:4 ~len:(String.length ocaml_name - 4) in
        if StringSet.mem base seen then seen
        else begin
          bprintf buf "  method %s () = %s.%s obj\n" base module_name ocaml_name;
          StringSet.add base seen
        end
      else seen
    in
    (Buffer.contents buf, seen)

let generate_method_signatures ~classes ~enums ~bitfields ~records ~property_method_names ~property_base_names ~class_name ~c_type ~seen (meth : gir_method) =
  let should_skip =
    Filtering.should_skip_method_binding ~classes ~enums ~bitfields ~records ~property_method_names ~property_base_names ~class_name ~c_type meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut)
  in
  if should_skip then ("", seen)
  else
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    if StringSet.mem ocaml_name seen then ("", seen) else
    let param_types =
      List.map meth.parameters ~f:(fun p ->
        let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
        ocaml_type_of_gir_type ~classes ~enums ~bitfields ~records gir_type)
    in
    if List.exists param_types ~f:(fun x -> x = None) then ("", seen) else
    let param_types = List.filter_map param_types ~f:(fun x -> x) in
    let return_type =
      if String.lowercase_ascii meth.return_type.c_type = "void" then Some "unit"
      else ocaml_type_of_gir_type ~classes ~enums ~bitfields ~records meth.return_type
    in
    match return_type with
    | None -> ("", seen)
    | Some return_type ->
        let param_types = if param_types = [] then ["unit"] else param_types in
        let signature = String.concat ~sep:" -> " (param_types @ [return_type]) in
        let seen = StringSet.add ocaml_name seen in
        let buf = Buffer.create 256 in
        bprintf buf "    method %s : %s\n" ocaml_name signature;
        let seen =
          if String.length ocaml_name > 4 && String.sub ocaml_name ~pos:0 ~len:4 = "get_" then
            let base = String.sub ocaml_name ~pos:4 ~len:(String.length ocaml_name - 4) in
            if StringSet.mem base seen then seen
            else begin
              bprintf buf "    method %s : %s\n" base signature;
              StringSet.add base seen
            end
          else seen
        in
        (Buffer.contents buf, seen)

let generate_class_module ~classes ~enums ~bitfields ~records ~class_name ~c_type ~parent_chain ~methods ~properties ~signals =
  let buf = Buffer.create 2048 in
  let module_name = Utils.module_name_of_class class_name in
  let class_snake = sanitize_name class_name in
  let widget_parent = has_widget_parent class_name parent_chain in

  if not widget_parent then begin
    bprintf buf "(* Class generation skipped for non-widget class %s *)\n" class_name;
    Buffer.contents buf
  end else begin
    (* Reference external signal class module if signals exist *)
    let has_any_void_signals = List.exists signals ~f:(fun s ->
      let is_void =
        let c_type = String.lowercase_ascii s.return_type.c_type in
        let name = String.lowercase_ascii s.return_type.name in
        c_type = "void" || name = "none"
      in
      is_void
    ) in

    if has_any_void_signals then
      bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

    bprintf buf "(* High-level class for %s *)\n" class_name;
    bprintf buf "class %s_skel (obj : %s.t) = object (self)\n" class_snake module_name;
    bprintf buf "  inherit GObj.widget_impl (%s.as_widget obj)\n\n" module_name;

    if has_any_void_signals then begin
      let signal_module = "G" ^ class_snake ^ "_signals" in
      bprintf buf "  method connect = new %s.%s obj\n\n"
        signal_module (signal_class_name class_name)
    end;

    let seen = StringSet.empty in
    let property_method_names =
      Filtering.property_method_names ~classes ~enums ~bitfields ~records properties
    in
    let property_base_names =
      Filtering.property_base_names ~classes ~enums ~bitfields ~records properties
    in
    let seen, () =
      List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
        let chunk, seen = generate_property_methods ~classes ~enums ~bitfields ~records ~module_name ~seen prop in
        Buffer.add_string buf chunk;
        if chunk <> "" then Buffer.add_char buf '\n';
        (seen, ()))
    in
    let seen, () =
      List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) m ->
        let chunk, seen = generate_method_wrappers ~classes ~enums ~bitfields ~records ~property_method_names ~property_base_names ~module_name ~class_name ~c_type ~seen m in
        Buffer.add_string buf chunk;
        if chunk <> "" then Buffer.add_char buf '\n';
        (seen, ()))
    in
    ignore seen;

    bprintf buf "end\n\n";

    bprintf buf "class %s obj = object\n" class_snake;
    bprintf buf "  inherit %s_skel obj\n" class_snake;
    bprintf buf "end\n";

    Buffer.contents buf
  end

let generate_class_signature ~classes ~enums ~bitfields ~records ~class_name ~c_type ~parent_chain ~methods ~properties ~signals =
  let buf = Buffer.create 1024 in
  let module_name = Utils.module_name_of_class class_name in
  let class_snake = sanitize_name class_name in
  let widget_parent = has_widget_parent class_name parent_chain in

  if not widget_parent then begin
    bprintf buf "(* Class signature skipped for non-widget class %s *)\n" class_name;
    Buffer.contents buf
  end else begin
    (* Check if there are any void signals *)
    let has_any_void_signals = List.exists signals ~f:(fun s ->
      let c_type = String.lowercase_ascii s.return_type.c_type in
      let name = String.lowercase_ascii s.return_type.name in
      c_type = "void" || name = "none"
    ) in

    let property_method_names =
      Filtering.property_method_names ~classes ~enums ~bitfields ~records properties
    in
    let property_base_names =
      Filtering.property_base_names ~classes ~enums ~bitfields ~records properties
    in

    bprintf buf "class %s_skel : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";
    bprintf buf "    inherit GObj.widget_impl\n";
    if has_any_void_signals then begin
      let signal_module = "G" ^ class_snake ^ "_signals" in
      bprintf buf "    method connect : %s.%s\n" signal_module (signal_class_name class_name)
    end;
    let seen = StringSet.empty in
    let seen, () =
      List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
        let chunk, seen = generate_property_signatures ~classes ~enums ~bitfields ~records ~seen prop in
        Buffer.add_string buf chunk;
        (seen, ()))
    in
    let _seen, () =
      List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) meth ->
        let chunk, seen = generate_method_signatures ~classes ~enums ~bitfields ~records ~property_method_names ~property_base_names ~class_name ~c_type ~seen meth in
        Buffer.add_string buf chunk;
        (seen, ()))
    in
    bprintf buf "  end\n\n";

    bprintf buf "class %s : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";
    bprintf buf "    inherit %s_skel\n" class_snake;
    bprintf buf "  end\n";

    Buffer.contents buf
  end
