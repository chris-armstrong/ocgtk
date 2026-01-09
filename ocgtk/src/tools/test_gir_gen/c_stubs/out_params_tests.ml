(* Out and InOut Parameter Tests *)

open Gir_gen_lib.Types

(* ========================================================================= *)
(* Test Helpers *)
(* ========================================================================= *)

let parse_c_string c_code =
  C_parser.parse_c_code c_code

let find_function functions name =
  C_ast.find_function functions name

(* ========================================================================= *)
(* Out Parameter Tests *)
(* ========================================================================= *)

let test_simple_out_param_declaration () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "get_size";
    c_identifier = "gtk_widget_get_size";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "width";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "height";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "simple out param declaration" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_size") in

  (* Should declare out parameters *)
  Alcotest.(check bool) "Declares width out param" true
    (C_validation.has_out_param_decl func "width" "gint");
  Alcotest.(check bool) "Declares height out param" true
    (C_validation.has_out_param_decl func "height" "gint")

let test_out_param_passed_by_reference () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "get_position";
    c_identifier = "gtk_widget_get_position";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "x";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "y";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "out param passed by reference" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_position") in

  (* Out params should be passed by reference to C function *)
  Alcotest.(check bool) "x passed by reference" true
    (C_validation.out_param_passed_by_ref func "x" "gtk_widget_get_position");
  Alcotest.(check bool) "y passed by reference" true
    (C_validation.out_param_passed_by_ref func "y" "gtk_widget_get_position")

let test_out_param_with_return_value () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "query_size";
    c_identifier = "gtk_widget_query_size";
    return_type = { name = "gboolean"; c_type = Some "gboolean"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "width";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "out param with return value" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_query_size") in

  (* Should have both out param and return value *)
  Alcotest.(check bool) "Has out param declaration" true
    (C_validation.has_out_param_decl func "width" "gint");
  Alcotest.(check bool) "Has return statement" true
    (C_ast.has_return_stmt func.C_ast.body)

let test_inout_parameter () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "transform";
    c_identifier = "gtk_widget_transform";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "value";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = InOut;  (* InOut parameter *)
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "inout parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_transform") in

  (* InOut should be declared and passed by reference *)
  Alcotest.(check bool) "Declares InOut parameter" true
    (C_validation.has_out_param_decl func "value" "gint")

let test_multiple_out_params () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "get_bounds";
    c_identifier = "gtk_widget_get_bounds";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "x";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "y";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "width";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      };
      {
        param_name = "height";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "multiple out params" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_bounds") in

  (* All four out params should be declared *)
  let var_decls = C_ast.get_var_decls func in

  Alcotest.(check bool) "Has at least 4 variable declarations" true
    (List.length var_decls >= 4)

let test_out_param_no_ocaml_input () =
  let ctx = Helpers.create_test_context () in
  let meth = {
    method_name = "get_width";
    c_identifier = "gtk_widget_get_width";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone; array = None };
    parameters = [
      {
        param_name = "width";
        param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone; array = None };
        direction = Out;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "out param no ocaml input" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_width") in

  (* Should only have 1 OCaml parameter (self), not the out param *)
  (* Out params don't count as OCaml input parameters *)
  Alcotest.(check int) "Has only self parameter" 1
    (C_ast.get_param_count func)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Simple out parameter declaration" `Quick test_simple_out_param_declaration;
    Alcotest.test_case "Out parameter passed by reference" `Quick test_out_param_passed_by_reference;
    Alcotest.test_case "Out parameter with return value" `Quick test_out_param_with_return_value;
    Alcotest.test_case "InOut parameter" `Quick test_inout_parameter;
    Alcotest.test_case "Multiple out parameters" `Quick test_multiple_out_params;
    Alcotest.test_case "Out param not in OCaml input" `Quick test_out_param_no_ocaml_input;
  ]
