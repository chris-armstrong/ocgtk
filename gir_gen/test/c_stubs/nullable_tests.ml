(* Nullable Parameter and Return Value Tests *)

open Type_factory

(* ========================================================================= *)
(* Nullable String Parameter Tests *)
(* ========================================================================= *)

let test_nullable_string_param () =
  let meth =
    make_gir_method ~method_name:"set_title"
      ~c_identifier:"gtk_window_set_title" ~return_type:void_type
      ~parameters:[ make_string_param ~param_name:"title" ~nullable:true () ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"nullable string parameter"
      ~c_type:"GtkWindow" ~class_name:"Window" meth
  in
  Alcotest.(check bool)
    "Uses String_option_val for nullable string" true
    (C_validation.handles_nullable_param func "title")

let test_nullable_object_param () =
  let meth =
    make_gir_method ~method_name:"set_parent"
      ~c_identifier:"gtk_widget_set_parent" ~return_type:void_type
      ~parameters:[ make_widget_param ~param_name:"parent" ~nullable:true () ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"nullable object parameter"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "uses GtkWidget_val" true
    (C_validation.param_converted_with_val_macro func "arg1" "GtkWidget");
  Alcotest.(check bool)
    "Uses Option_val for nullable object" true
    (C_validation.handles_nullable_param func "parent")

let test_non_nullable_string () =
  let meth =
    make_gir_method ~method_name:"set_label"
      ~c_identifier:"gtk_button_set_label" ~return_type:void_type
      ~parameters:[ make_string_param ~param_name:"label" ~nullable:false () ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"non nullable string"
      ~c_type:"GtkButton" ~class_name:"Button" meth
  in
  Alcotest.(check bool)
    "Does not use nullable handling for non-nullable string" false
    (C_validation.handles_nullable_param func "label")

let test_nullable_return_value () =
  let meth =
    make_gir_method ~method_name:"get_parent"
      ~c_identifier:"gtk_widget_get_parent"
      ~return_type:(make_widget_type ~nullable:true ())
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"nullable return value"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
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
  let meth =
    make_gir_method ~method_name:"set_data" ~c_identifier:"gtk_widget_set_data"
      ~return_type:void_type
      ~parameters:
        [
          make_string_param ~param_name:"key" ~nullable:true ();
          make_widget_param ~param_name:"value" ~nullable:true ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"multiple nullable params"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Handles first nullable param" true
    (C_validation.handles_nullable_param func "key");
  Alcotest.(check bool)
    "Handles second nullable param" true
    (C_validation.handles_nullable_param func "value")

let test_nullable_param_count () =
  let meth =
    make_gir_method ~method_name:"set_title"
      ~c_identifier:"gtk_window_set_title" ~return_type:void_type
      ~parameters:[ make_string_param ~param_name:"title" ~nullable:true () ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"nullable param count"
      ~c_type:"GtkWindow" ~class_name:"Window" meth
  in
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
