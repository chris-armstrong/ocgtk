(* Array Handling Tests - validates array conversion code generation *)

open Gir_gen_lib.Types
open Type_factory

(* Aliases retained for tests that use generate_c_method directly:
   test_nonpointer_array_without_length_raises (check_raises),
   test_pointer_array_without_length_uses_null_termination (raw string check),
   test_generate_methods_skips_failing_method (passed as callback). *)
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
  let meth =
    make_gir_method ~method_name:"set_authors"
      ~c_identifier:"gtk_about_dialog_set_authors" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"authors"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"const char**"
                 ~array:
                   (make_gir_array ~zero_terminated:false
                      ~element_type:utf8_element ())
                 ())
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method
      ~log_label:"zero-terminated string array input" ~c_type:"GtkAboutDialog"
      ~class_name:"AboutDialog" meth
  in
  Alcotest.(check int) "Has 2 parameters" 2 (C_ast.get_param_count func);
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has variable declarations" true
    (List.length var_decls > 0);
  Alcotest.(check bool)
    "Has cleanup code" true
    (C_validation.calls_g_free func "c_arg1")

(* ===================================================================*)
(* Array Return Value Tests *)
(* =================================================================== *)

let test_zero_terminated_string_array_return () =
  let meth =
    make_gir_method ~method_name:"get_artists"
      ~c_identifier:"gtk_about_dialog_get_artists"
      ~return_type:
        (make_gir_type ~name:"utf8" ~c_type:"const char* const*"
           ~array:
             (make_gir_array ~zero_terminated:false ~element_type:utf8_element
                ())
           ())
      ~parameters:[] ()
  in
  let func =
    Helpers.generate_and_find_c_method
      ~log_label:"zero-terminated string array return" ~c_type:"GtkAboutDialog"
      ~class_name:"AboutDialog" meth
  in
  Alcotest.(check bool)
    "Computes length by counting to NULL" true
    (C_validation.counts_to_null func "result");
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

(* =================================================================== *)
(* Array with Length Parameter Tests *)
(* =================================================================== *)

let test_array_with_length_parameter () =
  let meth =
    make_gir_method ~method_name:"set_items" ~c_identifier:"gtk_list_set_items"
      ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"items"
            ~param_type:
              (make_gir_type ~name:"gint" ~c_type:"gint*"
                 ~array:
                   (make_gir_array ~length:1 ~zero_terminated:false
                      ~element_type:gint_element ())
                 ())
            ~direction:In ();
          make_gir_param ~param_name:"n_items" ~param_type:gint_type
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"array with length parameter"
      ~c_type:"GtkList" ~class_name:"List" meth
  in
  Alcotest.(check bool)
    "Has multiple parameters" true
    (C_ast.get_param_count func >= 2);
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has variable declarations" true
    (List.length var_decls > 0);
  Alcotest.(check bool)
    "Calls underlying C function" true
    (C_validation.calls_c_function func "gtk_list_set_items")

(* =================================================================== *)
(* Out-Parameter Array Tests *)
(* =================================================================== *)

let test_out_parameter_array_with_length () =
  let meth =
    make_gir_method ~method_name:"get_selection"
      ~c_identifier:"gtk_list_get_selection" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"indices"
            ~param_type:
              (make_gir_type ~name:"gint" ~c_type:"gint*"
                 ~transfer_ownership:TransferFull
                 ~array:
                   (make_gir_array ~length:1 ~zero_terminated:false
                      ~element_type:gint_element ())
                 ())
            ~direction:Out ();
          make_gir_param ~param_name:"n_indices" ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method
      ~log_label:"out-parameter array with length" ~c_type:"GtkList"
      ~class_name:"List" meth
  in
  Alcotest.(check int) "Has 1 parameter (self)" 1 (C_ast.get_param_count func);
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Declares local variables" true
    (List.length var_decls > 0);
  Alcotest.(check bool)
    "Calls underlying C function" true
    (C_validation.calls_c_function func "gtk_list_get_selection")

let test_out_parameter_string_array () =
  let meth =
    make_gir_method ~method_name:"get_names"
      ~c_identifier:"gtk_widget_get_names" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"names"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"char**"
                 ~transfer_ownership:TransferFull
                 ~array:
                   (make_gir_array ~length:1 ~zero_terminated:false
                      ~element_type:utf8_element ())
                 ())
            ~direction:Out ();
          make_gir_param ~param_name:"n_names" ~param_type:gint_type
            ~direction:Out ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"out-parameter string array"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);
  Alcotest.(check bool)
    "Has conversion loop" true
    (C_validation.has_conversion_loop func);
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
  let meth =
    make_gir_method ~method_name:"set_values"
      ~c_identifier:"gtk_widget_set_values" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"values"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"const char**"
                 ~array:
                   (make_gir_array ~zero_terminated:true
                      ~element_type:utf8_element ())
                 ())
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"array cleanup transfer-none"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Frees array after call" true
    (C_validation.calls_g_free func "c_arg1")

let test_array_cleanup_transfer_full () =
  let meth =
    make_gir_method ~method_name:"set_owned_values"
      ~c_identifier:"gtk_widget_set_owned_values" ~return_type:void_type
      ~parameters:
        [
          make_gir_param ~param_name:"values"
            ~param_type:
              (make_gir_type ~name:"utf8" ~c_type:"char**"
                 ~transfer_ownership:TransferFull
                 ~array:
                   (make_gir_array ~zero_terminated:true
                      ~element_type:utf8_element ())
                 ())
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"array cleanup transfer-full"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Does not free array (transfer-full)" false
    (C_validation.calls_g_free func "c_arg1")

(* =================================================================== *)
(* GPtrArray Handling Tests *)
(* =================================================================== *)

let test_gptr_array_return () =
  let meth =
    make_gir_method ~method_name:"get_element_stack"
      ~c_identifier:"gtk_buildable_parse_context_get_element_stack"
      ~return_type:
        (make_gir_type ~name:"utf8" ~c_type:"GPtrArray*"
           ~array:
             (make_gir_array ~zero_terminated:false ~element_type:utf8_element
                ())
           ())
      ~parameters:
        [
          make_gir_param ~param_name:"context"
            ~param_type:
              (make_gir_type ~name:"BuildableParseContext"
                 ~c_type:"GtkBuildableParseContext*" ())
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"GPtrArray return"
      ~c_type:"GtkBuildableParseContext" ~class_name:"BuildableParseContext"
      meth
  in
  Alcotest.(check bool)
    "Has variable declarations for GPtrArray handling" true
    (List.length (C_ast.get_var_decls func) > 0);
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

let test_gptr_array_transfer_full () =
  let ginet_address_element =
    make_gir_type ~name:"GInetAddress" ~c_type:"GInetAddress*" ()
  in
  let meth =
    make_gir_method ~method_name:"get_ip_addresses"
      ~c_identifier:"g_tls_certificate_get_ip_addresses"
      ~return_type:
        (make_gir_type ~name:"GInetAddress" ~c_type:"GPtrArray*"
           ~transfer_ownership:TransferFull
           ~array:
             (make_gir_array ~zero_terminated:false
                ~element_type:ginet_address_element ())
           ())
      ~parameters:
        [
          make_gir_param ~param_name:"cert"
            ~param_type:
              (make_gir_type ~name:"GTlsCertificate" ~c_type:"GTlsCertificate*"
                 ())
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method
      ~log_label:"GPtrArray return with transfer-full" ~c_type:"GTlsCertificate"
      ~class_name:"TlsCertificate" meth
  in
  Alcotest.(check bool)
    "Has variable declarations for GPtrArray handling" true
    (List.length (C_ast.get_var_decls func) > 0);
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

let test_gptr_array_with_incompatible_element_type () =
  let gdk_time_coord_element =
    make_gir_type ~name:"GdkTimeCoord" ~c_type:"GdkTimeCoord*" ()
  in
  let meth =
    make_gir_method ~method_name:"get_time_coords"
      ~c_identifier:"gdk_event_get_history"
      ~return_type:
        (make_gir_type ~name:"GdkTimeCoord" ~c_type:"GPtrArray*"
           ~array:
             (make_gir_array ~zero_terminated:false
                ~element_type:gdk_time_coord_element ())
           ())
      ~parameters:
        [
          make_gir_param ~param_name:"event"
            ~param_type:(make_gir_type ~name:"GdkEvent" ~c_type:"GdkEvent*" ())
            ~direction:In ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method
      ~log_label:"GPtrArray with struct elements" ~c_type:"GdkEvent"
      ~class_name:"Event" meth
  in
  Alcotest.(check bool)
    "Has variable declarations for GPtrArray handling" true
    (List.length (C_ast.get_var_decls func) > 0);
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);
  Alcotest.(check bool)
    "Converts elements in loop" true
    (C_validation.has_conversion_loop func)

(* =================================================================== *)
(* Non-Pointer Array Without Length Tests (c_stub_array_conv.ml fix) *)
(* =================================================================== *)

let test_nonpointer_array_without_length_raises () =
  let ctx = create_test_context () in
  let meth =
    make_gir_method ~method_name:"get_values"
      ~c_identifier:"gtk_widget_get_values"
      ~return_type:
        (make_gir_type ~name:"gint" ~c_type:"gint*"
           ~array:
             (make_gir_array ~zero_terminated:false ~element_type:gint_element
                ())
           ())
      ~parameters:[] ()
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
    make_gir_method ~method_name:"get_tags" ~c_identifier:"gtk_widget_get_tags"
      ~return_type:
        (make_gir_type ~name:"utf8" ~c_type:"const char**"
           ~array:
             (make_gir_array ~zero_terminated:false ~element_type:utf8_element
                ())
           ())
      ~parameters:[] ()
  in
  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in
  Helpers.log_generated_c_code "pointer array without length" c_code;
  (* The C_parser does not model while/for loop bodies or their conditions, so
     there is no AST-based way to assert that a "!= NULL" termination check is
     present. String search is the only available mechanism for this particular
     structural pattern. This is an acknowledged exception for this one check. *)
  Alcotest.(check bool)
    "Uses NULL-termination for pointer array" true
    (Helpers.string_contains c_code "!= NULL")

(* =================================================================== *)
(* generate_methods Skips Failing Method Tests (c_stub_helpers.ml fix) *)
(* =================================================================== *)

let test_generate_methods_skips_failing_method () =
  let ctx = create_test_context () in
  let buf = Buffer.create 4096 in
  let valid_method =
    make_gir_method ~method_name:"do_something"
      ~c_identifier:"gtk_widget_do_something" ~return_type:void_type
      ~parameters:[] ()
  in
  (* Failing method - returns gint array without length info (will raise Failure) *)
  let failing_method =
    make_gir_method ~method_name:"get_values"
      ~c_identifier:"gtk_widget_get_values"
      ~return_type:
        (make_gir_type ~name:"gint" ~c_type:"gint*"
           ~array:
             (make_gir_array ~zero_terminated:false ~element_type:gint_element
                ())
           ())
      ~parameters:[] ()
  in
  Gir_gen_lib.Generate.C_stub_helpers.generate_methods ~ctx ~c_type:"GtkWidget"
    ~class_name:"Widget" ~buf ~generator:generate_c_method
    [ valid_method; failing_method ];
  let output = Buffer.contents buf in
  let output_functions = C_parser.parse_c_code output in
  Helpers.assert_some "Valid method is in output"
    (C_ast.find_function output_functions "ml_gtk_widget_do_something");
  Alcotest.(check bool)
    "Failing method is NOT in output" true
    (Option.is_none
       (C_ast.find_function output_functions "ml_gtk_widget_get_values"))

(* =================================================================== *)
(* Test Suite *)
(* =================================================================== *)

let tests =
  [
    Alcotest.test_case "Zero-terminated string array input" `Quick
      test_zero_terminated_string_array_input;
    Alcotest.test_case "Zero-terminated string array return" `Quick
      test_zero_terminated_string_array_return;
    Alcotest.test_case "Array with explicit length parameter" `Quick
      test_array_with_length_parameter;
    Alcotest.test_case "Out-parameter array with length" `Quick
      test_out_parameter_array_with_length;
    Alcotest.test_case "Out-parameter string array" `Quick
      test_out_parameter_string_array;
    Alcotest.test_case "Array cleanup with transfer-none" `Quick
      test_array_cleanup_transfer_none;
    Alcotest.test_case "Array cleanup with transfer-full" `Quick
      test_array_cleanup_transfer_full;
    Alcotest.test_case "GPtrArray return (transfer-none)" `Quick
      test_gptr_array_return;
    Alcotest.test_case "GPtrArray return (transfer-full)" `Quick
      test_gptr_array_transfer_full;
    Alcotest.test_case "GPtrArray with struct elements" `Quick
      test_gptr_array_with_incompatible_element_type;
    Alcotest.test_case "Non-pointer array without length raises" `Quick
      test_nonpointer_array_without_length_raises;
    Alcotest.test_case "Pointer array without length uses NULL-termination"
      `Quick test_pointer_array_without_length_uses_null_termination;
    Alcotest.test_case "generate_methods skips failing method" `Quick
      test_generate_methods_skips_failing_method;
  ]
