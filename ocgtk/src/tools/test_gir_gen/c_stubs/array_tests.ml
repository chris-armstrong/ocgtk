(* Array Handling Tests - validates array conversion code generation *)

open Gir_gen_lib.Types
open Type_factory

(* Use shared test helpers *)
let create_test_context = Helpers.create_test_context
let parse_c_string = C_parser.parse_c_code
let find_function = C_ast.find_function
let generate_c_method = Gir_gen_lib.Generate.C_stub_method.generate_c_method

let utf8_element = make_gir_type ~name:"utf8" ~c_type:"char*" ()
let gint_element = make_gir_type ~name:"gint" ~c_type:"gint" ()

(* =================================================================== *)
(* Array Input Parameter Tests *)
(* =================================================================== *)

let test_zero_terminated_string_array_input () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"set_authors"
      ~c_identifier:"gtk_about_dialog_set_authors"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"authors"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"const char**"
                 ~array:(make_gir_array ~zero_terminated:false ~element_type:utf8_element ())
                 ())
            ~direction:In ();
        ]
      ()
  in

  let c_code =
    generate_c_method ~ctx ~c_type:"GtkAboutDialog" meth "AboutDialog"
  in

  Helpers.log_generated_c_code "zero-terminated string array input" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get (find_function functions "ml_gtk_about_dialog_set_authors")
  in

  (* Should have 2 parameters: self + authors *)
  Alcotest.(check int) "Has 2 parameters" 2 (C_ast.get_param_count func);

  (* Verify function has variable declarations (simplified parser limitation) *)
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has variable declarations" true
    (List.length var_decls > 0);

  (* Check that cleanup code is present *)
  Alcotest.(check bool)
    "Has cleanup code" true
    (C_validation.calls_g_free func "c_arg1")

(* ===================================================================*)
(* Array Return Value Tests *)
(* =================================================================== *)

let test_zero_terminated_string_array_return () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"get_artists"
      ~c_identifier:"gtk_about_dialog_get_artists"
      ~return_type:
        (make_gir_type ~name:"utf8" ~c_type:"const char* const*"
           ~array:(make_gir_array ~zero_terminated:false ~element_type:utf8_element ())
           ())
      ~parameters:[]
      ()
  in

  let c_code =
    generate_c_method ~ctx ~c_type:"GtkAboutDialog" meth "AboutDialog"
  in

  Helpers.log_generated_c_code "zero-terminated string array return" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get (find_function functions "ml_gtk_about_dialog_get_artists")
  in

  (* Should compute length by iterating to NULL *)
  Alcotest.(check bool)
    "Computes length by counting to NULL" true
    (C_validation.counts_to_null func "result");

  (* Should allocate OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Should convert elements in loop *)
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

(* =================================================================== *)
(* Array with Length Parameter Tests *)
(* =================================================================== *)

let test_array_with_length_parameter () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"set_items"
      ~c_identifier:"gtk_list_set_items"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"items"
            ~param_type:
              (make_gir_type ~name:"gint" ~c_type:"gint*"
                 ~array:(make_gir_array ~length:1 ~zero_terminated:false ~element_type:gint_element ())
                 ())
            ~direction:In ();
          make_gir_param ~param_name:"n_items"
            ~param_type:gint_type
            ~direction:In ();
        ]
      ()
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkList" meth "List" in

  Helpers.log_generated_c_code "array with length parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_list_set_items") in

  (* C function signature has self + items parameters *)
  (* Note: The C signature will show the actual parameter count,
     which includes the length parameter even though it's computed *)
  Alcotest.(check bool)
    "Has multiple parameters" true
    (C_ast.get_param_count func >= 2);

  (* Verify function structure - detailed validation limited by simple parser *)
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has variable declarations" true
    (List.length var_decls > 0);

  (* Basic structure check *)
  Alcotest.(check bool)
    "Calls underlying C function" true
    (C_validation.calls_c_function func "gtk_list_set_items")

(* =================================================================== *)
(* Out-Parameter Array Tests *)
(* =================================================================== *)

let test_out_parameter_array_with_length () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"get_selection"
      ~c_identifier:"gtk_list_get_selection"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"indices"
            ~param_type:
              (make_gir_type ~name:"gint" ~c_type:"gint*"
                 ~transfer_ownership:TransferFull
                 ~array:(make_gir_array ~length:1 ~zero_terminated:false ~element_type:gint_element ())
                 ())
            ~direction:Out ();
          make_gir_param ~param_name:"n_indices"
            ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkList" meth "List" in

  Helpers.log_generated_c_code "out-parameter array with length" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_list_get_selection") in

  (* Should have 1 OCaml parameter: just self *)
  Alcotest.(check int) "Has 1 parameter (self)" 1 (C_ast.get_param_count func);

  (* Should declare out parameters *)
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Declares local variables" true
    (List.length var_decls > 0);

  (* Basic structure checks *)
  Alcotest.(check bool)
    "Calls underlying C function" true
    (C_validation.calls_c_function func "gtk_list_get_selection")

let test_out_parameter_string_array () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"get_names"
      ~c_identifier:"gtk_widget_get_names"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"names"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"char**"
                 ~transfer_ownership:TransferFull
                 ~array:(make_gir_array ~length:1 ~zero_terminated:false ~element_type:utf8_element ())
                 ())
            ~direction:Out ();
          make_gir_param ~param_name:"n_names"
            ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "out-parameter string array" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_names") in

  (* Should allocate OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Should have conversion loop for strings *)
  Alcotest.(check bool)
    "Has conversion loop" true
    (C_validation.has_conversion_loop func);

  (* TransferFull: should free the array after conversion *)
  (* We check for presence of g_free calls *)
  let has_cleanup =
    List.exists
      (function
        | C_ast.ExprStmt (C_ast.Call ("g_free", _)) -> true | _ -> false)
      func.C_ast.body
  in
  Alcotest.(check bool)
    "Frees array after conversion (transfer-full)" true has_cleanup

(* =================================================================== *)
(* Memory Management Tests *)
(* =================================================================== *)

let test_array_cleanup_transfer_none () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"set_values"
      ~c_identifier:"gtk_widget_set_values"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"values"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"const char**"
                 ~array:(make_gir_array ~zero_terminated:true ~element_type:utf8_element ())
                 ())
            ~direction:In ();
        ]
      ()
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "array cleanup transfer-none" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_set_values") in

  (* Should free array after call *)
  Alcotest.(check bool)
    "Frees array after call" true
    (C_validation.calls_g_free func "c_arg1")

let test_array_cleanup_transfer_full () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"set_owned_values"
      ~c_identifier:"gtk_widget_set_owned_values"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"values"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"char**"
                 ~transfer_ownership:TransferFull
                 ~array:(make_gir_array ~zero_terminated:true ~element_type:utf8_element ())
                 ())
            ~direction:In ();
        ]
      ()
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "array cleanup transfer-full" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get (find_function functions "ml_gtk_widget_set_owned_values")
  in

  (* Should NOT free array (GTK owns it) *)
  Alcotest.(check bool)
    "Does not free array (transfer-full)" false
    (C_validation.calls_g_free func "c_arg1")

(* =================================================================== *)
(* GPtrArray Handling Tests *)
(* =================================================================== *)

let test_gptr_array_return () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"get_element_stack"
      ~c_identifier:"gtk_buildable_parse_context_get_element_stack"
      ~return_type:
        (make_gir_type ~name:"utf8" ~c_type:"GPtrArray*"
           ~array:(make_gir_array ~zero_terminated:false ~element_type:utf8_element ())
           ())
      ~parameters:
        [
          make_gir_param ~param_name:"context"
            ~param_type:(make_gir_type ~name:"BuildableParseContext" ~c_type:"GtkBuildableParseContext*" ())
            ~direction:In ();
        ]
      ()
  in

  let c_code =
    generate_c_method ~ctx ~c_type:"GtkBuildableParseContext" meth
      "BuildableParseContext"
  in

  Helpers.log_generated_c_code "GPtrArray return" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get
      (find_function functions
         "ml_gtk_buildable_parse_context_get_element_stack")
  in

  (* Should have variable declarations (indicates GPtrArray processing) *)
  Alcotest.(check bool)
    "Has variable declarations for GPtrArray handling" true
    (List.length (C_ast.get_var_decls func) > 0);

  (* Should allocate OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Should convert elements in loop *)
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

let test_gptr_array_transfer_full () =
  let ctx = create_test_context () in
  let ginet_address_element = make_gir_type ~name:"GInetAddress" ~c_type:"GInetAddress*" () in
  let meth =
    make_gir_method
      ~method_name:"get_ip_addresses"
      ~c_identifier:"g_tls_certificate_get_ip_addresses"
      ~return_type:
        (make_gir_type ~name:"GInetAddress" ~c_type:"GPtrArray*"
           ~transfer_ownership:TransferFull
           ~array:(make_gir_array ~zero_terminated:false ~element_type:ginet_address_element ())
           ())
      ~parameters:
        [
          make_gir_param ~param_name:"cert"
            ~param_type:(make_gir_type ~name:"GTlsCertificate" ~c_type:"GTlsCertificate*" ())
            ~direction:In ();
        ]
      ()
  in

  let c_code =
    generate_c_method ~ctx ~c_type:"GTlsCertificate" meth "TlsCertificate"
  in

  Helpers.log_generated_c_code "GPtrArray return with transfer-full" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get (find_function functions "ml_g_tls_certificate_get_ip_addresses")
  in

  (* Should have variable declarations (indicates GPtrArray processing) *)
  Alcotest.(check bool)
    "Has variable declarations for GPtrArray handling" true
    (List.length (C_ast.get_var_decls func) > 0);

  (* Should allocate OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Should convert elements in loop *)
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

let test_gptr_array_with_incompatible_element_type () =
  let ctx = create_test_context () in
  let gdk_time_coord_element = make_gir_type ~name:"GdkTimeCoord" ~c_type:"GdkTimeCoord*" () in
  let meth =
    make_gir_method
      ~method_name:"get_time_coords"
      ~c_identifier:"gdk_event_get_history"
      ~return_type:
        (make_gir_type ~name:"GdkTimeCoord" ~c_type:"GPtrArray*"
           ~array:(make_gir_array ~zero_terminated:false ~element_type:gdk_time_coord_element ())
           ())
      ~parameters:
        [
          make_gir_param ~param_name:"event"
            ~param_type:(make_gir_type ~name:"GdkEvent" ~c_type:"GdkEvent*" ())
            ~direction:In ();
        ]
      ()
  in

  let c_code = generate_c_method ~ctx ~c_type:"GdkEvent" meth "Event" in

  Helpers.log_generated_c_code "GPtrArray with struct elements" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gdk_event_get_history") in

  (* Should have variable declarations (indicates GPtrArray processing) *)
  Alcotest.(check bool)
    "Has variable declarations for GPtrArray handling" true
    (List.length (C_ast.get_var_decls func) > 0);

  (* Should allocate OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Should convert elements in loop *)
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

(* =================================================================== *)
(* Non-Pointer Array Without Length Tests (c_stub_array_conv.ml fix) *)
(* =================================================================== *)

let test_nonpointer_array_without_length_raises () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"get_values"
      ~c_identifier:"gtk_widget_get_values"
      ~return_type:
        (make_gir_type ~name:"gint" ~c_type:"gint*"
           ~array:(make_gir_array ~zero_terminated:false ~element_type:gint_element ())
           ())
      ~parameters:[]
      ()
  in

  Alcotest.check_raises "Fails for non-pointer array without length"
    (Failure
       "Array has no length information for result (element type: gint). \
        Either zero-terminated, length, or fixed-size attribute required.")
    (fun () ->
      ignore (generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget"))

let test_pointer_array_without_length_uses_null_termination () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method
      ~method_name:"get_tags"
      ~c_identifier:"gtk_widget_get_tags"
      ~return_type:
        (make_gir_type ~name:"utf8" ~c_type:"const char**"
           ~array:(make_gir_array ~zero_terminated:false ~element_type:utf8_element ())
           ())
      ~parameters:[]
      ()
  in

  (* Pointer arrays without length should use NULL-termination, not raise *)
  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "pointer array without length" c_code;

  (* Should NOT raise - pointer arrays can use NULL-termination *)
  (* Should contain NULL-termination check in generated code *)
  Alcotest.(check bool)
    "Uses NULL-termination for pointer array" true
    (Helpers.string_contains c_code "!= NULL")

(* =================================================================== *)
(* generate_methods Skips Failing Method Tests (c_stub_helpers.ml fix) *)
(* =================================================================== *)

let test_generate_methods_skips_failing_method () =
  let ctx = create_test_context () in
  let buf = Buffer.create 4096 in

  (* Valid method - simple void return *)
  let valid_method =
    make_gir_method
      ~method_name:"do_something"
      ~c_identifier:"gtk_widget_do_something"
      ~return_type:void_type
      ~parameters:[]
      ()
  in

  (* Failing method - returns gint array without length info (will raise Failure) *)
  let failing_method =
    make_gir_method
      ~method_name:"get_values"
      ~c_identifier:"gtk_widget_get_values"
      ~return_type:
        (make_gir_type ~name:"gint" ~c_type:"gint*"
           ~array:(make_gir_array ~zero_terminated:false ~element_type:gint_element ())
           ())
      ~parameters:[]
      ()
  in

  (* Generate methods - should NOT raise, should skip failing method *)
  Gir_gen_lib.Generate.C_stub_helpers.generate_methods ~ctx ~c_type:"GtkWidget"
    ~class_name:"Widget" ~buf ~generator:generate_c_method
    [ valid_method; failing_method ];

  let output = Buffer.contents buf in

  (* Verify: No exception propagated (test would have failed if it did) *)

  (* Verify: Valid method IS in the output *)
  Alcotest.(check bool)
    "Valid method is in output" true
    (Helpers.string_contains output "ml_gtk_widget_do_something");

  (* Verify: Failing method is NOT in the output *)
  Alcotest.(check bool)
    "Failing method is NOT in output" false
    (Helpers.string_contains output "ml_gtk_widget_get_values")

(* =================================================================== *)
(* Test Suite *)
(* =================================================================== *)

let tests =
  [
    (* Input array tests *)
    Alcotest.test_case "Zero-terminated string array input" `Quick
      test_zero_terminated_string_array_input;
    (* Return array tests *)
    Alcotest.test_case "Zero-terminated string array return" `Quick
      test_zero_terminated_string_array_return;
    (* Length parameter tests *)
    Alcotest.test_case "Array with explicit length parameter" `Quick
      test_array_with_length_parameter;
    (* Out-parameter array tests *)
    Alcotest.test_case "Out-parameter array with length" `Quick
      test_out_parameter_array_with_length;
    Alcotest.test_case "Out-parameter string array" `Quick
      test_out_parameter_string_array;
    (* Memory management tests *)
    Alcotest.test_case "Array cleanup with transfer-none" `Quick
      test_array_cleanup_transfer_none;
    Alcotest.test_case "Array cleanup with transfer-full" `Quick
      test_array_cleanup_transfer_full;
    (* GPtrArray tests *)
    Alcotest.test_case "GPtrArray return (transfer-none)" `Quick
      test_gptr_array_return;
    Alcotest.test_case "GPtrArray return (transfer-full)" `Quick
      test_gptr_array_transfer_full;
    Alcotest.test_case "GPtrArray with struct elements" `Quick
      test_gptr_array_with_incompatible_element_type;
    (* Non-pointer array without length tests (c_stub_array_conv.ml fix) *)
    Alcotest.test_case "Non-pointer array without length raises" `Quick
      test_nonpointer_array_without_length_raises;
    Alcotest.test_case "Pointer array without length uses NULL-termination"
      `Quick test_pointer_array_without_length_uses_null_termination;
    (* generate_methods skipping tests *)
    Alcotest.test_case "generate_methods skips failing method" `Quick
      test_generate_methods_skips_failing_method;
  ]