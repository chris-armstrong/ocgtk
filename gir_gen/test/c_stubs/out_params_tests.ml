(* Out and InOut Parameter Tests *)

open Type_factory

(* ========================================================================= *)
(* Out Parameter Tests *)
(* ========================================================================= *)

let test_simple_out_param_declaration () =
  let meth =
    make_gir_method ~method_name:"get_size" ~c_identifier:"gtk_widget_get_size"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"width" ~param_type:gint_type
            ~direction:Out ();
          make_gir_param ~param_name:"height" ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"simple out param declaration"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Declares width out param" true
    (C_validation.has_out_param_decl func "width" "gint");
  Alcotest.(check bool)
    "Declares height out param" true
    (C_validation.has_out_param_decl func "height" "gint")

let test_out_param_passed_by_reference () =
  let meth =
    make_gir_method ~method_name:"get_position"
      ~c_identifier:"gtk_widget_get_position" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"x" ~param_type:gint_type ~direction:Out ();
          make_gir_param ~param_name:"y" ~param_type:gint_type ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method
      ~log_label:"out param passed by reference" ~c_type:"GtkWidget"
      ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "x passed by reference" true
    (C_validation.out_param_passed_by_ref func "x" "gtk_widget_get_position");
  Alcotest.(check bool)
    "y passed by reference" true
    (C_validation.out_param_passed_by_ref func "y" "gtk_widget_get_position")

let test_out_param_with_return_value () =
  let meth =
    make_gir_method ~method_name:"query_size"
      ~c_identifier:"gtk_widget_query_size" ~return_type:gboolean_type
      ~parameters:
        [
          make_gir_param ~param_name:"width" ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"out param with return value"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Has out param declaration" true
    (C_validation.has_out_param_decl func "width" "gint");
  Alcotest.(check bool)
    "Has return statement" true
    (C_ast.has_return_stmt func.C_ast.body)

let test_inout_parameter () =
  let meth =
    make_gir_method ~method_name:"transform"
      ~c_identifier:"gtk_widget_transform" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"value" ~param_type:gint_type
            ~direction:InOut ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"inout parameter"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Declares InOut parameter" true
    (C_validation.has_out_param_decl func "value" "gint")

let test_multiple_out_params () =
  let meth =
    make_gir_method ~method_name:"get_bounds"
      ~c_identifier:"gtk_widget_get_bounds" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"x" ~param_type:gint_type ~direction:Out ();
          make_gir_param ~param_name:"y" ~param_type:gint_type ~direction:Out ();
          make_gir_param ~param_name:"width" ~param_type:gint_type
            ~direction:Out ();
          make_gir_param ~param_name:"height" ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"multiple out params"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has at least 4 variable declarations" true
    (List.length var_decls >= 4)

let test_out_param_no_ocaml_input () =
  let meth =
    make_gir_method ~method_name:"get_width"
      ~c_identifier:"gtk_widget_get_width" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"width" ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"out param no ocaml input"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check int) "Has only self parameter" 1 (C_ast.get_param_count func)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Simple out parameter declaration" `Quick
      test_simple_out_param_declaration;
    Alcotest.test_case "Out parameter passed by reference" `Quick
      test_out_param_passed_by_reference;
    Alcotest.test_case "Out parameter with return value" `Quick
      test_out_param_with_return_value;
    Alcotest.test_case "InOut parameter" `Quick test_inout_parameter;
    Alcotest.test_case "Multiple out parameters" `Quick test_multiple_out_params;
    Alcotest.test_case "Out param not in OCaml input" `Quick
      test_out_param_no_ocaml_input;
  ]
