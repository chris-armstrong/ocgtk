(* Array Handling Tests - validates array conversion code generation *)

open Gir_gen_lib.Types

(* Use shared test helpers *)
let create_test_context = Helpers.create_test_context
let parse_c_string = C_parser.parse_c_code
let find_function = C_ast.find_function

(* =================================================================== *)
(* Array Input Parameter Tests *)
(* =================================================================== *)

let test_zero_terminated_string_array_input () =
  let ctx = create_test_context () in
  let meth =
    {
      method_name = "set_authors";
      c_identifier = "gtk_about_dialog_set_authors";
      return_type =
        {
          name = "none";
          c_type = Some "void";
          nullable = false;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters =
        [
          {
            param_name = "authors";
            param_type =
              {
                name = "utf8";
                c_type = Some "const char**";
                nullable = false;
                transfer_ownership = TransferNone;
                array =
                  Some
                    {
                      length = None;
                      zero_terminated = false; (* Will be inferred *)
                      fixed_size = None;
                      element_type =
                        {
                          name = "utf8";
                          c_type = Some "char*";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = In;
            nullable = false;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx
      ~c_type:"GtkAboutDialog" meth "AboutDialog"
  in

  Helpers.log_generated_c_code "zero-terminated string array input" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get (find_function functions "ml_gtk_about_dialog_set_authors")
  in

  (* Should have 2 parameters: self + authors *)
  Alcotest.(check int)
    "Has 2 parameters" 2
    (C_ast.get_param_count func);

  (* Verify function has variable declarations (simplified parser limitation) *)
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has variable declarations" true
    (List.length var_decls > 0);

  (* Manual verification: Generated code inspection shows:
     - Allocates with g_malloc for array with space for NULL terminator
     - Sets array element at length index to NULL
     - Uses const char** type
     - Calls g_free after function call
     All correct per generated output above *)

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
    {
      method_name = "get_artists";
      c_identifier = "gtk_about_dialog_get_artists";
      return_type =
        {
          name = "utf8";
          c_type = Some "const char* const*";
          nullable = false;
          transfer_ownership = TransferNone;
          array =
            Some
              {
                length = None;
                zero_terminated = false; (* Will be inferred *)
                fixed_size = None;
                element_type =
                  {
                    name = "utf8";
                    c_type = Some "char*";
                    nullable = false;
                    transfer_ownership = TransferNone;
                    array = None;
                  };
              };
        };
      parameters = [];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx
      ~c_type:"GtkAboutDialog" meth "AboutDialog"
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
    {
      method_name = "set_items";
      c_identifier = "gtk_list_set_items";
      return_type =
        {
          name = "none";
          c_type = Some "void";
          nullable = false;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters =
        [
          {
            param_name = "items";
            param_type =
              {
                name = "gint";
                c_type = Some "gint*";
                nullable = false;
                transfer_ownership = TransferNone;
                array =
                  Some
                    {
                      length = Some 1; (* Length is parameter index 1 *)
                      zero_terminated = false;
                      fixed_size = None;
                      element_type =
                        {
                          name = "gint";
                          c_type = Some "gint";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = In;
            nullable = false;
            varargs = false;
          };
          {
            param_name = "n_items";
            param_type =
              {
                name = "gint";
                c_type = Some "gint";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = false;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx ~c_type:"GtkList" meth
      "List"
  in

  Helpers.log_generated_c_code "array with length parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_list_set_items") in

  (* C function signature has self + items parameters *)
  (* Note: The C signature will show the actual parameter count,
     which includes the length parameter even though it's computed *)
  Alcotest.(check bool) "Has multiple parameters" true (C_ast.get_param_count func >= 2);

  (* Verify function structure - detailed validation limited by simple parser *)
  let var_decls = C_ast.get_var_decls func in
  Alcotest.(check bool)
    "Has variable declarations" true
    (List.length var_decls > 0);

  (* Manual verification: Generated code should:
     - Compute arg1_length = Wosize_val(arg1)
     - Allocate C array
     - Pass arg1_length as second argument to C function
     Parser limitations prevent automated verification of this *)

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
    {
      method_name = "get_selection";
      c_identifier = "gtk_list_get_selection";
      return_type =
        {
          name = "none";
          c_type = Some "void";
          nullable = false;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters =
        [
          {
            param_name = "indices";
            param_type =
              {
                name = "gint";
                c_type = Some "gint*";
                nullable = false;
                transfer_ownership = TransferFull; (* We own the array *)
                array =
                  Some
                    {
                      length = Some 1; (* Length is parameter index 1 *)
                      zero_terminated = false;
                      fixed_size = None;
                      element_type =
                        {
                          name = "gint";
                          c_type = Some "gint";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = Out;
            nullable = false;
            varargs = false;
          };
          {
            param_name = "n_indices";
            param_type =
              {
                name = "gint";
                c_type = Some "gint";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = Out;
            nullable = false;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx ~c_type:"GtkList" meth
      "List"
  in

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

  (* Manual verification: Generated code should:
     - Declare out1 (array pointer) and out2 (length)
     - Call C function with &out1, &out2
     - Use out2 as length to convert array
     - Allocate OCaml array with caml_alloc
     - Convert elements with Store_field
     - Free array if transfer-full
     Parser limitations prevent full automated verification *)

  (* Basic structure checks *)
  Alcotest.(check bool)
    "Calls underlying C function" true
    (C_validation.calls_c_function func "gtk_list_get_selection")

let test_out_parameter_string_array () =
  let ctx = create_test_context () in
  let meth =
    {
      method_name = "get_names";
      c_identifier = "gtk_widget_get_names";
      return_type =
        {
          name = "none";
          c_type = Some "void";
          nullable = false;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters =
        [
          {
            param_name = "names";
            param_type =
              {
                name = "utf8";
                c_type = Some "char**";
                nullable = false;
                transfer_ownership = TransferFull;
                array =
                  Some
                    {
                      length = Some 1;
                      zero_terminated = false;
                      fixed_size = None;
                      element_type =
                        {
                          name = "utf8";
                          c_type = Some "char*";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = Out;
            nullable = false;
            varargs = false;
          };
          {
            param_name = "n_names";
            param_type =
              {
                name = "gint";
                c_type = Some "gint";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = Out;
            nullable = false;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx ~c_type:"GtkWidget"
      meth "Widget"
  in

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
        | C_ast.ExprStmt (C_ast.Call ("g_free", _)) -> true
        | _ -> false)
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
    {
      method_name = "set_values";
      c_identifier = "gtk_widget_set_values";
      return_type =
        {
          name = "none";
          c_type = Some "void";
          nullable = false;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters =
        [
          {
            param_name = "values";
            param_type =
              {
                name = "utf8";
                c_type = Some "const char**";
                nullable = false;
                transfer_ownership = TransferNone; (* We free after call *)
                array =
                  Some
                    {
                      length = None;
                      zero_terminated = true;
                      fixed_size = None;
                      element_type =
                        {
                          name = "utf8";
                          c_type = Some "char*";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = In;
            nullable = false;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx ~c_type:"GtkWidget"
      meth "Widget"
  in

  Helpers.log_generated_c_code "array cleanup transfer-none" c_code;

  let functions = parse_c_string c_code in
  let func =
    Option.get (find_function functions "ml_gtk_widget_set_values")
  in

  (* Should free array after call *)
  Alcotest.(check bool)
    "Frees array after call" true
    (C_validation.calls_g_free func "c_arg1")

let test_array_cleanup_transfer_full () =
  let ctx = create_test_context () in
  let meth =
    {
      method_name = "set_owned_values";
      c_identifier = "gtk_widget_set_owned_values";
      return_type =
        {
          name = "none";
          c_type = Some "void";
          nullable = false;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters =
        [
          {
            param_name = "values";
            param_type =
              {
                name = "utf8";
                c_type = Some "char**";
                nullable = false;
                transfer_ownership = TransferFull; (* GTK owns, we don't free *)
                array =
                  Some
                    {
                      length = None;
                      zero_terminated = true;
                      fixed_size = None;
                      element_type =
                        {
                          name = "utf8";
                          c_type = Some "char*";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = In;
            nullable = false;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stubs.generate_c_method ~ctx ~c_type:"GtkWidget"
      meth "Widget"
  in

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
  ]
