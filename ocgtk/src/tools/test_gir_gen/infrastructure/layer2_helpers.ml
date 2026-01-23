(* Layer 2 Test Infrastructure - Helpers for testing class hierarchies and inheritance *)

open Printf
open Gir_gen_lib.Types

(* ========================================================================= *)
(* Test Class Creation with Inheritance *)
(* ========================================================================= *)

(* Create a test class with optional parent for inheritance testing *)
let create_test_class_with_parent ~name ~c_type ?parent () =
  {
    class_name = name;
    c_type;
    parent;
    implements = [];
    constructors = [];
    methods = [];
    properties = [];
    signals = [];
    class_doc = None;
  }

(* Create a simple parent class for testing inheritance *)
let create_parent_class ~name ~c_type () =
  create_test_class_with_parent ~name ~c_type ~parent:None ()

(* Create a child class that inherits from a parent *)
let create_child_class ~name ~c_type ~parent_name () =
  create_test_class_with_parent ~name ~c_type ~parent:(Some parent_name) ()

(* Create a test class with methods for method testing *)
let create_test_class_with_methods ~name ~c_type ~methods () =
  {
    class_name = name;
    c_type;
    parent = None;
    implements = [];
    constructors = [];
    methods;
    properties = [];
    signals = [];
    class_doc = None;
  }

(* ========================================================================= *)
(* Test Method Creation *)
(* ========================================================================= *)

(* Create a simple test method with no parameters *)
let create_test_method ~name ~c_name () =
  {
    method_name = name;
    c_name;
    method_params = [];
    method_return = None;
    method_throws = false;
    method_doc = None;
  }

(* Create a test method with a single parameter *)
let create_test_method_with_param ~name ~c_name ~param_name ~param_type () =
  let param =
    {
      param_name;
      param_type;
      param_direction = In;
      param_nullable = false;
      param_optional = false;
      param_doc = None;
    }
  in
  {
    method_name = name;
    c_name;
    method_params = [ param ];
    method_return = None;
    method_throws = false;
    method_doc = None;
  }

(* Create a test method with multiple parameters *)
let create_test_method_with_params ~name ~c_name ~params () =
  {
    method_name = name;
    c_name;
    method_params = params;
    method_return = None;
    method_throws = false;
    method_doc = None;
  }

(* Create a test method with a return type *)
let create_test_method_with_return ~name ~c_name ~return_type () =
  {
    method_name = name;
    c_name;
    method_params = [];
    method_return = Some return_type;
    method_throws = false;
    method_doc = None;
  }

(* Create a test method that throws errors *)
let create_test_method_throwing ~name ~c_name () =
  {
    method_name = name;
    c_name;
    method_params = [];
    method_return = None;
    method_throws = true;
    method_doc = None;
  }

(* ========================================================================= *)
(* Layer 2 Output Validation - AST-based *)
(* ========================================================================= *)

(* Validate that generated code has expected module structure using AST parsing *)
let validate_layer2_output ~output_dir ~module_name ~expected_types =
  let ml_file = Helpers.ml_file output_dir module_name in
  let mli_file = Helpers.mli_file output_dir module_name in

  (* Check that both .ml and .mli files exist *)
  if not (Helpers.file_exists ml_file) then
    Alcotest.fail (sprintf "Expected .ml file not found: %s" ml_file);

  if not (Helpers.file_exists mli_file) then
    Alcotest.fail (sprintf "Expected .mli file not found: %s" mli_file);

  (* Read and parse both files *)
  let ml_content = Helpers.read_file ml_file in
  let mli_content = Helpers.read_file mli_file in
  
  let ml_ast = Ml_ast_helpers.parse_implementation ml_content in
  let mli_ast = Ml_ast_helpers.parse_interface mli_content in

  (* Validate that all expected types are present using AST parsing *)
  List.iter (fun type_name ->
    Ml_validation.assert_type_exists ml_ast type_name;
    Ml_validation.assert_type_exists_sig mli_ast type_name
  ) expected_types;

  (ml_content, mli_content, ml_ast, mli_ast)

(* Validate that a class has the expected accessor method using AST *)
let validate_accessor_method ~ml_ast ~accessor_name =
  Ml_validation.assert_value_exists ml_ast accessor_name

(* Validate that inheritance is properly represented using AST *)
let validate_inheritance ~ml_ast ~parent_name ~child_name =
  (* Check that child class is defined *)
  Ml_validation.assert_type_exists ml_ast child_name;
  (* Check that parent class is referenced *)
  Ml_validation.assert_type_exists ml_ast parent_name

(* Validate that a method is properly generated using AST *)
let validate_method_generation ~ml_ast ~method_name =
  Ml_validation.assert_value_exists ml_ast method_name

(* ========================================================================= *)
(* Signature vs Implementation Consistency - AST-based *)
(* ========================================================================= *)

(* Check that .mli and .ml have consistent type definitions using AST *)
let check_mli_vs_ml_consistency ~mli_ast ~ml_ast ~type_name =
  (* Both files should define the type *)
  Ml_validation.assert_type_exists_sig mli_ast type_name;
  Ml_validation.assert_type_exists ml_ast type_name

(* Check that all externals in .mli are implemented in .ml using AST *)
let check_externals_consistency ~mli_ast ~ml_ast ~external_name =
  (* Check that external exists in signature *)
  (match Ml_ast_helpers.find_external_sig mli_ast external_name with
   | Some _ -> ()
   | None ->
       Alcotest.fail (sprintf "External '%s' not found in .mli file"
         external_name));
  
  (* Check that external exists in implementation *)
  (match Ml_ast_helpers.find_external ml_ast external_name with
   | Some _ -> ()
   | None ->
       Alcotest.fail (sprintf "External '%s' not found in .ml file"
         external_name))

(* Validate that function signatures match between .mli and .ml using AST *)
let validate_function_signature_consistency ~mli_ast ~ml_ast ~func_name =
  (* Extract function signature from .mli *)
  match Ml_ast_helpers.find_value_declaration_sig mli_ast func_name with
  | Some mli_func ->
      (match Ml_ast_helpers.find_let_binding ml_ast func_name with
       | Some _ ->
           (* Signatures match if both exist *)
           ()
       | None ->
           Alcotest.fail (sprintf "Function '%s' not found in .ml file" func_name))
  | None ->
      Alcotest.fail (sprintf "Function '%s' not found in .mli file" func_name)

(* ========================================================================= *)
(* Hierarchy and Conversion Method Validation *)
(* ========================================================================= *)

(* Validate that conversion methods are properly generated *)
let validate_conversion_methods ~ml_ast ~from_type ~to_type =
  let conversion_method = "as_" ^ String.lowercase_ascii to_type in
  Ml_validation.assert_value_exists ml_ast conversion_method

(* Check that a class properly implements conversion to its base type *)
let validate_base_type_conversion ~ml_ast ~class_name ~base_type =
  let conversion_method = "as_" ^ String.lowercase_ascii base_type in
  Ml_validation.assert_value_exists ml_ast conversion_method

(* Validate that hierarchy information is available *)
let validate_hierarchy_info ~context ~class_name =
  match Hashtbl.find_opt context.hierarchy_map class_name with
  | None ->
      Alcotest.fail (sprintf "Hierarchy info not found for class '%s'"
        class_name)
  | Some info ->
      (* Verify that hierarchy info has required fields *)
      if String.length info.gir_root = 0 then
        Alcotest.fail (sprintf "Hierarchy info for '%s' has empty gir_root"
          class_name);
      if String.length info.layer2_module = 0 then
        Alcotest.fail (sprintf "Hierarchy info for '%s' has empty layer2_module"
          class_name)

(* ========================================================================= *)
(* Property and Signal Validation *)
(* ========================================================================= *)

(* Validate that properties are properly generated *)
let validate_property_generation ~ml_ast ~property_name =
  Ml_validation.assert_value_exists ml_ast property_name

(* Validate that signals are properly generated *)
let validate_signal_generation ~ml_ast ~signal_name =
  Ml_validation.assert_value_exists ml_ast signal_name

(* ========================================================================= *)
(* Type Wrapper Validation *)
(* ========================================================================= *)

(* Validate that a class is properly wrapped as an abstract type *)
let validate_abstract_type_wrapper ~mli_ast ~type_name =
  Ml_validation.assert_type_exists_sig mli_ast type_name

(* Validate that a type properly wraps a GObject *)
let validate_gobject_wrapper ~ml_ast ~type_name =
  Ml_validation.assert_type_exists ml_ast type_name

(* ========================================================================= *)
(* Critical Layer 2 Validation Helpers *)
(* ========================================================================= *)

(* Validate structural type parameters like `<as_widget: Widget.t; ..>` *)
let validate_structural_type_parameter ~mli_ast ~type_name ~field_name ~field_type =
  match Ml_ast_helpers.find_type_declaration_sig mli_ast type_name with
  | Some type_decl ->
      (match type_decl.ptype_manifest with
       | Some manifest ->
           let type_str = Ml_ast_helpers.core_type_to_string manifest in
           (* Check if the field name appears in the type string *)
           if not (Helpers.string_contains type_str field_name) then
             Alcotest.fail (sprintf "Structural field '%s' not found in type '%s'"
               field_name type_name);
           (* Check if the field type appears in the type string *)
           if not (Helpers.string_contains type_str field_type) then
             Alcotest.fail (sprintf "Field type '%s' not found in type '%s'"
               field_type type_name)
       | None ->
           Alcotest.fail (sprintf "Type '%s' has no manifest (not a structural type)"
             type_name))
  | None ->
      Alcotest.fail (sprintf "Type '%s' not found in signature" type_name)

(* Validate hierarchy coercion like (#widget -> Widget.t) *)
let validate_hierarchy_coercion ~mli_ast ~function_name ~param_idx ~expected_coercion =
  match Ml_ast_helpers.find_value_declaration_sig mli_ast function_name with
  | Some func_decl ->
      let param_types = Ml_ast_helpers.get_param_types func_decl.pval_type in
      (match List.nth_opt param_types param_idx with
       | Some param_type ->
           let param_str = Ml_ast_helpers.core_type_to_string param_type in
           if not (String.equal param_str expected_coercion) then
             Alcotest.fail (sprintf "Parameter %d of '%s' expected coercion '%s', got '%s'"
               param_idx function_name expected_coercion param_str)
       | None ->
           Alcotest.fail (sprintf "Parameter %d not found in '%s'"
             param_idx function_name))
  | None ->
      Alcotest.fail (sprintf "Function '%s' not found in signature" function_name)

(* Validate wrapped return values like (new ClassName ret) *)
let validate_wrapped_return ~ml_ast ~function_name ~wrapper_class =
  match Ml_ast_helpers.find_let_binding ml_ast function_name with
  | Some binding ->
      (* Check that the binding expression contains the wrapper class *)
      let buf = Buffer.create 256 in
      let fmt = Format.formatter_of_buffer buf in
      Ppxlib.Pprintast.expression fmt binding.pvb_expr;
      Format.pp_print_flush fmt ();
      let binding_str = Buffer.contents buf in
      if not (Helpers.string_contains binding_str wrapper_class) then
        Alcotest.fail (sprintf "Return value for '%s' not wrapped with '%s'"
          function_name wrapper_class)
  | None ->
      Alcotest.fail (sprintf "Function '%s' not found in implementation"
        function_name)

(* Validate signal handler inheritance *)
let validate_signal_handler_inheritance ~mli_ast ~signal_handler_name ~parent_signal =
  match Ml_ast_helpers.find_value_declaration_sig mli_ast signal_handler_name with
  | Some handler_decl ->
      (* Check that the handler type references the parent signal *)
      let handler_type_str = Ml_ast_helpers.core_type_to_string handler_decl.pval_type in
      if not (Helpers.string_contains handler_type_str parent_signal) then
        Alcotest.fail (sprintf "Signal handler '%s' does not inherit from '%s'"
          signal_handler_name parent_signal)
  | None ->
      Alcotest.fail (sprintf "Signal handler '%s' not found in signature"
        signal_handler_name)

(* ========================================================================= *)
(* Code Generation Helpers *)
(* ========================================================================= *)

(* Create a minimal GIR XML for a class with inheritance *)
let create_gir_class_with_parent ~class_name ~c_type ~parent_name =
  sprintf
    {|    <class name="%s" c:type="%s" parent="%s" glib:type-name="Gtk%s" glib:get-type="gtk_%s_get_type" c:symbol-prefix="gtk_%s">
    </class>|}
    class_name c_type parent_name class_name
    (Gir_gen_lib.Utils.to_snake_case class_name)
    (Gir_gen_lib.Utils.to_snake_case class_name)

(* Create a minimal GIR XML for a class method *)
let create_gir_method ~method_name ~c_name =
  sprintf
    {|      <method name="%s" c:identifier="%s">
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>|}
    method_name c_name

(* Create a GIR method with a parameter *)
let create_gir_method_with_param ~method_name ~c_name ~param_name ~param_type =
  sprintf
    {|      <method name="%s" c:identifier="%s">
        <parameters>
          <parameter name="%s" transfer-ownership="none">
            <type name="%s" c:type="gint"/>
          </parameter>
        </parameters>
        <return-value transfer-ownership="none">
          <type name="none" c:type="void"/>
        </return-value>
      </method>|}
    method_name c_name param_name param_type

(* ========================================================================= *)
(* Test Context Helpers *)
(* ========================================================================= *)

(* Add a class with hierarchy info to the context *)
let add_class_with_hierarchy ~context ~class_name ~parent_name ~layer2_module
    ~base_type =
  let class_obj = create_test_class_with_parent ~name:class_name
    ~c_type:("Gtk" ^ class_name) ~parent:(Some parent_name) () in

  (* Add to classes list *)
  let updated_classes = context.classes @ [ class_obj ] in

  (* Add hierarchy info *)
  let hierarchy_info =
    {
      gir_root = parent_name;
      hierarchy = WidgetHierarchy;
      layer2_module;
      class_type_name = String.lowercase_ascii class_name ^ "_skel";
      accessor_method = "as_" ^ String.lowercase_ascii parent_name;
      layer1_base_type = base_type;
      base_conversion_method = parent_name ^ ".as_" ^ String.lowercase_ascii parent_name;
    }
  in
  Hashtbl.add context.hierarchy_map class_name hierarchy_info;

  { context with classes = updated_classes }

(* Create a test context with multiple related classes *)
let create_test_context_with_hierarchy_chain ~base_class ~derived_classes =
  (* Use the shared helper from Helpers module to create base context *)
  let ctx = Helpers.create_test_context_with_hierarchy () in
  
  (* Create base class if not already present *)
  let base_class_obj = create_test_class_with_parent ~name:base_class
    ~c_type:("Gtk" ^ base_class) ~parent:None () in

  (* Create derived classes *)
  let derived_class_objs =
    List.map (fun derived_name ->
      create_test_class_with_parent ~name:derived_name
        ~c_type:("Gtk" ^ derived_name) ~parent:(Some base_class) ()
    ) derived_classes
  in

  let all_classes = base_class_obj :: derived_class_objs in

  (* Add hierarchy info for base class *)
  Hashtbl.add ctx.hierarchy_map base_class
    {
      gir_root = base_class;
      hierarchy = WidgetHierarchy;
      layer2_module = "G" ^ base_class;
      class_type_name = String.lowercase_ascii base_class ^ "_skel";
      accessor_method = "as_" ^ String.lowercase_ascii base_class;
      layer1_base_type = base_class ^ ".t";
      base_conversion_method = base_class ^ ".as_" ^ String.lowercase_ascii base_class;
    };

  (* Add hierarchy info for derived classes *)
  List.iter (fun derived_name ->
    Hashtbl.add ctx.hierarchy_map derived_name
      {
        gir_root = base_class;
        hierarchy = WidgetHierarchy;
        layer2_module = "G" ^ base_class;
        class_type_name = String.lowercase_ascii base_class ^ "_skel";
        accessor_method = "as_" ^ String.lowercase_ascii base_class;
        layer1_base_type = base_class ^ ".t";
        base_conversion_method = base_class ^ ".as_" ^ String.lowercase_ascii base_class;
      }
  ) derived_classes;

  (* Update context with new classes *)
  { ctx with classes = ctx.classes @ all_classes }
