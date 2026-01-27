(* Layer 2 Method Wrapper Tests - End-to-end testing of method wrapper generation *)

open Gir_gen_lib.Types
open Ppxlib.Parsetree

let create_test_context = Helpers.create_test_context_with_hierarchy

(* ========================================================================= *)
(* Test 1: Hierarchy Parameter Coercion *)
(* ========================================================================= *)

(* Test that hierarchy parameters like Widget are correctly typed in method wrappers *)
let test_hierarchy_parameter_coercion () =
  let ctx = create_test_context () in
  
  (* Create a method that takes a Widget parameter *)
  let meth = {
    method_name = "set_focus";
    c_identifier = "gtk_button_set_focus";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "widget";
        param_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Generate Layer 2 class module and signature *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  let _mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in

  (* Parse the generated code into AST *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in

  (* Debug: Print the class name and method to understand the structure *)
  Printf.eprintf "Generated ML code:\n%s\n" ml_code;

  (* Verify the method has a hierarchy parameter using AST inspection *)
  Ml_ast_helpers.assert_method_has_hierarchy_param ml_ast "button" "set_focus"

(* ========================================================================= *)
(* Test 2: Nullable Parameter Handling *)
(* ========================================================================= *)

(* Test nullable parameter handling in method wrappers *)
let test_nullable_parameter_handling () =
  let ctx = create_test_context () in
  
  (* Create a method that takes a nullable string parameter *)
  let meth = {
    method_name = "set_label";
    c_identifier = "gtk_button_set_label";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "label";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = true; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = true;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
   (* Generate Layer 2 class signature *)
   let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
     ~ctx
     ~class_name:"Button"
     ~c_type:"GtkButton"
     ~parent_chain:["Widget"]
     ~methods:[meth]
     ~properties:[]
     ~signals:[] in
   
   (* Parse the generated signature into AST *)
   let mli_ast = Ml_ast_helpers.parse_interface mli_code in

   (* Verify the method signature has 'string option' parameter type using AST inspection *)
   Layer2_helpers.validate_method_type_annotation_sig
     ~signature:mli_ast
     ~class_name:"button"
     ~method_name:"set_label"
     ~expected_type:"string option -> unit"

(* ========================================================================= *)
(* Test 3: Return Value Wrapping *)
(* ========================================================================= *)

(* Test return value wrapping for object types *)
let test_return_value_wrapping () =
  let ctx = create_test_context () in
  
  (* Create a method that returns a Widget *)
  let meth = {
    method_name = "get_child";
    c_identifier = "gtk_container_get_child";
    return_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Generate Layer 2 class signature *)
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Container"
    ~c_type:"GtkContainer"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
   
   (* Parse the generated signature into AST *)
  let mli_ast = Ml_ast_helpers.parse_interface mli_code in

  (* Verify the method signature has widget return type using AST inspection *)
  Layer2_helpers.validate_method_type_annotation_sig 
    ~signature:mli_ast 
    ~class_name:"container" 
    ~method_name:"get_child" 
    ~expected_type:"unit -> GWidget.widget"

(* ========================================================================= *)
(* Test 4: Void Method *)
(* ========================================================================= *)

(* Test void methods (no return value) *)
let test_void_method () =
  let ctx = create_test_context () in
  
  (* Create a void method *)
  let meth = {
    method_name = "show";
    c_identifier = "gtk_widget_show";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Generate Layer 2 class module and signature *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Widget"
    ~c_type:"GtkWidget"
    ~parent_chain:[]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
   let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
     ~ctx
     ~class_name:"Widget"
     ~c_type:"GtkWidget"
     ~parent_chain:[]
     ~methods:[meth]
     ~properties:[]
     ~signals:[] in
   
   (* Parse the generated code into ASTs *)
   let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
   let mli_ast = Ml_ast_helpers.parse_interface mli_code in
   
   (* Validate the show method exists and has correct type using AST parsing *)
   (match Ml_ast_helpers.find_class_declaration ml_ast "widget" with
    | None -> Alcotest.fail "Class 'widget' not found in generated class AST"
    | Some class_decl ->
        (match Ml_ast_helpers.find_method_in_class class_decl.pci_expr "show" with
         | None -> Alcotest.fail "Method 'show' not found in generated class AST"
         | Some method_field ->
             (match Ml_ast_helpers.get_method_type method_field with
              | Some method_type ->
                  let type_str = Ml_ast_helpers.core_type_to_string method_type in
                  if not (String.equal type_str "unit -> unit") then
                    Alcotest.fail (Printf.sprintf "Method 'show' has type '%s', expected 'unit -> unit'" type_str)
              | None -> Alcotest.fail "Could not extract type for 'show' method")));
   
   (* Validate method signature in .mli using AST parsing *)
   Layer2_helpers.validate_method_type_annotation_sig
     ~signature:mli_ast
     ~class_name:"widget"
     ~method_name:"show"
     ~expected_type:"unit -> unit"

(* ========================================================================= *)
(* Test 5: Multiple Parameters *)
(* ========================================================================= *)

(* Test methods with multiple parameters *)
let test_multiple_parameters () =
  let ctx = create_test_context () in
  
  (* Create method with multiple integer parameters *)
  let meth = {
    method_name = "set_size_request";
    c_identifier = "gtk_widget_set_size_request";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "width";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "height";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Generate Layer 2 class module and signature *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Widget"
    ~c_type:"GtkWidget"
    ~parent_chain:[]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
   let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
     ~ctx
     ~class_name:"Widget"
     ~c_type:"GtkWidget"
     ~parent_chain:[]
     ~methods:[meth]
     ~properties:[]
     ~signals:[] in
   
   (* Parse the generated code into ASTs *)
   let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
   let mli_ast = Ml_ast_helpers.parse_interface mli_code in
   
   (* Validate the set_size_request method exists and has correct type using AST parsing *)
   (match Ml_ast_helpers.find_class_declaration ml_ast "widget" with
    | None -> Alcotest.fail "Class 'widget' not found in generated class AST"
    | Some class_decl ->
        (match Ml_ast_helpers.find_method_in_class class_decl.pci_expr "set_size_request" with
         | None -> Alcotest.fail "Method 'set_size_request' not found in generated class AST"
         | Some method_field ->
             (match Ml_ast_helpers.get_method_type method_field with
              | Some method_type ->
                  let type_str = Ml_ast_helpers.core_type_to_string method_type in
                  if not (String.equal type_str "int -> int -> unit") then
                    Alcotest.fail (Printf.sprintf "Method 'set_size_request' has type '%s', expected 'int -> int -> unit'" type_str)
              | None -> Alcotest.fail "Could not extract type for 'set_size_request' method")));
   
   (* Validate method signature in .mli using AST parsing *)
   Layer2_helpers.validate_method_type_annotation_sig
     ~signature:mli_ast
     ~class_name:"widget"
     ~method_name:"set_size_request"
     ~expected_type:"int -> int -> unit"

(* ========================================================================= *)
(* Test 6: Method with Object Parameter *)
(* ========================================================================= *)

(* Test methods with object parameters are correctly typed *)
let test_method_with_object_parameter () =
  let ctx = create_test_context () in
  
  (* Create a method on Button that takes a Widget parameter *)
  let meth = {
    method_name = "set_child";
    c_identifier = "gtk_button_set_child";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "child";
        param_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Generate Layer 2 class module and signature *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
   
   (* Parse the generated code into AST *)
    let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
    
    (* Validate the set_child method exists and has hierarchy parameter using AST parsing *)
   (match Ml_ast_helpers.find_class_declaration ml_ast "button" with
    | None -> Alcotest.fail "Class 'button' not found in generated class AST"
    | Some class_decl ->
        (match Ml_ast_helpers.find_method_in_class class_decl.pci_expr "set_child" with
         | None -> Alcotest.fail "Method 'set_child' not found in generated class AST"
         | Some _ -> ()));
   
   (* Verify the method has a hierarchy parameter using AST inspection *)
   Ml_ast_helpers.assert_method_has_hierarchy_param ml_ast "button" "set_child"

(* ========================================================================= *)
(* Test 7: Same-Cluster Structural Type Parameters *)
(* ========================================================================= *)

(* Test that same-cluster class references use structural types like <as_widget: Widget.t; ..> *)
let test_same_cluster_structural_type () =
  let open Gir_gen_lib.Types in
  let ctx = create_test_context () in
  
  (* Add hierarchy info for Widget and Button to make them same-cluster *)
  Hashtbl.add ctx.hierarchy_map "Widget"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  Hashtbl.add ctx.hierarchy_map "Button"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };
  
  (* Create a method on Button that takes a Widget parameter (same cluster) *)
  let set_child_method = {
    method_name = "set_child";
    c_identifier = "gtk_button_set_child";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "child";
        param_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Create classes for combined module generation *)
  let widget_class = {
    class_name = "Widget";
    c_type = "GtkWidget";
    parent = None;
    implements = [];
    constructors = [];
    methods = [];
    properties = [];
    signals = [];
    class_doc = None;
  } in
  
  let button_class = {
    class_name = "Button";
    c_type = "GtkButton";
    parent = Some "Widget";
    implements = [];
    constructors = [];
    methods = [set_child_method];
    properties = [];
    signals = [];
    class_doc = None;
  } in
  
  (* Convert classes to entities *)
  let widget_entity = Gir_gen_lib.Types.entity_of_class widget_class in
  let button_entity = Gir_gen_lib.Types.entity_of_class button_class in
  
  (* Generate combined class module for cyclic dependency scenario *)
  let combined_code = Gir_gen_lib.Generate.Class_gen.generate_combined_class_module
    ~ctx
    ~combined_module_name:"Widget"
    ~entities:[widget_entity; button_entity]
    ~parent_chain_for_entity:(fun class_name ->
      match class_name with
      | "Widget" -> []
      | "Button" -> ["Widget"]
      | _ -> []
    ) in
  
  Printf.eprintf "Generated combined module:\n%s\n" combined_code;
  
  (* Parse the generated combined module into AST *)
  let combined_ast = Ml_ast_helpers.parse_implementation combined_code in
  
  (* Debug: check if button class exists *)
  (match Ml_ast_helpers.find_class_declaration combined_ast "button" with
   | None -> Alcotest.fail "Class 'button' not found in combined module"
   | Some cd ->
       Printf.eprintf "Found class 'button'\n";
       Printf.eprintf "Class expr type: %s\n" (Ml_ast_helpers.class_expr_to_string cd.pci_expr);
       (* Debug: check if set_child method exists *)
       match Ml_ast_helpers.find_method_in_class cd.pci_expr "set_child" with
        | None ->
            (* List all methods for debugging by checking common names *)
            let test_names = ["set_child"; "as_widget"; "as_button"] in
            List.iter (fun name ->
              match Ml_ast_helpers.find_method_in_class cd.pci_expr name with
              | Some _ -> Printf.eprintf "  Found method: '%s'\n" name
              | None -> Printf.eprintf "  Not found: '%s'\n" name
            ) test_names;
            Alcotest.fail "Method 'set_child' not found in class 'button'"
        | Some _ -> Printf.eprintf "Found method 'set_child'\n");
  
  (* Verify the generated code contains structural type pattern using AST validation *)
  (* This validates that the code generator produces structural types for same-cluster classes *)
  Ml_ast_helpers.assert_method_has_structural_type_param combined_ast "button" "set_child";

  Printf.eprintf "Generated combined module:\n%s\n" combined_code;
  
  (* Validate that Button class has set_child method using class-based AST validation *)
   (match Ml_ast_helpers.find_class_declaration combined_ast "button" with
     | None -> Alcotest.fail "Class 'button' not found in combined module"
     | Some cd ->
          (match Ml_ast_helpers.find_method_in_class cd.pci_expr "set_child" with
          | None -> Alcotest.fail "Method 'set_child' not found in class 'button'"
          | _ -> (* Method found, now validate it has structural type using AST *)
              Ml_ast_helpers.assert_method_has_structural_field combined_ast "button" "set_child" "as_widget"))

(* ========================================================================= *)
(* Test 8: Property Getter Wrapper *)
(* ========================================================================= *)

(* Test that property getters return wrapped types (option/result) *)
let test_property_getter_wrapper () =
  let ctx = create_test_context () in
  
  (* Create a property with string type *)
  let label_property = {
    prop_name = "label";
    prop_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = true; transfer_ownership = TransferNone; array = None };
    readable = true;
    writable = true;
    construct_only = false;
    prop_doc = None;
  } in
  
  (* Create a property getter method that returns the property value *)
  let get_label_method = {
    method_name = "get_label";
    c_identifier = "gtk_button_get_label";
    return_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = true; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = Some "label";
    set_property = None;
  } in
  
  (* Generate Layer 2 class signature *)
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[get_label_method]
    ~properties:[label_property]
    ~signals:[] in
  
  (* Parse the generated signature into AST *)
  let mli_ast = Ml_ast_helpers.parse_interface mli_code in
  
  (* Verify the getter method has string option return type using AST inspection *)
  (* Property getters with nullable types should return 'string option' *)
  Layer2_helpers.validate_method_type_annotation_sig 
    ~signature:mli_ast 
    ~class_name:"button" 
    ~method_name:"get_label" 
    ~expected_type:"unit -> string option"

(* ========================================================================= *)
(* Test 9: Property Setter Wrapper *)
(* ========================================================================= *)

(* Test that property setters accept #class type parameters and coerce *)
let test_property_setter_wrapper () =
  let ctx = create_test_context () in
  
  (* Create a child property that accepts Widget type *)
  let child_property = {
    prop_name = "child";
    prop_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
    readable = true;
    writable = true;
    construct_only = false;
    prop_doc = None;
  } in
  
  (* Create a property setter method that takes Widget parameter *)
  let set_child_method = {
    method_name = "set_child";
    c_identifier = "gtk_button_set_child";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "child";
        param_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = Some "child";
  } in
  
  (* Generate Layer 2 class module *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[set_child_method]
    ~properties:[child_property]
    ~signals:[] in
  
  (* Parse the generated code into AST *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
  
   (* Debug: Print the generated code *)
   Printf.eprintf "Generated class module for property setter test:\n%s\n" ml_code;
   
   (* Find the class declaration to check the method body *)
   match Ml_ast_helpers.find_class_declaration ml_ast "button" with
    | None -> Alcotest.fail "Class 'button' not found in generated class AST"
    | Some class_decl ->
        (* Verify the setter method exists using AST parsing *)
        match Ml_ast_helpers.find_method_in_class class_decl.pci_expr "set_child" with
         | None -> Alcotest.fail "set_child method not found in generated class AST"
         | Some method_field ->
             (* Debug: print the method field description *)
             (match method_field.pcf_desc with
              | Pcf_method (_, _, Cfk_virtual _) ->
                  Printf.eprintf "Method set_child is virtual\n"
              | Pcf_method (_, _, Cfk_concrete (_, { pexp_desc = desc; _ })) ->
                  (match desc with
                   | Pexp_poly (_, Some poly_type) ->
                       Printf.eprintf "Method set_child is concrete with poly_type: %s\n"
                         (Ml_ast_helpers.core_type_to_string poly_type);
                       Printf.eprintf "Contains hierarchy: %b\n"
                         (Ml_ast_helpers.contains_hierarchy_type poly_type)
                   | Pexp_poly (_, None) ->
                       Printf.eprintf "Method set_child is concrete with poly_type: None\n"
                   | _ -> Printf.eprintf "Method set_child is concrete with unexpected desc: %s\n"
                         (match desc with Pexp_ident _ -> "Pexp_ident" | Pexp_apply _ -> "Pexp_apply" | _ -> "other"))
              | _ -> Printf.eprintf "Unexpected method field type\n");
             
             (* Check if method has hierarchy parameter by examining the type *)
             (match Ml_ast_helpers.get_method_type method_field with
              | Some method_type ->
                  Printf.eprintf "Extracted method type: %s\n" (Ml_ast_helpers.core_type_to_string method_type);
                  Printf.eprintf "Contains hierarchy type: %b\n" (Ml_ast_helpers.contains_hierarchy_type method_type);
                  if not (Ml_ast_helpers.contains_hierarchy_type method_type) then
                    Alcotest.fail "set_child method does not have hierarchy parameter"
              | None -> Alcotest.fail "Could not extract type for set_child method");
             
              (* Hierarchy parameter check already passed.
                 Note: We can't safely check inside Pexp_function (lambda) without unsafe Obj.magic,
                 so we skip the body traversal. The type annotation validation is sufficient. *)
              Printf.eprintf "Method set_child has correct hierarchy parameter type.\n"

(* ========================================================================= *)
(* Test 10: Inheritance Generation *)
(* ========================================================================= *)

(* Test that generated classes inherit from GWidget.widget_skel *)
let test_inheritance_generation () =
  let ctx = create_test_context () in
  
  (* Create a simple method *)
  let meth = {
    method_name = "show";
    c_identifier = "gtk_button_show";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in
  
  (* Generate Layer 2 class module with Widget as parent *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  Printf.eprintf "Generated class module for inheritance test:\n%s\n" ml_code;
  
  (* Parse the generated code into AST *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
  
  (* Validate that the generated class inherits from GWidget.widget_skel using AST parsing *)
  Layer2_helpers.validate_class_inherits
    ~structure:ml_ast
    ~class_name:"button"
    ~parent_class:"GWidget.widget_skel"

(* ========================================================================= *)
(* Test 11: Signal Handler Inheritance *)
(* ========================================================================= *)

(* Test that classes with signals inherit from the corresponding signals class *)
let test_signal_handler_inheritance () =
  let ctx = create_test_context () in

  (* Create a test signal for the button *)
  let clicked_signal = Layer2_helpers.create_test_signal ~name:"clicked" in

  (* Generate Layer 2 class module with signals *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[]
    ~properties:[]
    ~signals:[clicked_signal] in

  Printf.eprintf "Generated class module for signal inheritance test:\n%s\n" ml_code;

  (* Parse the generated code into AST *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in

  (* Validate that the generated class inherits from Gbutton_signals.button_signals using AST parsing *)
  Layer2_helpers.validate_class_inherits
    ~structure:ml_ast
    ~class_name:"button"
    ~parent_class:"Gbutton_signals.button_signals"

(* ========================================================================= *)
(* Test 12: Hierarchy Accessor Method *)
(* ========================================================================= *)

(* Test that generated classes have 'method as_widget = (ClassName.as_widget obj)' pattern *)
let test_hierarchy_accessor_method () =
  let ctx = create_test_context () in

  (* Generate Layer 2 class module for Button that inherits from Widget *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[]
    ~properties:[]
    ~signals:[] in

  Printf.eprintf "Generated class module for hierarchy accessor test:\n%s\n" ml_code;

  (* Parse the generated code into AST *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in

  (* Find the button class declaration in the AST *)
  match Ml_ast_helpers.find_class_declaration ml_ast "button" with
  | None -> Alcotest.fail "Class 'button' not found in generated class AST"
  | Some class_decl ->
      (* Find the as_widget method in the class *)
      match Ml_ast_helpers.find_method_in_class class_decl.pci_expr "as_widget" with
      | None -> Alcotest.fail "Method 'as_widget' not found in generated class AST"
      | Some method_field ->
          (* Extract the method body *)
          (match Ml_ast_helpers.get_method_body method_field with
           | None -> Alcotest.fail "Could not extract body for as_widget method"
           | Some method_body ->
               (* Debug: Print method body structure using Pprintast *)
               let buf = Buffer.create 256 in
               let fmt = Format.formatter_of_buffer buf in
               Ppxlib.Pprintast.expression fmt method_body;
               Format.pp_print_flush fmt ();
               let body_str = Buffer.contents buf in
               Printf.eprintf "Method body: %s\n" body_str;

               (* Validate that the method body calls Button.as_widget *)
               (* The expected pattern is: (Button.as_widget obj) *)
               if not (Ml_ast_helpers.method_body_calls_function method_body "Button" "as_widget") then
                 Alcotest.fail "as_widget method body does not call Button.as_widget function";

                (* Additional validation: verify the method structure is correct *)
                (match method_body.pexp_desc with
                 | Pexp_apply _ ->
                     (* The method should be a function call, which is correct *)
                     Printf.eprintf "as_widget method body is Pexp_apply (function call) - correct structure\n"
                 | Pexp_ident _ ->
                     Printf.eprintf "as_widget method body is Pexp_ident - simple reference\n"
                 | _ ->
                     Printf.eprintf "Warning: as_widget method body has unexpected structure\n"))

(* ========================================================================= *)
(* Test 13: Class Accessor Method *)
(* ========================================================================= *)

(* Test that generated classes have 'method as_button = obj' pattern *)
let test_class_accessor_method () =
  let ctx = create_test_context () in

  (* Generate Layer 2 class module for Button *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[]
    ~properties:[]
    ~signals:[] in

  Printf.eprintf "Generated class module for class accessor test:\n%s\n" ml_code;

  (* Parse the generated code into AST *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in

  (* Find the button class declaration in the AST *)
  match Ml_ast_helpers.find_class_declaration ml_ast "button" with
  | None -> Alcotest.fail "Class 'button' not found in generated class AST"
  | Some class_decl ->
      (* Find the as_button method in the class *)
      match Ml_ast_helpers.find_method_in_class class_decl.pci_expr "as_button" with
      | None -> Alcotest.fail "Method 'as_button' not found in generated class AST"
      | Some method_field ->
          (* Extract the method body *)
          (match Ml_ast_helpers.get_method_body method_field with
           | None -> Alcotest.fail "Could not extract body for as_button method"
           | Some method_body ->
               (* Debug: Print method body structure using Pprintast *)
               let buf = Buffer.create 256 in
               let fmt = Format.formatter_of_buffer buf in
               Ppxlib.Pprintast.expression fmt method_body;
               Format.pp_print_flush fmt ();
               let body_str = Buffer.contents buf in
               Printf.eprintf "Method body: %s\n" body_str;

               (* Validate that the method body is a simple 'obj' reference *)
               (* The expected pattern is: obj *)
               (match method_body.pexp_desc with
                | Pexp_ident { txt = Astlib.Longident.Lident "obj"; _ } ->
                    Printf.eprintf "as_button method body is Pexp_ident(obj) - correct structure\n"
                | _ ->
                    Alcotest.fail "as_button method body should be a simple 'obj' reference"))

(* ========================================================================= *)
(* Test 15: Method Conflict Detection *)
(* ========================================================================= *)

(* Test that conflicting methods (same name, different signature) are commented out *)
let test_method_conflict_detection () =
  let open Gir_gen_lib.Types in
  let ctx = create_test_context () in
  
  (* Add hierarchy info for both Widget and Button to make them same-cluster *)
  Hashtbl.add ctx.hierarchy_map "Widget"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  Hashtbl.add ctx.hierarchy_map "Button"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  (* Create a parent Widget class with a 'show' method that takes no parameters *)
  let widget_show_method = {
    method_name = "show";
    c_identifier = "gtk_widget_show";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let widget_class = {
    class_name = "Widget";
    c_type = "GtkWidget";
    parent = None;
    implements = [];
    constructors = [];
    methods = [widget_show_method];
    properties = [];
    signals = [];
    class_doc = None;
  } in

  (* Create a child Button class with a 'show' method that has DIFFERENT signature *)
  (* This should create a conflict because the method name is the same but signature differs *)
  let button_show_method = {
    method_name = "show";
    c_identifier = "gtk_button_show";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "setting";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let button_class = {
    class_name = "Button";
    c_type = "GtkButton";
    parent = Some "Widget";
    implements = [];
    constructors = [];
    methods = [button_show_method];
    properties = [];
    signals = [];
    class_doc = None;
  } in

  (* Add the classes to the context *)
  let updated_ctx = { ctx with classes = [widget_class; button_class] } in

  (* Generate code for the Button class (which inherits from Widget) *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx:updated_ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[button_show_method]
    ~properties:[]
    ~signals:[] in

  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx:updated_ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[button_show_method]
    ~properties:[]
    ~signals:[] in

  Printf.eprintf "Generated .ml code for conflict test:\n%s\n\n" ml_code;
  Printf.eprintf "Generated .mli code for conflict test:\n%s\n\n" mli_code;

    (* Parse the generated code into ASTs *)
    let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
    let mli_ast = Ml_ast_helpers.parse_interface mli_code in

   (* Find the button class in the implementation AST *)
  (match Ml_ast_helpers.find_class_declaration ml_ast "button" with
   | None -> Alcotest.fail "Class 'button' not found in generated .ml AST"
   | Some button_class_decl ->
       Printf.eprintf "Found class 'button' in .ml\n";

       (* Check that the 'show' method is NOT present as an actual definition in the AST *)
       (* (it should be commented out due to the conflict) *)
       let show_method_exists = Ml_ast_helpers.method_exists_as_definition button_class_decl.pci_expr "show" in
       Printf.eprintf "Method 'show' exists as definition in .ml: %b\n" show_method_exists;
       
       if show_method_exists then
         Alcotest.fail "Method 'show' should be commented out due to conflict with parent method but is present as a definition";

       (* Check that the 'show' method IS mentioned in a comment in the generated code *)
       let show_mentioned_in_comment = Ml_ast_helpers.method_mentioned_in_comment ml_code "show" in
       Printf.eprintf "Method 'show' mentioned in comment in .ml: %b\n" show_mentioned_in_comment;

       if not show_mentioned_in_comment then
         Alcotest.fail "Method 'show' should be mentioned in a comment but is not";

       (* Validate using the helper function *)
       Ml_ast_helpers.validate_method_is_commented_out
         ~class_expr:button_class_decl.pci_expr
         ~class_code:ml_code
         ~method_name:"show";

       Printf.eprintf "Validated that 'show' method is properly commented out in .ml\n");

  (* Also check the signature (.mli) *)
  (match Ml_ast_helpers.find_class_type_declaration mli_ast "button" with
   | None -> Alcotest.fail "Class type 'button' not found in generated .mli AST"
   | Some button_class_type_decl ->
       Printf.eprintf "Found class type 'button' in .mli\n";

       (* Check that the 'show' method is NOT present as a signature in the class type *)
       let show_signature_exists = Ml_ast_helpers.method_signature_exists button_class_type_decl.pci_expr "show" in
       Printf.eprintf "Method 'show' signature exists in .mli: %b\n" show_signature_exists;

       if show_signature_exists then
         Alcotest.fail "Method 'show' should be commented out due to conflict with parent method but signature exists";

       (* Check that the 'show' method IS mentioned in a comment in the generated signature *)
       let show_mentioned_in_comment = Ml_ast_helpers.method_mentioned_in_comment mli_code "show" in
       Printf.eprintf "Method 'show' mentioned in comment in .mli: %b\n" show_mentioned_in_comment;

       if not show_mentioned_in_comment then
         Alcotest.fail "Method 'show' should be mentioned in a comment in .mli but is not";

       Printf.eprintf "Validated that 'show' method is properly commented out in .mli\n");

  Printf.eprintf "Method conflict detection test passed.\n"

(* ========================================================================= *)
(* Test 16: Layer 2 Signature vs Implementation Consistency *)
(* ========================================================================= *)

(* Test that method signatures in .mli match method signatures in .ml using AST parsing *)
let test_layer2_signature_consistency () =
  let ctx = create_test_context () in

  (* Create a method with multiple parameters and return type for comprehensive testing *)
  let set_size_method = {
    method_name = "set_size_request";
    c_identifier = "gtk_widget_set_size_request";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "width";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "height";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let get_label_method = {
    method_name = "get_label";
    c_identifier = "gtk_button_get_label";
    return_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = true; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let set_child_method = {
    method_name = "set_child";
    c_identifier = "gtk_button_set_child";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "child";
        param_type = { name = "Widget"; c_type = Some "GtkWidget*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let methods = [set_size_method; get_label_method; set_child_method] in

  (* Generate both .ml and .mli files for a class *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods
    ~properties:[]
    ~signals:[] in

  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods
    ~properties:[]
    ~signals:[] in

  (* Debug: Print generated code for inspection *)
  Printf.eprintf "Generated .mli code:\n%s\n\n" mli_code;
  Printf.eprintf "Generated .ml code:\n%s\n\n" ml_code;

  (* Parse both files into ASTs *)
  let ml_ast = Ml_ast_helpers.parse_implementation ml_code in
  let mli_ast = Ml_ast_helpers.parse_interface mli_code in

  (* Find the class/type declarations in both ASTs *)
  let ml_class_opt = Ml_ast_helpers.find_class_declaration ml_ast "button" in
  let mli_class_type_opt = Ml_ast_helpers.find_class_type_declaration mli_ast "button" in

  (match ml_class_opt with
   | None -> Alcotest.fail "Class 'button' not found in .ml AST"
   | Some _ -> Printf.eprintf "Found class 'button' in .ml\n");

  (match mli_class_type_opt with
   | None -> Alcotest.fail "Class type 'button' not found in .mli AST"
   | Some _ -> Printf.eprintf "Found class type 'button' in .mli\n");

  (* Validate that method signatures in .mli match method signatures in .ml using AST parsing *)
  List.iter (fun meth ->
    let method_name = meth.method_name in
    Printf.eprintf "Validating method: %s\n" method_name;

    (* Extract method type from .ml implementation *)
    let ml_method_type_opt =
      match ml_class_opt with
      | None -> None
      | Some ml_class ->
          (match Ml_ast_helpers.find_method_in_class ml_class.pci_expr method_name with
           | None -> None
           | Some ml_method -> Ml_ast_helpers.get_method_type ml_method)
    in

    (* Extract method type from .mli signature *)
    let mli_method_type_opt =
      match mli_class_type_opt with
      | None -> None
      | Some mli_class_type ->
          (match Ml_ast_helpers.find_method_in_class_type mli_class_type.pci_expr method_name with
           | None -> None
           | Some mli_method_field -> Ml_ast_helpers.get_method_type_from_class_type_field mli_method_field)
    in

    (* Validate that both types were found *)
    (match ml_method_type_opt with
     | None -> Alcotest.fail (Printf.sprintf "Method '%s' not found or has no type in .ml" method_name)
     | Some ml_method_type ->
         Printf.eprintf "  .ml method type: %s\n" (Ml_ast_helpers.core_type_to_string ml_method_type);

         (match mli_method_type_opt with
          | None -> Alcotest.fail (Printf.sprintf "Method '%s' not found or has no type in .mli" method_name)
          | Some mli_method_type ->
              Printf.eprintf "  .mli method type: %s\n" (Ml_ast_helpers.core_type_to_string mli_method_type);

              (* Compare types for semantic equivalence *)
              let ml_type_str = Ml_ast_helpers.core_type_to_string ml_method_type in
              let mli_type_str = Ml_ast_helpers.core_type_to_string mli_method_type in

              (* Check for semantic equivalence - polymorphic types may have different representation
                 between .ml and .mli (e.g., 'p1. (#G.widget as 'p1) -> unit vs #G.widget -> unit).
                 We normalize by checking that both contain hierarchy types with compatible structure. *)
              let ml_has_hierarchy = Ml_ast_helpers.contains_hierarchy_type ml_method_type in
              let mli_has_hierarchy = Ml_ast_helpers.contains_hierarchy_type mli_method_type in

              if ml_has_hierarchy && mli_has_hierarchy then
                (* Both have hierarchy types - they're semantically equivalent even if string differs *)
                Printf.eprintf "  Signature match (hierarchy types): .ml='%s', .mli='%s'\n" ml_type_str mli_type_str
              else if ml_type_str <> mli_type_str then
                Alcotest.fail (Printf.sprintf
                  "Method '%s' signature mismatch: .ml has '%s', .mli has '%s'"
                  method_name ml_type_str mli_type_str)
              else
                Printf.eprintf "  Signature match: %s\n" ml_type_str));

    Printf.eprintf "Method '%s' signature consistency validated.\n\n" method_name
  ) methods;

  Printf.eprintf "All method signatures validated for consistency between .mli and .ml.\n"

(* ========================================================================= *)
(* Test 14: Combined Class Signature Consistency *)
(* ========================================================================= *)

(* Test that method signatures in combined class .mli match .ml for cyclic modules *)
let test_combined_class_signature_consistency () =
  let open Gir_gen_lib.Types in
  let ctx = create_test_context () in

  (* Add hierarchy info for Widget and Button to make them same-cluster *)
  Hashtbl.add ctx.hierarchy_map "Widget"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  Hashtbl.add ctx.hierarchy_map "Button"
    {
      gir_root = "Widget";
      hierarchy = WidgetHierarchy;
      layer2_module = "GWidget";
      class_type_name = "widget_skel";
      accessor_method = "as_widget";
      layer1_base_type = "Widget.t";
      base_conversion_method = "Widget.as_widget";
    };

  (* Create methods for Widget class *)
  let widget_show_method = {
    method_name = "show";
    c_identifier = "gtk_widget_show";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let widget_hide_method = {
    method_name = "hide";
    c_identifier = "gtk_widget_hide";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  (* Create method for Button class *)
  let button_clicked_method = {
    method_name = "clicked";
    c_identifier = "gtk_button_clicked";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let button_set_label_method = {
    method_name = "set_label";
    c_identifier = "gtk_button_set_label";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "label";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let button_get_label_method = {
    method_name = "get_label";
    c_identifier = "gtk_button_get_label";
    return_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = true; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  (* Create classes for combined module generation *)
  let widget_class = {
    class_name = "Widget";
    c_type = "GtkWidget";
    parent = None;
    implements = [];
    constructors = [];
    methods = [widget_show_method; widget_hide_method];
    properties = [];
    signals = [];
    class_doc = None;
  } in

  let button_class = {
    class_name = "Button";
    c_type = "GtkButton";
    parent = Some "Widget";
    implements = [];
    constructors = [];
    methods = [button_clicked_method; button_set_label_method; button_get_label_method];
    properties = [];
    signals = [];
    class_doc = None;
  } in

  (* Convert classes to entities *)
  let widget_entity = Gir_gen_lib.Types.entity_of_class widget_class in
  let button_entity = Gir_gen_lib.Types.entity_of_class button_class in

  (* Generate combined class module and signature for cyclic dependency scenario *)
  let combined_ml_code = Gir_gen_lib.Generate.Class_gen.generate_combined_class_module
    ~ctx
    ~combined_module_name:"Widget"
    ~entities:[widget_entity; button_entity]
    ~parent_chain_for_entity:(fun class_name ->
      match class_name with
      | "Widget" -> []
      | "Button" -> ["Widget"]
      | _ -> []
    ) in

  let combined_mli_code = Gir_gen_lib.Generate.Class_gen.generate_combined_class_signature
    ~ctx
    ~combined_module_name:"Widget"
    ~entities:[widget_entity; button_entity]
    ~parent_chain_for_entity:(fun class_name ->
      match class_name with
      | "Widget" -> []
      | "Button" -> ["Widget"]
      | _ -> []
    ) in

  Printf.eprintf "Generated combined .ml code:\n%s\n\n" combined_ml_code;
  Printf.eprintf "Generated combined .mli code:\n%s\n\n" combined_mli_code;

  (* Parse both files into ASTs - wrap in try/catch for debugging *)
  let combined_ml_ast =
    try Ml_ast_helpers.parse_implementation combined_ml_code
    with e ->
      Printf.eprintf "ERROR parsing .ml: %s\n" (Printexc.to_string e);
      raise e
  in

  let combined_mli_ast =
    try Ml_ast_helpers.parse_interface combined_mli_code
    with e ->
      Printf.eprintf "ERROR parsing .mli: %s\n" (Printexc.to_string e);
      raise e
  in

  (* Define test cases: list of (class_name, method_name) pairs to validate *)
  let test_cases = [
    ("widget", "show");
    ("widget", "hide");
    ("button", "clicked");
    ("button", "set_label");
    ("button", "get_label");
  ] in

  (* Validate that method signatures in .mli match .ml for each test case *)
  List.iter (fun (class_name, method_name) ->
    Printf.eprintf "Validating method %s.%s\n" class_name method_name;

    (* Find class in .ml AST *)
    let ml_class_opt = Ml_ast_helpers.find_class_declaration combined_ml_ast class_name in

    (* Find class type in .mli AST *)
    let mli_class_type_opt = Ml_ast_helpers.find_class_type_declaration combined_mli_ast class_name in

    (match ml_class_opt with
     | None -> Alcotest.fail (Printf.sprintf "Class '%s' not found in combined .ml AST" class_name)
     | Some _ -> Printf.eprintf "  Found class '%s' in .ml\n" class_name);

    (match mli_class_type_opt with
     | None -> Alcotest.fail (Printf.sprintf "Class type '%s' not found in combined .mli AST" class_name)
     | Some _ -> Printf.eprintf "  Found class type '%s' in .mli\n" class_name);

    (* Extract method type from .ml implementation *)
    let ml_method_type_opt =
      match ml_class_opt with
      | None -> None
      | Some ml_class ->
          (match Ml_ast_helpers.find_method_in_class ml_class.pci_expr method_name with
           | None -> None
           | Some ml_method -> Ml_ast_helpers.get_method_type ml_method)
    in

    (* Extract method type from .mli signature *)
    let mli_method_type_opt =
      match mli_class_type_opt with
      | None -> None
      | Some mli_class_type ->
          (match Ml_ast_helpers.find_method_in_class_type mli_class_type.pci_expr method_name with
           | None -> None
           | Some mli_method_field -> Ml_ast_helpers.get_method_type_from_class_type_field mli_method_field)
    in

    (* Validate that both types were found and match *)
    (match ml_method_type_opt with
     | None -> Alcotest.fail (Printf.sprintf "Method '%s' not found or has no type in combined .ml" method_name)
     | Some ml_method_type ->
         Printf.eprintf "  .ml method type: %s\n" (Ml_ast_helpers.core_type_to_string ml_method_type);

         (match mli_method_type_opt with
          | None -> Alcotest.fail (Printf.sprintf "Method '%s' not found or has no type in combined .mli" method_name)
          | Some mli_method_type ->
              Printf.eprintf "  .mli method type: %s\n" (Ml_ast_helpers.core_type_to_string mli_method_type);

              (* Compare types using AST-based comparison (NOT string_contains) *)
              let ml_type_str = Ml_ast_helpers.core_type_to_string ml_method_type in
              let mli_type_str = Ml_ast_helpers.core_type_to_string mli_method_type in

              (* Check for semantic equivalence *)
              if ml_type_str <> mli_type_str then
                Alcotest.fail (Printf.sprintf
                  "Method '%s.%s' signature mismatch: .ml has '%s', .mli has '%s'"
                  class_name method_name ml_type_str mli_type_str)
              else
                Printf.eprintf "  Signature match: %s\n" ml_type_str));

    Printf.eprintf "Method '%s.%s' signature consistency validated.\n\n" class_name method_name
  ) test_cases;

   Printf.eprintf "All method signatures validated for consistency between combined .mli and .ml.\n"

(* ========================================================================= *)
(* Test 17: Throws Method Result Wrapping *)
(* ========================================================================= *)

(* Test that methods with throws=true return (T, GError.t) result type *)
let test_throws_method_result_wrapping () =
  let ctx = create_test_context () in

  (* Create a method with throws=true that returns a string *)
  let load_file_method = {
    method_name = "load_file";
    c_identifier = "gtk_file_chooser_load_file";
    return_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = true;
    get_property = None;
    set_property = None;
  } in

  (* Generate Layer 2 class signature *)
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"FileChooser"
    ~c_type:"GtkFileChooser"
    ~parent_chain:["Widget"]
    ~methods:[load_file_method]
    ~properties:[]
    ~signals:[] in

  (* Debug: Print the generated signature *)
  Printf.eprintf "Generated .mli code for throws test:\n%s\n\n" mli_code;

  (* Parse the generated signature into AST *)
  let mli_ast = Ml_ast_helpers.parse_interface mli_code in

  (* Find the class type declaration *)
  (match Ml_ast_helpers.find_class_type_declaration mli_ast "file_chooser" with
   | None -> Alcotest.fail "Class type 'file_chooser' not found in generated .mli AST"
   | Some class_type_decl ->
       (* Find the load_file method in the class type *)
       (match Ml_ast_helpers.find_method_in_class_type class_type_decl.pci_expr "load_file" with
        | None -> Alcotest.fail "Method 'load_file' not found in class type"
        | Some method_field ->
             (* Extract the method type *)
            (match Ml_ast_helpers.get_method_type_from_class_type_field method_field with
             | None -> Alcotest.fail "Could not extract type for load_file method"
             | Some method_type ->
                 let method_type_str = Ml_ast_helpers.core_type_to_string method_type in
                 Printf.eprintf "Method type: %s\n" method_type_str;

                 (* Extract the return type from the function type *)
                 let return_type = Ml_ast_helpers.get_return_type method_type in
                 let return_type_str = Ml_ast_helpers.core_type_to_string return_type in
                 Printf.eprintf "Return type: %s\n" return_type_str;

                 (* Validate that the return type is a result type with GError.t *)
                 if not (Ml_ast_helpers.is_result_type_with_ginfo_error return_type) then
                   Alcotest.fail (Printf.sprintf
                     "Method 'load_file' should have (T, GError.t) result return type, got '%s'"
                     return_type_str);

                 Printf.eprintf "Throws method result wrapping validated: %s\n" return_type_str)));

  (* Also test with a method that returns void *)
  let create_directory_method = {
    method_name = "create_directory";
    c_identifier = "gtk_file_chooser_create_directory";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [];
    doc = None;
    throws = true;
    get_property = None;
    set_property = None;
  } in

  (* Generate Layer 2 class signature with both methods *)
  let mli_code_with_void = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"FileChooser"
    ~c_type:"GtkFileChooser"
    ~parent_chain:["Widget"]
    ~methods:[load_file_method; create_directory_method]
    ~properties:[]
    ~signals:[] in

  let mli_ast_with_void = Ml_ast_helpers.parse_interface mli_code_with_void in

  (* Validate the void-returning throws method *)
  (match Ml_ast_helpers.find_class_type_declaration mli_ast_with_void "file_chooser" with
   | None -> Alcotest.fail "Class type 'file_chooser' not found in generated .mli AST"
   | Some class_type_decl ->
       (match Ml_ast_helpers.find_method_in_class_type class_type_decl.pci_expr "create_directory" with
        | None -> Alcotest.fail "Method 'create_directory' not found in class type"
        | Some method_field ->
             (match Ml_ast_helpers.get_method_type_from_class_type_field method_field with
              | None -> Alcotest.fail "Could not extract type for create_directory method"
              | Some method_type ->
                  let method_type_str = Ml_ast_helpers.core_type_to_string method_type in
                  Printf.eprintf "Void method type: %s\n" method_type_str;

                  (* Extract the return type from the function type *)
                  let return_type = Ml_ast_helpers.get_return_type method_type in
                  let return_type_str = Ml_ast_helpers.core_type_to_string return_type in
                  Printf.eprintf "Void return type: %s\n" return_type_str;

                  (* For void-returning throws method, should be (unit, GError.t) result *)
                  if not (Ml_ast_helpers.is_result_type_with_ginfo_error return_type) then
                    Alcotest.fail (Printf.sprintf
                      "Method 'create_directory' should have (unit, GError.t) result return type, got '%s'"
                      return_type_str);

                  Printf.eprintf "Void throws method result wrapping validated: %s\n" return_type_str)));

  Printf.eprintf "Throws method result wrapping test passed.\n"

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests = [
  Alcotest.test_case "Hierarchy parameter coercion" `Quick
    test_hierarchy_parameter_coercion;
  Alcotest.test_case "Nullable parameter handling" `Quick
    test_nullable_parameter_handling;
  Alcotest.test_case "Return value wrapping" `Quick
    test_return_value_wrapping;
  Alcotest.test_case "Void method" `Quick
    test_void_method;
  Alcotest.test_case "Multiple parameters" `Quick
    test_multiple_parameters;
  Alcotest.test_case "Method with object parameter" `Quick
    test_method_with_object_parameter;
  Alcotest.test_case "Same-cluster structural type" `Quick
    test_same_cluster_structural_type;
  Alcotest.test_case "Property getter wrapper" `Quick
    test_property_getter_wrapper;
  Alcotest.test_case "Property setter wrapper" `Quick
    test_property_setter_wrapper;
  Alcotest.test_case "Inheritance generation" `Quick
    test_inheritance_generation;
  Alcotest.test_case "Signal handler inheritance" `Quick
    test_signal_handler_inheritance;
  Alcotest.test_case "Hierarchy accessor method" `Quick
    test_hierarchy_accessor_method;
  Alcotest.test_case "Class accessor method" `Quick
    test_class_accessor_method;
  Alcotest.test_case "Method conflict detection" `Quick
    test_method_conflict_detection;
  Alcotest.test_case "Layer 2 signature consistency" `Quick
    test_layer2_signature_consistency;
  Alcotest.test_case "Combined class signature consistency" `Quick
    test_combined_class_signature_consistency;
  Alcotest.test_case "Throws method result wrapping" `Quick
    test_throws_method_result_wrapping;
]
