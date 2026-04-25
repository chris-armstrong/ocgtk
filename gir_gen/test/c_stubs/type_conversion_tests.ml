(* Type Conversion Tests *)

open Type_factory

(* ========================================================================= *)
(* Basic Type Conversion Tests *)
(* ========================================================================= *)

let test_gboolean_conversion () =
  let meth =
    make_gir_method ~method_name:"get_visible"
      ~c_identifier:"gtk_widget_get_visible" ~return_type:gboolean_type ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"gboolean conversion"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Calls gtk_widget_get_visible" true
    (C_validation.calls_c_function func "gtk_widget_get_visible")

let test_gint_conversion () =
  let meth =
    make_gir_method ~method_name:"get_width"
      ~c_identifier:"gtk_widget_get_width" ~return_type:gint_type ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"gint conversion"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Has return statement" true
    (C_ast.has_return_stmt func.C_ast.body)

let test_gdouble_conversion () =
  let meth =
    make_gir_method ~method_name:"get_opacity"
      ~c_identifier:"gtk_widget_get_opacity" ~return_type:gdouble_type ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"gdouble conversion"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Calls gtk_widget_get_opacity" true
    (C_validation.calls_c_function func "gtk_widget_get_opacity")

let test_utf8_string_conversion () =
  let meth =
    make_gir_method ~method_name:"get_name" ~c_identifier:"gtk_widget_get_name"
      ~return_type:utf8_type ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"utf8 string conversion"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Has return statement for string" true
    (C_ast.has_return_stmt func.C_ast.body)

let test_utf8_string_parameter () =
  let meth =
    make_gir_method ~method_name:"set_name" ~c_identifier:"gtk_widget_set_name"
      ~return_type:void_type
      ~parameters:[ make_string_param ~param_name:"name" () ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"utf8 string parameter"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check int) "Has 2 parameters" 2 (C_ast.get_param_count func)

let test_object_type_conversion () =
  let meth =
    make_gir_method ~method_name:"get_parent"
      ~c_identifier:"gtk_widget_get_parent" ~return_type:(make_widget_type ())
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"object type conversion"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Uses Val_GtkWidget conversion" true
    (C_validation.validates_gtk_constructor func "GtkWidget")

let test_enum_type_conversion () =
  let text_direction_type =
    make_gir_type ~name:"TextDirection" ~c_type:"GtkTextDirection" ()
  in
  let meth =
    make_gir_method ~method_name:"get_direction"
      ~c_identifier:"gtk_widget_get_direction" ~return_type:text_direction_type
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"enum type conversion"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check bool)
    "Calls C function for enum" true
    (C_validation.calls_c_function func "gtk_widget_get_direction")

let test_gboolean_parameter () =
  let meth =
    make_gir_method ~method_name:"set_visible"
      ~c_identifier:"gtk_widget_set_visible" ~return_type:void_type
      ~parameters:[ make_bool_param ~param_name:"visible" () ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"gboolean parameter"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check int) "Has 2 parameters" 2 (C_ast.get_param_count func)

let test_multiple_type_conversions () =
  let meth =
    make_gir_method ~method_name:"set_size_request"
      ~c_identifier:"gtk_widget_set_size_request" ~return_type:void_type
      ~parameters:
        [
          make_int_param ~param_name:"width" ();
          make_int_param ~param_name:"height" ();
        ]
      ()
  in
  let func =
    Helpers.generate_and_find_c_method ~log_label:"multiple type conversions"
      ~c_type:"GtkWidget" ~class_name:"Widget" meth
  in
  Alcotest.(check int) "Has 3 parameters" 3 (C_ast.get_param_count func);
  Alcotest.(check bool)
    "Calls C function" true
    (C_validation.calls_c_function func "gtk_widget_set_size_request")

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "gboolean return conversion" `Quick
      test_gboolean_conversion;
    Alcotest.test_case "gint return conversion" `Quick test_gint_conversion;
    Alcotest.test_case "gdouble return conversion" `Quick
      test_gdouble_conversion;
    Alcotest.test_case "utf8 string return conversion" `Quick
      test_utf8_string_conversion;
    Alcotest.test_case "utf8 string parameter conversion" `Quick
      test_utf8_string_parameter;
    Alcotest.test_case "Object type conversion" `Quick
      test_object_type_conversion;
    Alcotest.test_case "Enum type conversion" `Quick test_enum_type_conversion;
    Alcotest.test_case "gboolean parameter conversion" `Quick
      test_gboolean_parameter;
    Alcotest.test_case "Multiple type conversions" `Quick
      test_multiple_type_conversions;
  ]
