(* Nullable Parameter and Return Value Tests *)

open Gir_gen_lib.Types

(* =================================================================== *)
(* Methods under test *)
(* =================================================================== *)

let generate_c_method = Gir_gen_lib.Generate.C_stub_method.generate_c_method

(* ========================================================================= *)
(* Test Helpers *)
(* ========================================================================= *)

(* Parse C code string and return our AST *)
let parse_c_string c_code = C_parser.parse_c_code c_code

(* Find a function by name *)
let find_function functions name = C_ast.find_function functions name

(* ========================================================================= *)
(* Nullable String Parameter Tests *)
(* ========================================================================= *)

let test_nullable_string_param () =
  let ctx = Helpers.create_test_context () in
  let meth =
    {
      method_name = "set_title";
      c_identifier = "gtk_window_set_title";
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
            param_name = "title";
            param_type =
              {
                name = "utf8";
                c_type = Some "const gchar*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = true;
            (* Nullable string parameter *)
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWindow" meth "Window" in

  Helpers.log_generated_c_code "nullable string parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_window_set_title") in

  (* Should use String_option_val for nullable string *)
  Alcotest.(check bool)
    "Uses String_option_val for nullable string" true
    (C_validation.handles_nullable_param func "title")

let test_nullable_object_param () =
  let ctx = Helpers.create_test_context () in
  let meth =
    {
      method_name = "set_parent";
      c_identifier = "gtk_widget_set_parent";
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
            param_name = "parent";
            param_type =
              {
                name = "Widget";
                c_type = Some "GtkWidget*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = true;
            (* Nullable object parameter *)
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "nullable object parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_set_parent") in

  (* Should use Option_val for nullable object *)
  Alcotest.(check bool)
    "uses GtkWidget_val" true
    (C_validation.param_converted_with_val_macro func "arg1" "GtkWidget");
  Alcotest.(check bool)
    "Uses Option_val for nullable object" true
    (C_validation.handles_nullable_param func "parent")

let test_non_nullable_string () =
  let ctx = Helpers.create_test_context () in
  let meth =
    {
      method_name = "set_label";
      c_identifier = "gtk_button_set_label";
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
            param_name = "label";
            param_type =
              {
                name = "utf8";
                c_type = Some "const gchar*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = false;
            (* Non-nullable *)
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkButton" meth "Button" in

  Helpers.log_generated_c_code "non nullable string" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_button_set_label") in

  (* Should NOT use nullable handling for non-nullable param *)
  Alcotest.(check bool)
    "Does not use nullable handling for non-nullable string" false
    (C_validation.handles_nullable_param func "label")

let test_nullable_return_value () =
  let ctx = Helpers.create_test_context () in
  let meth =
    {
      method_name = "get_parent";
      c_identifier = "gtk_widget_get_parent";
      return_type =
        {
          name = "Widget";
          c_type = Some "GtkWidget*";
          nullable = true;
          transfer_ownership = TransferNone;
          array = None;
        };
      parameters = [];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "nullable return value" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_parent") in

  (* Should have a return statement *)
  Alcotest.(check bool)
    "Has return statement for nullable return" true
    (C_ast.has_return_stmt func.C_ast.body);
  Alcotest.(check bool)
    "Uses caml return" true
    (C_validation.has_caml_return func);
  Alcotest.(check bool)
    "uses correct conversion macro" true
    (C_validation.uses_correct_return_macro func "Val_GtkWidget")

let test_multiple_nullable_params () =
  let ctx = Helpers.create_test_context () in
  let meth =
    {
      method_name = "set_data";
      c_identifier = "gtk_widget_set_data";
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
            param_name = "key";
            param_type =
              {
                name = "utf8";
                c_type = Some "const gchar*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = true;
            varargs = false;
          };
          {
            param_name = "value";
            param_type =
              {
                name = "Widget";
                c_type = Some "GtkWidget*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = true;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "multiple nullable params" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_set_data") in

  (* Should handle both nullable params *)
  let handles_key = C_validation.handles_nullable_param func "key" in
  let handles_value = C_validation.handles_nullable_param func "value" in

  Alcotest.(check bool) "Handles first nullable param" true handles_key;
  Alcotest.(check bool) "Handles second nullable param" true handles_value

let test_nullable_param_count () =
  let ctx = Helpers.create_test_context () in
  let meth =
    {
      method_name = "set_title";
      c_identifier = "gtk_window_set_title";
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
            param_name = "title";
            param_type =
              {
                name = "utf8";
                c_type = Some "const gchar*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = true;
            varargs = false;
          };
        ];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
    }
  in

  let c_code = generate_c_method ~ctx ~c_type:"GtkWindow" meth "Window" in

  Helpers.log_generated_c_code "nullable param count" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_window_set_title") in

  (* Should have 2 parameters: self + title *)
  Alcotest.(check int)
    "Has correct parameter count" 2
    (C_ast.get_param_count func)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Nullable string parameter" `Quick
      test_nullable_string_param;
    (* Alcotest.test_case "Nullable object parameter" `Quick *)
    (*   test_nullable_object_param; *)
    Alcotest.test_case "Non-nullable string (no nullable handling)" `Quick
      test_non_nullable_string;
    Alcotest.test_case "Nullable return value" `Quick test_nullable_return_value;
    Alcotest.test_case "Multiple nullable parameters" `Quick
      test_multiple_nullable_params;
    Alcotest.test_case "Nullable parameter count" `Quick
      test_nullable_param_count;
  ]
