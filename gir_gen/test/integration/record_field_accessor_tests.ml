(* Record Field Accessor Integration Tests
 *
 * End-to-end tests that spawn [gir_gen.exe] and verify the generated C stubs
 * and OCaml interface files for record field accessors.
 *)

open Helpers

(* ========================================================================= *)
(* Helpers *)
(* ========================================================================= *)

(* Write an override sexp to a temp file and return its path. *)
let write_override_file ~test_name content =
  let path = Printf.sprintf "/tmp/test_%s_overrides.sexp" test_name in
  let oc = open_out path in
  output_string oc content;
  close_out oc;
  path

(* Run gir_gen with an optional override file. *)
let run_gir_gen_with_override ?override_file gir_file output_dir =
  let tools_dir = get_tools_dir () in
  let override_arg =
    match override_file with
    | Some f -> Printf.sprintf " -o %s" f
    | None -> ""
  in
  let cmd =
    Printf.sprintf "%s/bin/gir_gen.exe generate%s %s %s" tools_dir override_arg
      gir_file output_dir
  in
  let result =
    run_command_with_output ~log_dir:(Some "/tmp/gir_gen_test_logs") cmd
  in
  if result.exit_code <> 0 then begin
    let stderr_lines = String.split_on_char '\n' result.stderr in
    let rec take n = function
      | [] -> []
      | _ when n = 0 -> []
      | x :: xs -> x :: take (n - 1) xs
    in
    let preview = String.concat "\n" (take 20 stderr_lines) in
    let log_info =
      match result.log_file with
      | Some p -> Printf.sprintf "\n\nFull log saved to: %s" p
      | None -> ""
    in
    Alcotest.fail
      (Printf.sprintf "gir_gen command failed (exit code %d)\n\nStderr:\n%s%s"
         result.exit_code preview log_info)
  end;
  result.exit_code

(* ========================================================================= *)
(* Test 1: simple int fields generate getter/setter/make *)
(* ========================================================================= *)

let test_simple_int_fields_generate_accessors () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Point" c:type="GtkPoint">
      <field name="x" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="y" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let test_name = "field_accessor_int" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit = run_gir_gen_with_override test_gir output_dir in
  (* C stub file for Point *)
  let c_file = stub_c_file output_dir "Point" in
  assert_true "Point C file exists" (file_exists c_file);
  let c_content = read_file c_file in
  assert_true "getter for x exists"
    (Helpers.string_contains c_content "ml_gtk_point_get_x");
  assert_true "setter for x exists"
    (Helpers.string_contains c_content "ml_gtk_point_set_x");
  assert_true "make constructor exists"
    (Helpers.string_contains c_content "ml_gtk_point_make");
  (* OCaml interface exists *)
  let mli = mli_file output_dir "point" in
  assert_true "point.mli exists" (file_exists mli)

(* ========================================================================= *)
(* Test 2: string field generates g_strdup and g_free in setter *)
(* ========================================================================= *)

let test_string_field_generates_strdup () =
  let gir_content =
    wrap_namespace
      {|
    <record name="LabelRecord" c:type="GtkLabelRecord">
      <field name="text" writable="1">
        <type name="utf8" c:type="const gchar*"/>
      </field>
    </record>
|}
  in
  let test_name = "field_accessor_string" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit = run_gir_gen_with_override test_gir output_dir in
  let c_file = stub_c_file output_dir "LabelRecord" in
  assert_true "LabelRecord C file exists" (file_exists c_file);
  let c_content = read_file c_file in
  (* String setter must free the old value and strdup the new one.
     We use string_contains here because g_strdup and g_free appear
     inside function bodies that are not individually modelled by C_parser. *)
  assert_true "setter uses g_strdup"
    (Helpers.string_contains c_content "g_strdup");
  assert_true "setter uses g_free" (Helpers.string_contains c_content "g_free")

(* ========================================================================= *)
(* Test 3: no_getter override suppresses getter, setter still present *)
(* ========================================================================= *)

let test_no_getter_override_suppresses_getter () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Point" c:type="GtkPoint">
      <field name="x" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="y" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let override_content =
    {|(overrides (library "Gtk") (record Point (field x (no_getter))))|}
  in
  let test_name = "field_accessor_no_getter" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  let override_file = write_override_file ~test_name override_content in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit =
    run_gir_gen_with_override ~override_file test_gir output_dir
  in
  let c_file = stub_c_file output_dir "Point" in
  assert_true "Point C file exists" (file_exists c_file);
  let c_content = read_file c_file in
  (* Getter for x must be absent *)
  assert_true "getter for x is suppressed by no_getter override"
    (not (Helpers.string_contains c_content "ml_gtk_point_get_x"));
  (* Setter for x must still be present *)
  assert_true "setter for x is still present"
    (Helpers.string_contains c_content "ml_gtk_point_set_x");
  (* Getter and setter for y (no override) must be present *)
  assert_true "getter for y is present"
    (Helpers.string_contains c_content "ml_gtk_point_get_y");
  assert_true "setter for y is present"
    (Helpers.string_contains c_content "ml_gtk_point_set_y")

(* ========================================================================= *)
(* Test 4: no_fields override suppresses all field accessors *)
(* ========================================================================= *)

let test_no_fields_override_suppresses_all_accessors () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Point" c:type="GtkPoint">
      <field name="x" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="y" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let override_content =
    {|(overrides (library "Gtk") (record Point (no_fields)))|}
  in
  let test_name = "field_accessor_no_fields" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  let override_file = write_override_file ~test_name override_content in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit =
    run_gir_gen_with_override ~override_file test_gir output_dir
  in
  let c_file = stub_c_file output_dir "Point" in
  assert_true "Point C file exists" (file_exists c_file);
  let c_content = read_file c_file in
  assert_true "no getter for x" (not (Helpers.string_contains c_content "ml_gtk_point_get_x"));
  assert_true "no setter for x" (not (Helpers.string_contains c_content "ml_gtk_point_set_x"));
  assert_true "no getter for y" (not (Helpers.string_contains c_content "ml_gtk_point_get_y"));
  assert_true "no setter for y" (not (Helpers.string_contains c_content "ml_gtk_point_set_y"));
  assert_true "no make constructor"
    (not (Helpers.string_contains c_content "ml_gtk_point_make"))

(* ========================================================================= *)
(* Test 5: make constructor arity matches number of writable fields *)
(* ========================================================================= *)

let test_make_constructor_arity () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Color" c:type="GtkColor">
      <field name="red" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="green" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="blue" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let test_name = "field_accessor_make_arity" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit = run_gir_gen_with_override test_gir output_dir in
  let c_file = stub_c_file output_dir "Color" in
  assert_true "Color C file exists" (file_exists c_file);
  let c_content = read_file c_file in
  (* All three parameter names must appear in the make stub.
     We use string_contains because the C_parser doesn't model struct make
     constructors; the multi-param form is validated at the generation unit level. *)
  assert_true "make contains v_red"
    (Helpers.string_contains c_content "v_red");
  assert_true "make contains v_green"
    (Helpers.string_contains c_content "v_green");
  assert_true "make contains v_blue"
    (Helpers.string_contains c_content "v_blue")

(* ========================================================================= *)
(* Test 6: L2 class has getter/setter methods in generated .ml file *)
(* ========================================================================= *)

let test_l2_class_has_getter_setter_methods () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Point" c:type="GtkPoint">
      <field name="x" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="y" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let test_name = "l2_class_getter_setter" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit = run_gir_gen_with_override test_gir output_dir in
  let g_ml = g_wrapper_file output_dir "Point" in
  assert_true "gPoint.ml exists" (file_exists g_ml);
  let content = read_file g_ml in
  assert_true "gPoint.ml contains 'method get_x'"
    (Helpers.string_contains content "method get_x");
  assert_true "gPoint.ml contains 'method set_x'"
    (Helpers.string_contains content "method set_x");
  assert_true "gPoint.ml contains 'method get_y'"
    (Helpers.string_contains content "method get_y");
  assert_true "gPoint.ml contains 'method set_y'"
    (Helpers.string_contains content "method set_y");
  assert_true "gPoint.ml contains 'method as_point'"
    (Helpers.string_contains content "method as_point");
  assert_true "gPoint.ml contains 'let make'"
    (Helpers.string_contains content "let make")

(* ========================================================================= *)
(* Test 7: no_getter override suppresses L2 getter method *)
(* ========================================================================= *)

let test_l2_no_getter_suppresses_method () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Point" c:type="GtkPoint">
      <field name="x" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="y" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let override_content =
    {|(overrides (library "Gtk") (record Point (field x (no_getter))))|}
  in
  let test_name = "l2_no_getter_method" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  let override_file = write_override_file ~test_name override_content in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit =
    run_gir_gen_with_override ~override_file test_gir output_dir
  in
  let g_ml = g_wrapper_file output_dir "Point" in
  assert_true "gPoint.ml exists" (file_exists g_ml);
  let content = read_file g_ml in
  assert_true "no_getter: 'method get_x' is absent from L2 class"
    (not (Helpers.string_contains content "method get_x"));
  assert_true "no_getter: 'method set_x' is still present"
    (Helpers.string_contains content "method set_x");
  assert_true "no_getter: 'method get_y' is unaffected"
    (Helpers.string_contains content "method get_y")

(* ========================================================================= *)
(* Test 8: L2 class type signature in generated .mli file *)
(* ========================================================================= *)

let test_l2_class_type_signature () =
  let gir_content =
    wrap_namespace
      {|
    <record name="Point" c:type="GtkPoint">
      <field name="x" writable="1"><type name="gint" c:type="gint"/></field>
      <field name="y" writable="1"><type name="gint" c:type="gint"/></field>
    </record>
|}
  in
  let test_name = "l2_class_type_sig" in
  let test_gir = Printf.sprintf "/tmp/test_%s.gir" test_name in
  let output_dir = Printf.sprintf "/tmp/test_%s_output" test_name in
  create_gir_file test_gir gir_content;
  ensure_output_dir output_dir;
  let _exit = run_gir_gen_with_override test_gir output_dir in
  let g_mli =
    Filename.concat (Helpers.generated_dir output_dir) "gPoint.mli"
  in
  assert_true "gPoint.mli exists" (file_exists g_mli);
  let content = read_file g_mli in
  assert_true "gPoint.mli contains 'method get_x : int'"
    (Helpers.string_contains content "method get_x : int");
  assert_true "gPoint.mli contains 'method set_x : int -> unit'"
    (Helpers.string_contains content "method set_x : int -> unit");
  assert_true "gPoint.mli contains 'val make' with correct arity"
    (Helpers.string_contains content "val make : int -> int -> point_t")

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "simple int fields generate getter/setter/make" `Quick
      test_simple_int_fields_generate_accessors;
    Alcotest.test_case "string field generates g_strdup/g_free" `Quick
      test_string_field_generates_strdup;
    Alcotest.test_case "no_getter override suppresses getter" `Quick
      test_no_getter_override_suppresses_getter;
    Alcotest.test_case "no_fields override suppresses all accessors" `Quick
      test_no_fields_override_suppresses_all_accessors;
    Alcotest.test_case "make constructor arity matches writable fields" `Quick
      test_make_constructor_arity;
    Alcotest.test_case "L2 class has getter/setter methods" `Quick
      test_l2_class_has_getter_setter_methods;
    Alcotest.test_case "L2 no_getter suppresses method in class" `Quick
      test_l2_no_getter_suppresses_method;
    Alcotest.test_case "L2 class type signature in .mli" `Quick
      test_l2_class_type_signature;
  ]
