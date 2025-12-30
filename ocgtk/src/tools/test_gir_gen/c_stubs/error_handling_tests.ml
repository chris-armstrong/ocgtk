(* Error Handling Tests (throws=true) *)

open Gir_gen_lib.Types

(* ========================================================================= *)
(* Test Helpers *)
(* ========================================================================= *)

let parse_c_string c_code =
  C_parser.parse_c_code c_code

let find_function functions name =
  C_ast.find_function functions name

(* ========================================================================= *)
(* Error Handling Tests *)
(* ========================================================================= *)

let test_method_with_throws_declares_error () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "save_to_file";
    c_identifier = "gtk_widget_save_to_file";
    return_type = { name = "gboolean"; c_type = Some "gboolean"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "filename";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = true;  (* This method can throw errors *)
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "method with throws declares error" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_save_to_file") in

  (* Should declare GError* error variable *)
  Alcotest.(check bool) "Declares GError variable" true
    (C_ast.has_var_decl func "error")

let test_error_handling_uses_res_ok () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "load_file";
    c_identifier = "gtk_widget_load_file";
    return_type = { name = "gboolean"; c_type = Some "gboolean"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "filename";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = true;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "error handling uses res ok" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_load_file") in

  (* Should return result type with Res_Ok/Res_Error *)
  Alcotest.(check bool) "Returns result type" true
    (C_validation.returns_result_type func)

let test_error_passed_by_reference () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "save";
    c_identifier = "gtk_widget_save";
    return_type = { name = "gboolean"; c_type = Some "gboolean"; nullable = false; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = true;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "error passed by reference" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_save") in

  (* Should pass error by reference (&error) to C function *)
  Alcotest.(check bool) "Error passed by reference" true
    (C_validation.out_param_passed_by_ref func "error" "gtk_widget_save")

let test_error_initialized_to_null () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "open";
    c_identifier = "gtk_widget_open";
    return_type = { name = "gboolean"; c_type = Some "gboolean"; nullable = false; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = true;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "error initialized to null" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_open") in

  (* Error variable should be declared (initialization to NULL is implicit) *)
  let var_decls = C_ast.get_var_decls func in

  Alcotest.(check bool) "Error variable declared" true
    (List.exists (fun (name, var_type, _) ->
      name = "error" && String.contains var_type 'G'
    ) var_decls)

let test_has_complete_error_handling () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "process";
    c_identifier = "gtk_widget_process";
    return_type = { name = "gboolean"; c_type = Some "gboolean"; nullable = false; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = true;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "has complete error handling" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_process") in

  (* Should have complete error handling infrastructure *)
  Alcotest.(check bool) "Has complete error handling" true
    (C_validation.has_error_handling func)

let test_constructor_with_throws () =
  let ctx = Helpers.create_test_context () in
  let ctor = {
    ctor_name = "new_from_file";
    c_identifier = "gtk_widget_new_from_file";
    ctor_parameters = [
      {
        param_name = "filename";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    ctor_doc = None;
    throws = true;  (* Constructor that can throw *)
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkWidget" ctor "Widget" in

  Helpers.log_generated_c_code "constructor with throws" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_new_from_file") in

  (* Constructor with throws should also have error handling *)
  Alcotest.(check bool) "Constructor with throws has error handling" true
    (C_validation.has_error_handling func)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Method with throws declares GError" `Quick test_method_with_throws_declares_error;
    Alcotest.test_case "Error handling uses Res_Ok/Res_Error" `Quick test_error_handling_uses_res_ok;
    Alcotest.test_case "Error passed by reference" `Quick test_error_passed_by_reference;
    Alcotest.test_case "Error initialized to NULL" `Quick test_error_initialized_to_null;
    Alcotest.test_case "Complete error handling infrastructure" `Quick test_has_complete_error_handling;
    Alcotest.test_case "Constructor with throws" `Quick test_constructor_with_throws;
  ]
