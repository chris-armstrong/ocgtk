(* OCaml Interface (.mli) Generation *)

open StdLabels
open Printf
open Types
open C_stub_helpers

(** Mode for generating code output *)
type output_mode =
  | Interface  (** Generate .mli interface file *)
  | Implementation  (** Generate .ml implementation file *)

(* Build the fully qualified type for a combined module *)
let build_combined_module_type module_name combined_module_name =
  if combined_module_name <> module_name then
    combined_module_name ^ "." ^ module_name ^ ".t"
  else
    module_name ^ ".t"

(* Qualify module references for cyclic dependencies *)
let qualify_module_reference ~ctx module_type =
  (* Extract module name from types like "Layout_manager.t" or "Widget.t" *)
  Option.bind
    (match String.split_on_char ~sep:'.' module_type with
     | [module_name; "t"] -> Some module_name
     | _ -> None)
    (fun module_name ->
       match Hashtbl.find_opt ctx.module_groups module_name with
       | None -> None
       | Some combined_module_name ->
           Some (build_combined_module_type module_name combined_module_name))
  |> Option.value ~default:module_type

let generate_signal_bindings ~output_mode:_ ~module_name:_ ~has_widget_parent:_ _signals =
  ""  (* Signals are only generated in high-level g*.ml wrappers *)

(** Build parent chain variants up to hierarchy root *)
let build_parent_chain_variants ~normalized_class ~parent_chain ~hier_info =
  if String.lowercase_ascii normalized_class = String.lowercase_ascii hier_info.gir_root then []
  else
    List.fold_left parent_chain ~init:[] ~f:(fun acc parent ->
      let tag = "`" ^ (Utils.to_snake_case parent |> Utils.sanitize_identifier) in
      acc @ [tag])

(** Build hierarchy variants for a monomorphic class *)
let build_hierarchy_variants ~normalized_class ~parent_chain =
  let self_variant = "`" ^ (Utils.to_snake_case normalized_class |> Utils.sanitize_identifier) in
  let parent_variants = List.map parent_chain ~f:(fun p -> "`" ^ (Utils.to_snake_case p |> Utils.sanitize_identifier)) in
  let all_variants = self_variant :: parent_variants in
  String.concat ~sep:" | " all_variants

let detect_class_hierarchy_names ~ctx ~class_name ~parent_chain ?record_base_type ?(is_record = false) () =
  let normalized_class = Utils.normalize_class_name class_name in
  let parent_chain =
    if is_record then []
    else (* parent_chain is ordered immediate parent -> root *)
      List.map ~f:Utils.normalize_class_name parent_chain
  in
  if is_record then
    ("Record", Option.value record_base_type ~default:"Obj.t")
  else
    (* Use hierarchy detection to determine type *)
    match Hierarchy_detection.get_hierarchy_info ctx class_name with
    | Some hier_info when hier_info.hierarchy <> MonomorphicType ->
        (* This class is in a known hierarchy *)
        let self_variant = "`" ^ (Utils.to_snake_case normalized_class |> Utils.sanitize_identifier) in
        let parent_variants = build_parent_chain_variants ~normalized_class ~parent_chain ~hier_info in
        let variants = String.concat ~sep:" | " (self_variant :: parent_variants) in
        let type_name = match hier_info.hierarchy with
          | WidgetHierarchy -> "Widget"
          | EventControllerHierarchy -> "Event controller"
          | CellRendererHierarchy -> "Cell renderer"
          | LayoutManagerHierarchy -> "Layout manager"
          | ExpressionHierarchy -> "Expression"
          | MonomorphicType -> class_name
        in
        (type_name, sprintf "[%s] Gobject.obj" variants)
    | _ ->
        (* Monomorphic type or unknown - still use polymorphic variant since all GTK classes inherit from GObject *)
        let variants = build_hierarchy_variants ~normalized_class ~parent_chain in
        (class_name, sprintf "[%s] Gobject.obj" variants)
  
(** Indent content with 2 spaces, preserving empty lines *)
let print_indent contents buf =
  let lines = String.split_on_char ~sep:'\n' contents in
  (* Indent the content *)
  List.iter ~f:(fun line ->
    if String.trim line <> "" then
      bprintf buf "  %s\n" line
    else
      bprintf buf "\n"
  ) lines

(** Combine return type and output parameters into final type *)
let combine_return_and_out_types ret_type out_types =
  match ret_type, out_types with
  | "unit", [] -> "unit"
  | "unit", [single] -> single
  | "unit", lst -> String.concat ~sep:" * " lst
  | ret, [] -> ret
  | ret, lst -> String.concat ~sep:" * " (ret :: lst)

(** Check if any method handles the given property *)
let method_handles_property prop_name methods =
  List.exists ~f:(fun m ->
    (m.set_property |> Option.map (String.equal prop_name) |> Option.value ~default:false)
    || (m.get_property |> Option.map (String.equal prop_name) |> Option.value ~default:false)
  ) methods

(** Convert a constructor parameter to its OCaml type representation *)
let map_constructor_param ~ctx ~class_name p =
  Type_resolution.map_gir_type_to_ocaml ~ctx ~class_name ~gir_type:p.param_type ~is_nullable:p.nullable

(** Convert a method parameter to its OCaml type representation *)
let convert_method_param_to_ocaml_type ~ctx ~class_name p =
  match p.direction with
  | Out -> None
  | In | InOut ->
    Some (Type_resolution.map_gir_type_to_ocaml ~ctx ~class_name ~gir_type:p.param_type ~is_nullable:p.nullable)

(** Convert an out parameter to its OCaml type representation *)
let convert_out_param_to_ocaml_type ~ctx ~class_name p =
  match p.direction with
  | Out ->
    Some (Type_resolution.map_gir_type_to_ocaml ~ctx ~class_name ~gir_type:p.param_type ~is_nullable:p.nullable)
  | In | InOut -> None

(** Check if we should generate an accessor method for this class *)
let should_generate_accessor ~class_name hier_info =
  (* Only generate accessor if this is NOT the hierarchy root itself *)
  (* (e.g., Button should have as_widget, but Widget should not have as_widget : t -> Widget.t) *)
  class_name <> hier_info.gir_root

(** Build the base type reference for a hierarchy accessor *)
let build_accessor_base_type ~ctx ~hier_info =
  let gir_root_class = hier_info.gir_root in
  (* Check if the root class is in a cyclic group *)
  match Hashtbl.find_opt ctx.module_groups gir_root_class with
  | Some combined_module_name ->
      let simple_module_name = Utils.module_name_of_class gir_root_class in
      (* Check if this is actually a cyclic module (combined != simple) *)
      if combined_module_name <> simple_module_name then
        (* For cyclic modules, use CombinedModule.ClassName.t *)
        combined_module_name ^ "." ^ simple_module_name ^ ".t"
      else
        (* Single-class module, just use ClassName.t *)
        simple_module_name ^ ".t"
  | None ->
      (* Not in module_groups table at all, use simple ClassName.t *)
      Utils.module_name_of_class gir_root_class ^ ".t"

(** Format an accessor declaration based on output mode *)
let format_accessor_declaration ~output_mode ~accessor ~base_type =
  match output_mode with
  | Implementation ->
      sprintf "let %s (obj : t) : %s = Obj.magic obj\n\n" accessor base_type
  | Interface ->
      sprintf "val %s : t -> %s\n\n" accessor base_type

(** Build constructor signature string from parameters *)
let build_constructor_signature ~ctx ~class_name ctor =
  let param_types = List.map ~f:(map_constructor_param ~ctx ~class_name) ctor.ctor_parameters in
  (* Generate signature: param1 -> param2 -> ... -> t *)
  if List.length param_types = 0 then
    "unit -> t"
  else
    String.concat ~sep:" -> " (param_types @ ["t"])

(** Format constructor external declaration with bytecode/native support *)
let format_constructor_external ~ocaml_ctor_name ~signature ~ml_name ctor =
  let param_count = if List.length ctor.ctor_parameters = 0 then 1 else List.length ctor.ctor_parameters in
  if param_count > 5 then
    sprintf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
      ocaml_ctor_name signature ml_name ml_name
  else
    sprintf "external %s : %s = \"%s\"\n\n" ocaml_ctor_name signature ml_name

(** Check if a constructor should be generated in the interface *)
let should_generate_constructor ~ctx (ctor : gir_constructor) =
  let has_cross_namespace_type = Filtering.constructor_has_cross_namespace_types ~ctx ctor in
  not ctor.throws && not has_cross_namespace_type

(** Generate a single constructor declaration and write it to the buffer *)
let generate_constructor_decl ~ctx ~class_name ~buf (ctor : gir_constructor) =
  bprintf buf "(** Create a new %s *)\n" class_name;
  let ml_name = Utils.ml_constructor_name ~class_name ~constructor:ctor in
  let ocaml_ctor_name =
    Utils.ocaml_constructor_name ~class_name ctor
  in

  let signature = build_constructor_signature ~ctx ~class_name ctor in
  let decl = format_constructor_external ~ocaml_ctor_name ~signature ~ml_name ctor in
  bprintf buf "%s" decl

(** Check if a method should be generated in the interface *)
let should_generate_method ~ctx ~is_record (meth : gir_method) =
  let has_excluded_type =
    Exclude_list.is_excluded_type_name meth.return_type.name
  in
  let has_cross_namespace_type = Filtering.method_has_cross_namespace_types ~ctx meth in
  not (Exclude_list.is_variadic_function meth.method_name
       || has_excluded_type
       || Exclude_list.should_skip_method ~find_type_mapping:(Type_mappings.find_type_mapping_for_gir_type ~ctx) ~enums:ctx.enums ~bitfields:ctx.bitfields meth
       || (is_record && is_copy_or_free meth)
       || has_cross_namespace_type)

(** Build the OCaml method signature type string *)
let build_method_signature ~ctx ~class_name (meth : gir_method) =
  let param_types = List.filter_map ~f:(convert_method_param_to_ocaml_type ~ctx ~class_name) meth.parameters in

  let ret_type_ocaml =
    if meth.return_type.name = "void" then
      "unit"
    else
      Type_resolution.map_gir_type_to_ocaml ~ctx ~class_name ~gir_type:meth.return_type ~is_nullable:meth.return_type.nullable
  in

  let out_types =
    List.filter_map ~f:(convert_out_param_to_ocaml_type ~ctx ~class_name) meth.parameters
  in

  let final_ret_type = combine_return_and_out_types ret_type_ocaml out_types in
  let final_ret_type = if meth.throws then sprintf "(%s, GError.t) result" final_ret_type else final_ret_type in
  String.concat ~sep:" -> " (["t"] @ param_types @ [final_ret_type])

(** Format an external method declaration with bytecode/native support for >5 parameters *)
let format_method_external ~buf ~ocaml_name ~ml_name ~param_count ~full_type =
  if param_count > 5 then
    bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
      ocaml_name full_type ml_name ml_name
  else
    bprintf buf "external %s : %s = \"%s\"\n\n"
      ocaml_name full_type ml_name

(** Generate a single method declaration and write it to the buffer *)
let generate_method_decl ~ctx ~class_name ~c_type ~c_symbol_prefix ~is_record ~buf (meth : gir_method) =
  let ml_name = Utils.ml_method_name ~class_name meth in
  let ocaml_name = Utils.ocaml_function_name ~class_name ~c_type ?c_symbol_prefix meth.method_name in
  let in_params = List.filter ~f:(fun p -> p.direction <> Out) meth.parameters in
  let param_count = 1 + List.length in_params in

  if should_generate_method ~ctx ~is_record meth then begin
(match meth.doc with
    | Some doc -> bprintf buf "(** %s *)\n" (Utils.sanitize_doc doc)
    | None -> ());

    let full_type = build_method_signature ~ctx ~class_name meth in
    format_method_external ~buf ~ocaml_name ~ml_name ~param_count ~full_type
  end

(** Check if the type mapping exists for this property *)
let has_property_type_mapping ~ctx (prop : gir_property) =
  not (Exclude_list.is_excluded_type_name prop.prop_type.name) &&
  Option.is_some (Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type)

(** Check if a property getter should be generated *)
let should_generate_property_getter (prop : gir_property) =
  prop.readable

(** Check if a property setter should be generated *)
let should_generate_property_setter (prop : gir_property) =
  prop.writable && not prop.construct_only

(** Generate a property getter external declaration *)
let generate_property_getter ~ctx ~class_name ~buf (prop : gir_property) type_mapping =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = Utils.to_snake_case prop_name_cleaned in
  let prop_ocaml_type =
    if prop.prop_type.nullable then
      sprintf "%s option" type_mapping.ocaml_type
    else
      type_mapping.ocaml_type
  in
  let getter_name = sprintf "get_%s" prop_snake in
  let c_getter = Utils.ml_property_name ~ctx ~class_name prop in
  bprintf buf "(** Get property: %s *)\n" prop.prop_name;
  bprintf buf "external %s : t -> %s = \"%s\"\n\n"
    getter_name prop_ocaml_type c_getter

(** Generate a property setter external declaration *)
let generate_property_setter ~ctx ~class_name ~buf (prop : gir_property) type_mapping =
  let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = Utils.to_snake_case prop_name_cleaned in
  let prop_ocaml_type =
    if prop.prop_type.nullable then
      sprintf "%s option" type_mapping.ocaml_type
    else
      type_mapping.ocaml_type
  in
  let setter_name = sprintf "set_%s" prop_snake in
  let c_setter = Utils.ml_property_setter_name ~ctx ~class_name prop in
  bprintf buf "(** Set property: %s *)\n" prop.prop_name;
  bprintf buf "external %s : t -> %s -> unit = \"%s\"\n\n"
    setter_name prop_ocaml_type c_setter

(** Generate a single property's getter and/or setter declarations *)
let generate_property_decl ~ctx ~class_name ~buf ~methods (prop : gir_property) =
  let skip_prop =
    Exclude_list.is_excluded_type_name prop.prop_type.name ||
    method_handles_property prop.prop_name methods
  in
  if not skip_prop && has_property_type_mapping ~ctx prop then
    match Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type with
    | Some type_mapping ->
      if should_generate_property_getter prop then
        generate_property_getter ~ctx ~class_name ~buf prop type_mapping;
      if should_generate_property_setter prop then
        generate_property_setter ~ctx ~class_name ~buf prop type_mapping
    | None -> ()

(** Generate type declaration for the module *)
let generate_type_declaration ~output_mode ~is_record ~base_type buf =
  match (is_record, output_mode) with
  | true, Interface ->
      bprintf buf "type t\n\n"
  | _ ->
      bprintf buf "type t = %s\n\n" base_type

(** Generate hierarchy accessor method if needed *)
let generate_hierarchy_accessor_section ~ctx ~output_mode ~class_name buf =
  match Hierarchy_detection.get_hierarchy_info ctx class_name with
  | Some hier_info when hier_info.hierarchy <> MonomorphicType ->
      if should_generate_accessor ~class_name hier_info then begin
        let accessor = hier_info.accessor_method in
        let base_type = build_accessor_base_type ~ctx ~hier_info in
        let base_type = Type_resolution.simplify_self_reference ~class_name ~ocaml_type:base_type in
        let declaration = format_accessor_declaration ~output_mode ~accessor ~base_type in
        bprintf buf "%s" declaration
      end
  | _ -> ()

(** Generate constructors section *)
let generate_constructors_section ~ctx ~class_name ~constructors buf =
  List.iter ~f:(fun (ctor : gir_constructor) ->
    if should_generate_constructor ~ctx ctor then
      generate_constructor_decl ~ctx ~class_name ~buf ctor
  ) (constructors |> Option.value ~default:[])

(** Generate methods section *)
let generate_methods_section ~ctx ~class_name ~c_type ~c_symbol_prefix ~is_record ~methods buf =
  bprintf buf "(* Methods *)\n";
  List.iter ~f:(fun (meth : gir_method) ->
    generate_method_decl ~ctx ~class_name ~c_type ~c_symbol_prefix ~is_record ~buf meth
  ) (List.rev methods)

(** Generate properties section *)
let generate_properties_section ~ctx ~class_name ~methods ~properties buf =
  if List.length properties > 0 then begin
    bprintf buf "(* Properties *)\n\n";
    List.iter ~f:(fun (prop : gir_property) ->
      generate_property_decl ~ctx ~class_name ~buf ~methods prop
    ) properties;
  end

let generate_ml_interface_internal
    ~ctx
    ~output_mode
    ~class_name

    ~c_type

    ~constructors
    ~methods
    ~properties
    ~base_type
    ?c_symbol_prefix
    ?(is_record = false)
    buf
     =
  generate_type_declaration ~output_mode ~is_record ~base_type buf;
  generate_hierarchy_accessor_section ~ctx ~output_mode ~class_name buf;
  generate_constructors_section ~ctx ~class_name ~constructors buf;
  generate_methods_section ~ctx ~class_name ~c_type ~c_symbol_prefix ~is_record ~methods buf;
  generate_properties_section ~ctx ~class_name ~methods ~properties buf  

let generate_ml_interface
    ~ctx
    ~output_mode
    ~class_name
    ~class_doc
    ~c_type
    ~parent_chain
    ~constructors
    ~methods
    ~properties
    ?c_symbol_prefix
    ?record_base_type
    ?(is_record = false)
    () = 
  let buf = Buffer.create 1024 in

  let class_type_name, base_type = detect_class_hierarchy_names ~ctx ~class_name ~parent_chain ?record_base_type ~is_record ()
    
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* %s: %s *)\n\n" class_type_name class_name;

  (match class_doc with
  | Some doc -> bprintf buf "(** %s *)\n" (Utils.sanitize_doc doc)
  | None -> ());
  generate_ml_interface_internal
  ~ctx ~output_mode ~class_name ~c_type ~constructors ~methods ~properties ?c_symbol_prefix ~base_type ~is_record buf;
  Buffer.contents buf

(** Format module declaration (module rec X | and X) *)
let format_module_declaration buf module_name is_start =
  if is_start then
    bprintf buf "module rec %s" module_name
  else
    bprintf buf "\nand %s\n" module_name

(** Generate module signature for a single entity *)
let generate_module_signature ~ctx ~entity ~base_type buf =
  let signature_contents =
    let inner_buf = Buffer.create 1024 in
    generate_ml_interface_internal
      ~ctx
      ~output_mode:Interface
      ~class_name:entity.name
      ~c_type:entity.c_type
      ~constructors:(if List.length entity.constructors > 0 then Some entity.constructors else None)
      ~methods:entity.methods
      ~properties:entity.properties
      ~base_type
      inner_buf;
    Buffer.contents inner_buf
  in
  print_indent signature_contents buf

(** Generate module implementation for a single entity *)
let generate_module_implementation ~ctx ~output_mode ~entity ~base_type buf =
  let single_content =
    let inner_buf = Buffer.create 1024 in
    generate_ml_interface_internal
      ~ctx
      ~output_mode
      ~class_name:entity.name
      ~c_type:entity.c_type
      ~base_type
      ~constructors:(if List.length entity.constructors > 0 then Some entity.constructors else None)
      ~methods:entity.methods
      ~properties:entity.properties
      inner_buf;
    Buffer.contents inner_buf
  in
  print_indent single_content buf

(** Generate a single combined module entity *)
let generate_combined_module_entity ~ctx ~output_mode ~entity ~parent_chain_for_entity ~index buf =
  let parent_chain = parent_chain_for_entity entity.name in
  let class_name = entity.name in
  let _, base_type = detect_class_hierarchy_names ~ctx ~class_name ~parent_chain () in
  let module_name = Utils.module_name_of_class class_name in
  let is_impl = match output_mode with Implementation -> true | Interface -> false in
  let is_start = index = 0 in

  format_module_declaration buf module_name is_start;

  if is_impl then begin
    bprintf buf " : sig\n";
    generate_module_signature ~ctx ~entity ~base_type buf;
    bprintf buf "end = struct\n";
  end else begin
    bprintf buf " : sig\n";
  end;

  generate_module_implementation ~ctx ~output_mode ~entity ~base_type buf;
  bprintf buf "end\n"

(* Generate combined modules for cyclic dependencies *)
let generate_combined_ml_modules
    ~ctx
    ~output_mode
    ~entities
    ~parent_chain_for_entity
    () =
  let buf = Buffer.create 4096 in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Combined modules for cyclic dependencies *)\n\n";

  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in

  List.iteri ~f:(fun i entity ->
    generate_combined_module_entity ~ctx ~output_mode ~entity ~parent_chain_for_entity ~index:i buf
  ) sorted_entities;

  Buffer.contents buf
