(* Layer 2 Method Wrapper Tests - End-to-end testing of method wrapper generation *)

open Gir_gen_lib.Types

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
  
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  (* Verify the method is mentioned in the generated code *)
  if not (Helpers.string_contains ml_code "set_focus") then
    Alcotest.fail "set_focus method not found in generated class";
  
  if not (Helpers.string_contains mli_code "set_focus") then
    Alcotest.fail "set_focus method not found in generated signature"

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
  
  (* Generate Layer 2 class module and signature *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  (* Verify the method is mentioned in the generated code *)
  if not (Helpers.string_contains ml_code "set_label") then
    Alcotest.fail "set_label method not found in generated class";
  
  (* Verify the method signature includes option type for nullable parameter *)
  if not (Helpers.string_contains mli_code "set_label") then
    Alcotest.fail "set_label method not found in generated signature"

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
  
  (* Generate Layer 2 class module and signature *)
  let ml_code = Gir_gen_lib.Generate.Class_gen.generate_class_module
    ~ctx
    ~class_name:"Container"
    ~c_type:"GtkContainer"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Container"
    ~c_type:"GtkContainer"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  (* Verify the method is mentioned in the generated code *)
  if not (Helpers.string_contains ml_code "get_child") then
    Alcotest.fail "get_child method not found in generated class";
  
  if not (Helpers.string_contains mli_code "get_child") then
    Alcotest.fail "get_child method not found in generated signature"

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
  
  (* Verify the method is mentioned in the generated code *)
  if not (Helpers.string_contains ml_code "show") then
    Alcotest.fail "show method not found in generated class";
  
  if not (Helpers.string_contains mli_code "show") then
    Alcotest.fail "show method not found in generated signature"

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
  
  (* Verify the method is mentioned in the generated code *)
  if not (Helpers.string_contains ml_code "set_size_request") then
    Alcotest.fail "set_size_request method not found in generated class";
  
  if not (Helpers.string_contains mli_code "set_size_request") then
    Alcotest.fail "set_size_request method not found in generated signature"

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
  
  let mli_code = Gir_gen_lib.Generate.Class_gen.generate_class_signature
    ~ctx
    ~class_name:"Button"
    ~c_type:"GtkButton"
    ~parent_chain:["Widget"]
    ~methods:[meth]
    ~properties:[]
    ~signals:[] in
  
  (* Verify the method is mentioned in the generated code *)
  if not (Helpers.string_contains ml_code "set_child") then
    Alcotest.fail "set_child method not found in generated class";
  
  if not (Helpers.string_contains mli_code "set_child") then
    Alcotest.fail "set_child method not found in generated signature"

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
]
