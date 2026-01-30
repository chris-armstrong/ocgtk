(* OCaml Interface (.mli) Generation *)

open StdLabels
open Printf
open Types
open C_stub_helpers

type output_mode = Interface | Implementation

let sanitize_doc s =
  (* Prevent premature comment termination when GIR doc contains "*)" *)
  Re.replace (Re.compile (Re.str "*)")) ~all:true ~f:(fun g -> "\\" ^ Re.Group.get g 0) s
  |> Re.replace (Re.compile (Re.str "*(")) ~all:true ~f:(fun g -> "\\" ^ Re.Group.get g 0)

(* Simplify type references when they refer to the current module's type *)
let simplify_self_reference ~class_name ocaml_type =
  let current_module = Utils.module_name_of_class class_name in
  let self_type = current_module ^ ".t" in
  if ocaml_type = self_type then
    "t"
  else
    (* Handle patterns like "Module.t array" or "Module.t option" or "Module.t array option" *)
    Re.replace (Re.compile (Re.str self_type)) ~all:true ~f:(fun _ -> "t") ocaml_type

(* Qualify module references for cyclic dependencies *)
let qualify_module_reference ~ctx module_type =
  (* Extract module name from types like "Layout_manager.t" or "Widget.t" *)
  match String.split_on_char ~sep:'.' module_type with
  | [module_name; "t"] ->
      (* Check if this module is part of a cyclic group *)
      (match Hashtbl.find_opt ctx.module_groups module_name with
       | Some combined_module_name ->
           let simple_module_name = module_name in
           (* Check if this is a cyclic module by comparing names *)
           if combined_module_name <> simple_module_name then
             (* For cyclic modules, use CombinedModule.ClassName.t *)
             combined_module_name ^ "." ^ simple_module_name ^ ".t"
           else
             (* Single module *)
             module_type
       | None -> module_type)
  | _ -> module_type

let generate_signal_bindings ~output_mode:_ ~module_name:_ ~has_widget_parent:_ _signals =
  ""  (* Signals are only generated in high-level g*.ml wrappers *)

let detect_class_hierarchy_names ~ctx ~class_name ~parent_chain ?record_base_type ?(is_record = false) () =
  let normalized_class = Utils.normalize_class_name class_name in
      let parent_chain =
    if is_record then []
    else
      (* parent_chain is ordered immediate parent -> root *)
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
          let parent_variants =
            if String.lowercase_ascii normalized_class = String.lowercase_ascii hier_info.gir_root then
              (* This is the root of the hierarchy *)
              []
            else
              (* Build parent chain variants up to hierarchy root *)
              List.fold_left parent_chain ~init:[] ~f:(fun acc parent ->
                let tag = "`" ^ (Utils.to_snake_case parent |> Utils.sanitize_identifier) in
                (* Stop at hierarchy root *)
                if String.lowercase_ascii parent = String.lowercase_ascii hier_info.gir_root then
                  acc @ [tag]
                else
                  acc @ [tag]
              )
          in
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
          let self_variant = "`" ^ (Utils.to_snake_case normalized_class |> Utils.sanitize_identifier) in
          (* Add parent chain variants *)
          let parent_variants = List.map parent_chain ~f:(fun p -> "`" ^ (Utils.to_snake_case p |> Utils.sanitize_identifier)) in
          let all_variants = self_variant :: parent_variants in
          let variants = String.concat ~sep:" | " all_variants in
          (class_name, sprintf "[%s] Gobject.obj" variants)
  
let print_indent contents buf =
  let lines = String.split_on_char ~sep:'\n' contents in
  (* Indent the content *)
  List.iter ~f:(fun line ->
    if String.trim line <> "" then
      bprintf buf "  %s\n" line
    else
      bprintf buf "\n"
  ) lines

let generate_ml_interface_internal
    ~ctx
    ~output_mode
    ~class_name
    
    ~c_type
    
    ~constructors
    ~methods
    ~properties
    ~signals:_
    ~base_type
    ?c_symbol_prefix
    ?(is_record = false)
    buf
     =

  match (is_record, output_mode) with
  | true, Interface -> 
  
    bprintf buf "type t\n\n"
  | _ -> 
    bprintf buf "type t = %s\n\n" base_type;

  (* Generate accessor method for hierarchy types *)
  (match Hierarchy_detection.get_hierarchy_info ctx class_name with
   | Some hier_info when hier_info.hierarchy <> MonomorphicType ->
       (* Only generate accessor if this is NOT the hierarchy root itself *)
       (* (e.g., Button should have as_widget, but Widget should not have as_widget : t -> Widget.t) *)
       if class_name <> hier_info.gir_root then begin
         let accessor = hier_info.accessor_method in
         (* Build the base type reference using the GIR root name *)
         let gir_root_class = hier_info.gir_root in
         (* Check if the root class is in a cyclic group *)
         let base_type =
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
         in
         (* Simplify self-references (though this should never happen for accessors) *)
         let base_type = simplify_self_reference ~class_name base_type in
         match output_mode with
         | Implementation ->
           bprintf buf "let %s (obj : t) : %s = Obj.magic obj\n\n" accessor base_type
         | Interface ->
           bprintf buf "val %s : t -> %s\n\n" accessor base_type
       end
   | _ -> ());

  (* Constructors - generate unique names and proper signatures, skip those that throw or have cross-namespace types *)
  List.iter ~f:(fun (ctor : gir_constructor) ->
    let has_cross_namespace_type = Filtering.constructor_has_cross_namespace_types ~ctx ctor in
    if not ctor.throws && not has_cross_namespace_type then begin
      bprintf buf "(** Create a new %s *)\n" class_name;
      let c_name = ctor.c_identifier in
      let ml_name =
        let prefixed = Re.replace (Re.compile (Re.str "^gtk_")) ~all:true ~f:(fun _ -> "ml_gtk_") c_name in
        if String.length prefixed >= 3 && String.sub prefixed ~pos:0 ~len:3 = "ml_" then
          prefixed
        else
          "ml_" ^ c_name
      in

      (* Generate OCaml constructor name from C identifier *)
      let ocaml_ctor_name =
        Utils.ocaml_constructor_name ~class_name ctor
      in

    (* Build parameter types for constructor signature *)
    let param_types = List.map ~f:(fun p ->
      match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
      | Some mapping ->
        (* let base_type = Type_mappings.qualify_ocaml_type ~ctx ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in *)
        let simplified_type = simplify_self_reference ~class_name mapping.ocaml_type in
        if p.nullable then
          sprintf "%s option" simplified_type
        else
          simplified_type
      | None ->
        eprintf "Warning: Unknown type for parameter: name=%s type=%s\n"
          p.param_type.name p.param_type.name;
        "unit"
    ) ctor.ctor_parameters in

    (* Generate signature: param1 -> param2 -> ... -> t *)
    let signature =
      if List.length param_types = 0 then
        "unit -> t"
      else
        String.concat ~sep:" -> " (param_types @ ["t"])
    in

    (* For >5 parameters, reference bytecode/native variants *)
    let param_count = if List.length ctor.ctor_parameters = 0 then 1 else List.length ctor.ctor_parameters in
    if param_count > 5 then
      bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
        ocaml_ctor_name signature ml_name ml_name
    else
      bprintf buf "external %s : %s = \"%s\"\n\n" ocaml_ctor_name signature ml_name;
    end
  ) (constructors |> Option.value ~default:[]);

  (* Methods - skip those that duplicate property getters/setters *)
  bprintf buf "(* Methods *)\n";
  List.iter ~f:(fun (meth : gir_method) ->
    let c_name = meth.method_name in
    let in_params = List.filter ~f:(fun p -> p.direction <> Out) meth.parameters in
    let param_count = 1 + List.length in_params in
    let ml_name =
      Utils.ml_method_name ~class_name meth
    in
    let ocaml_name =
      Utils.ocaml_function_name ~class_name ~c_type ?c_symbol_prefix c_name
    in

    (* Skip if: variadic function, duplicates property, or unmapped return type *)
    let has_excluded_type =
      Exclude_list.is_excluded_type_name meth.return_type.name
    in
    let has_cross_namespace_type = Filtering.method_has_cross_namespace_types ~ctx meth in
    let should_skip_mli =
      Exclude_list.is_variadic_function c_name ||

      has_excluded_type ||
      Exclude_list.should_skip_method ~find_type_mapping:(Type_mappings.find_type_mapping_for_gir_type ~ctx) ~enums:ctx.enums ~bitfields:ctx.bitfields meth ||
      (is_record && is_copy_or_free meth) ||
      has_cross_namespace_type
    in
    if not should_skip_mli then begin
      (match meth.doc with
      | Some doc -> bprintf buf "(** %s *)\n" (sanitize_doc doc)
      | None -> ());

      (* Build OCaml type signature - handle nullable parameters *)
      let param_types = List.filter_map ~f:(fun p ->
        match p.direction with
        | Out -> None
        | In | InOut ->
          Some (match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
          | Some mapping ->
            (* let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in *)
            (* Simplify self-references (e.g., Tree_model.t -> t in tree_model.ml) *)
            let base_type = simplify_self_reference ~class_name mapping.ocaml_type in
            if p.nullable then
              sprintf "%s option" base_type
            else
              base_type
          | None ->
            eprintf "Warning: Unknown type for method '%s' parameter: name=%s c_type=%s\n" meth.method_name
              p.param_type.name p.param_type.name;
            "unit")
      ) meth.parameters in

      let ret_type_ocaml =
        if meth.return_type.name = "void" then
          "unit"
        else
          match Type_mappings.find_type_mapping_for_gir_type ~ctx meth.return_type with
          | Some mapping ->
            (* let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some meth.return_type.name) mapping.ocaml_type in *)
            (* Simplify self-references (e.g., Tree_model.t -> t in tree_model.ml) *)
            let base_type = simplify_self_reference ~class_name mapping.ocaml_type in
            if meth.return_type.nullable then
              sprintf "%s option" base_type
            else
              base_type
          | None ->
            eprintf "Warning: Unknown return type for method %s: name=%s type=%s\n"
              meth.method_name meth.return_type.name meth.return_type.name;
            "unit"
      in

      let out_types =
        meth.parameters
        |> List.filter_map ~f:(fun p ->
          match p.direction with
          | Out ->
            (* let base_param_type =
              if String.length p.param_type.c_type > 0 &&
                 String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*"
              then { p.param_type with c_type = String.sub p.param_type.c_type ~pos:0 ~len:(String.length p.param_type.c_type - 1) }
              else p.param_type
            in *)
            (match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
            | Some mapping ->
              (* let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some base_param_type.name) mapping.ocaml_type in *)
              (* Simplify self-references (e.g., Tree_model.t -> t in tree_model.ml) *)
              let base_type = simplify_self_reference ~class_name mapping.ocaml_type in
              if (*base_param_type.nullable ||*) p.nullable then
                Some (sprintf "%s option" base_type)
              else Some base_type
            | None ->
              eprintf "Warning: Unknown out parameter type for method %s: name=%s type=%s\n"
                meth.method_name p.param_type.name p.param_type.name;
              Some "unit")
          | In | InOut -> None)
      in

      let final_ret_type =
        match ret_type_ocaml, out_types with
        | "unit", [] -> "unit"
        | "unit", [single] -> single
        | "unit", lst -> String.concat ~sep:" * " lst
        | ret, [] -> ret
        | ret, lst -> String.concat ~sep:" * " (ret :: lst)
      in

      let final_ret_type = if meth.throws then sprintf "(%s, GError.t) result" final_ret_type else final_ret_type in

      let full_type =
        String.concat ~sep:" -> " (["t"] @ param_types @ [final_ret_type])
      in

      (* For methods with >5 parameters, use bytecode/native variant syntax *)
      if param_count > 5 then
        bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
          ocaml_name full_type ml_name ml_name
      else
        bprintf buf "external %s : %s = \"%s\"\n\n"
          ocaml_name full_type ml_name;
    end
  ) (List.rev methods);

  (* Properties - generate get/set externals *)
  let property_names = ref [] in

  if List.length properties > 0 then begin
    bprintf buf "(* Properties *)\n\n";
  List.iter ~f:(fun (prop : gir_property) ->
      let skip_prop =
        Exclude_list.is_excluded_type_name prop.prop_type.name ||
        List.exists ~f:(fun m -> (m.set_property |> Option.map  (String.equal prop.prop_name) |> Option.value ~default:false)
        || (m.get_property |> Option.map (String.equal prop.prop_name) |> Option.value ~default:false)) methods
      in
      
      let type_mapping_opt = if skip_prop then None else Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type in
      match type_mapping_opt with
      | Some type_mapping ->
        let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
        let prop_snake = Utils.to_snake_case prop_name_cleaned in
        let class_snake = Utils.to_snake_case class_name in
        let prop_ocaml_type =
          if prop.prop_type.nullable then
            sprintf "%s option" type_mapping.ocaml_type
          else
            type_mapping.ocaml_type
        in

        (* Generate getter if readable *)
        if prop.readable then begin
          let getter_name = sprintf "get_%s" prop_snake in
          property_names := getter_name :: !property_names;
          let c_getter = sprintf "ml_gtk_%s_get_%s" class_snake prop_snake in
          bprintf buf "(** Get property: %s *)\n" prop.prop_name;
          bprintf buf "external %s : t -> %s = \"%s\"\n\n"
            getter_name prop_ocaml_type c_getter;
        end;

        (* Generate setter if writable and not construct-only *)
        if prop.writable && not prop.construct_only then begin
          let setter_name = sprintf "set_%s" prop_snake in
          property_names := setter_name :: !property_names;
          let c_setter = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in
          bprintf buf "(** Set property: %s *)\n" prop.prop_name;
          bprintf buf "external %s : t -> %s -> unit = \"%s\"\n\n"
            setter_name prop_ocaml_type c_setter;
        end;
      | None ->
        ()
    ) properties;
  end  

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
    ~signals
    ?c_symbol_prefix
    ?record_base_type
    ?(is_record = false)
    ()
    = 
  let buf = Buffer.create 1024 in

  let class_type_name, base_type = detect_class_hierarchy_names ~ctx ~class_name ~parent_chain ?record_base_type ~is_record ()
    
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* %s: %s *)\n\n" class_type_name class_name;

  (match class_doc with
  | Some doc -> bprintf buf "(** %s *)\n" (sanitize_doc doc)
  | None -> ());
  generate_ml_interface_internal 
  ~ctx ~output_mode ~class_name ~c_type ~constructors ~methods ~properties ~signals ?c_symbol_prefix ~base_type  ~is_record buf;
  Buffer.contents buf

(* Generate combined modules for cyclic dependencies *)
let generate_combined_ml_modules
    ~ctx
    ~output_mode
    ~entities
    ~parent_chain_for_entity
    () =
  let buf = Buffer.create 4096 in
  let is_impl = match output_mode with Implementation -> true | Interface -> false in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Combined modules for cyclic dependencies *)\n\n";

  (* Sort entities by name for consistent output *)
  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in

  (* Generate each module *)
  List.iteri ~f:(fun i entity ->
    let parent_chain = parent_chain_for_entity entity.name in
    let class_name = entity.name in
    let _, base_type = detect_class_hierarchy_names ~ctx ~class_name ~parent_chain () in
    let module_name = Utils.module_name_of_class class_name in

    (* Module declaration *)
    let start = i = 0 in
    if start then
    
      bprintf buf "module rec %s" module_name
    else 
      bprintf buf "\nand %s\n" module_name;

    if is_impl then begin
      bprintf buf " : sig\n";
      let singature_contents = 
        let buf = Buffer.create 1024 in   
        generate_ml_interface_internal
        ~ctx
        ~output_mode:Interface
        ~class_name:entity.name
        
        ~c_type:entity.c_type
        
        ~constructors:(if List.length entity.constructors > 0 then Some entity.constructors else None)
        ~methods:entity.methods
        ~properties:entity.properties
        ~signals:entity.signals
        ~base_type
        buf;
        Buffer.contents buf 
      in
      print_indent singature_contents buf;
      bprintf buf "end = struct\n"
    end
    else 
      bprintf buf " : sig\n"
    ;
 
    (* Generate module content using existing single-file generator *)
    (* We need to adapt the output to fit inside a module *)
    let single_content = 
      let buf = Buffer.create 1024 in
      generate_ml_interface_internal
      ~ctx
      ~output_mode
      ~class_name:entity.name
   
      ~c_type:entity.c_type
      ~base_type
      ~constructors:(if List.length entity.constructors > 0 then Some entity.constructors else None)
      ~methods:entity.methods
      ~properties:entity.properties
      ~signals:entity.signals
      buf;
      Buffer.contents buf 
    in

    print_indent single_content buf;

    bprintf buf "end\n";
  ) sorted_entities;

  Buffer.contents buf
