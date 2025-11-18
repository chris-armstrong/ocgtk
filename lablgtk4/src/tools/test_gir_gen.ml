(* Test suite for GIR code generator
 *
 * Tests the parsing and code generation functionality of gir_gen.ml
 *)

open Printf

(* ========================================================================= *)
(* Test Helpers *)
(* ========================================================================= *)

let test_count = ref 0
let pass_count = ref 0
let fail_count = ref 0

let test name f =
  incr test_count;
  printf "Test %d: %s... " !test_count name;
  flush stdout;
  try
    f ();
    incr pass_count;
    printf "✓ PASS\n";
    true
  with
  | Failure msg ->
    incr fail_count;
    printf "✗ FAIL: %s\n" msg;
    false
  | e ->
    incr fail_count;
    printf "✗ ERROR: %s\n" (Printexc.to_string e);
    false

let assert_true msg cond =
  if not cond then failwith msg

let string_contains s sub =
  try
    ignore (Str.search_forward (Str.regexp_string sub) s 0);
    true
  with Not_found -> false

let assert_contains msg haystack needle =
  if not (string_contains haystack needle) then
    failwith (sprintf "%s: expected to find '%s' in output" msg needle)

let file_exists path =
  try
    let _ = Unix.stat path in
    true
  with Unix.Unix_error _ -> false

let read_file filename =
  let ic = open_in filename in
  let len = in_channel_length ic in
  let buf = Bytes.create len in
  really_input ic buf 0 len;
  close_in ic;
  Bytes.to_string buf

(* ========================================================================= *)
(* Create Test GIR File *)
(* ========================================================================= *)

let create_test_gir_file filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <class name="EventControllerKey"
           c:type="GtkEventControllerKey"
           parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
      <method name="forward" c:identifier="gtk_event_controller_key_forward">
        <return-value><type name="gboolean" c:type="gboolean"/></return-value>
        <parameters>
          <parameter name="widget"><type name="Widget" c:type="GtkWidget*"/></parameter>
        </parameters>
      </method>
      <method name="get_group" c:identifier="gtk_event_controller_key_get_group">
        <return-value><type name="guint" c:type="guint"/></return-value>
      </method>
    </class>
  </namespace>
</repository>
|};
  close_out oc

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_gir_parsing () =
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_test_gir_file test_gir;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m controllers %s %s 2>&1"
    tools_dir test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Generator should exit successfully" (exit_code = 0);

  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  assert_true "C file should be created" (file_exists c_file);

  let content = read_file c_file in
  assert_contains "C file should have header" content "GENERATED CODE";
  assert_contains "C file should have constructor" content "ml_gtk_event_controller_key_new"

let test_c_code_generation () =
  printf "Verifying generated C code structure\n";
  let test_gir = "/tmp/test_gir_gen.gir" in
  let output_dir = "/tmp/test_gir_output" in

  create_test_gir_file test_gir;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe %s %s > /dev/null 2>&1"
    tools_dir test_gir output_dir in
  let _ = Sys.command cmd in

  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  if file_exists c_file then begin
    let content = read_file c_file in
    assert_contains "Should use CAMLparam" content "CAMLparam";
    assert_contains "Should use CAMLreturn" content "CAMLreturn";
    assert_contains "Should define type converter macros" content
      "GtkEventController_val";
  end else
    failwith "C file not generated"

(* Test widget generation with filter *)
let create_test_widget_gir filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <class name="Button" c:type="GtkButton" parent="Widget">
      <constructor name="new" c:identifier="gtk_button_new"/>
      <method name="set_label" c:identifier="gtk_button_set_label">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="label"><type name="utf8" c:type="const gchar*"/></parameter>
        </parameters>
      </method>
      <method name="get_label" c:identifier="gtk_button_get_label">
        <return-value><type name="utf8" c:type="const gchar*"/></return-value>
      </method>
    </class>
    <class name="Label" c:type="GtkLabel" parent="Widget">
      <constructor name="new" c:identifier="gtk_label_new"/>
      <method name="set_text" c:identifier="gtk_label_set_text">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="str"><type name="utf8" c:type="const gchar*"/></parameter>
        </parameters>
      </method>
    </class>
  </namespace>
</repository>
|};
  close_out oc

let create_test_filter_file filename =
  let oc = open_out filename in
  output_string oc "# Test filter\nButton\nLabel\n";
  close_out oc

let test_widget_generation () =
  let test_gir = "/tmp/test_widget_gen.gir" in
  let test_filter = "/tmp/test_widget_filter.conf" in
  let output_dir = "/tmp/test_widget_output" in

  create_test_widget_gir test_gir;
  create_test_filter_file test_filter;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m widgets -f %s %s %s > /dev/null 2>&1"
    tools_dir test_filter test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Widget generator should exit successfully" (exit_code = 0);

  let button_file = Filename.concat output_dir "button.mli" in
  assert_true "Button.mli should be created" (file_exists button_file);

  let label_file = Filename.concat output_dir "label.mli" in
  assert_true "Label.mli should be created" (file_exists label_file);

  let button_content = read_file button_file in
  assert_contains "Button should have constructor" button_content "external new_";
  assert_contains "Button should have set_label" button_content "set_label"

let test_help_output () =
  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe --help 2>&1" tools_dir in
  let ic = Unix.open_process_in cmd in
  let output = Buffer.create 1024 in
  (try
    while true do
      Buffer.add_string output (input_line ic);
      Buffer.add_char output '\n'
    done
  with End_of_file -> ());
  let _ = Unix.close_process_in ic in
  let help_text = Buffer.contents output in
  assert_contains "Help should mention mode" help_text "mode";
  assert_contains "Help should mention filter" help_text "filter";
  assert_contains "Help should show examples" help_text "EXAMPLES"

(* Test property generation *)
let create_test_property_gir filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <class name="TestWidget" c:type="GtkTestWidget" parent="Widget">
      <constructor name="new" c:identifier="gtk_test_widget_new"/>
      <property name="read-only-prop" readable="1">
        <type name="utf8" c:type="const gchar*"/>
      </property>
      <property name="read-write-prop" readable="1" writable="1">
        <type name="gboolean" c:type="gboolean"/>
      </property>
      <property name="construct-only-prop" readable="1" writable="1" construct-only="1">
        <type name="gint" c:type="gint"/>
      </property>
    </class>
  </namespace>
</repository>
|};
  close_out oc

let test_property_generation () =
  let test_gir = "/tmp/test_property_gen.gir" in
  let test_filter = "/tmp/test_property_filter.conf" in
  let output_dir = "/tmp/test_property_output" in

  create_test_property_gir test_gir;
  let fc = open_out test_filter in
  output_string fc "TestWidget\n";
  close_out fc;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m widgets -f %s %s %s > /dev/null 2>&1"
    tools_dir test_filter test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Property generator should exit successfully" (exit_code = 0);

  let widget_file = Filename.concat output_dir "test_widget.mli" in
  assert_true "TestWidget.mli should be created" (file_exists widget_file);

  let content = read_file widget_file in
  (* Check for read-only property getter *)
  assert_contains "Should generate getter for read-only property" content "get_read_only_prop";
  (* Should NOT have setter for read-only *)
  if string_contains content "set_read_only_prop" then
    failwith "Should not generate setter for read-only property";

  (* Check for read-write property *)
  assert_contains "Should generate getter for read-write property" content "get_read_write_prop";
  assert_contains "Should generate setter for read-write property" content "set_read_write_prop";

  (* Check for construct-only property *)
  assert_contains "Should generate getter for construct-only property" content "get_construct_only_prop";
  (* Should NOT have setter for construct-only *)
  if string_contains content "set_construct_only_prop" then
    failwith "Should not generate setter for construct-only property";

  (* Verify type annotations *)
  assert_contains "Bool property should have bool type" content "t -> bool";
  assert_contains "Int property should have int type" content "t -> int"

(* Phase 5.2: Test C property code generation *)
let test_c_property_generation () =
  let test_gir = "/tmp/test_c_property_gen.gir" in
  let test_filter = "/tmp/test_c_property_filter.conf" in
  let output_dir = "/tmp/test_c_property_output" in

  create_test_property_gir test_gir;
  let fc = open_out test_filter in
  output_string fc "TestWidget\n";
  close_out fc;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m widgets -f %s %s %s > /dev/null 2>&1"
    tools_dir test_filter test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "C property generator should exit successfully" (exit_code = 0);

  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  assert_true "C file should be created" (file_exists c_file);

  let c_content = read_file c_file in

  (* Check for property getter C code *)
  assert_contains "C getter for read-only property" c_content "ml_gtk_test_widget_get_read_only_prop";
  assert_contains "C getter should use g_object_get" c_content "g_object_get";

  (* Check for property setter C code *)
  assert_contains "C setter for read-write property" c_content "ml_gtk_test_widget_set_read_write_prop";
  assert_contains "C setter should use g_object_set" c_content "g_object_set";

  (* Verify CAMLparam usage *)
  assert_contains "C code should use CAMLparam" c_content "CAMLparam";
  assert_contains "C code should use CAMLreturn" c_content "CAMLreturn";

  (* Construct-only property should have getter but not setter *)
  assert_contains "C getter for construct-only property" c_content "ml_gtk_test_widget_get_construct_only_prop";
  if string_contains c_content "ml_gtk_test_widget_set_construct_only_prop" then
    failwith "Should not generate C setter for construct-only property"

(* Phase 5.2: Test that ALL methods are generated (no 5-method limit) *)
let create_test_many_methods_gir filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <class name="ManyMethods" c:type="GtkManyMethods" parent="Widget">
      <constructor name="new" c:identifier="gtk_many_methods_new"/>
      <method name="method1" c:identifier="gtk_many_methods_method1">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method2" c:identifier="gtk_many_methods_method2">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method3" c:identifier="gtk_many_methods_method3">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method4" c:identifier="gtk_many_methods_method4">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method5" c:identifier="gtk_many_methods_method5">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method6" c:identifier="gtk_many_methods_method6">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method7" c:identifier="gtk_many_methods_method7">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
      <method name="method8" c:identifier="gtk_many_methods_method8">
        <return-value><type name="none" c:type="void"/></return-value>
      </method>
    </class>
  </namespace>
</repository>
|};
  close_out oc

let test_all_methods_generated () =
  let test_gir = "/tmp/test_many_methods.gir" in
  let test_filter = "/tmp/test_many_methods_filter.conf" in
  let output_dir = "/tmp/test_many_methods_output" in

  create_test_many_methods_gir test_gir;
  let fc = open_out test_filter in
  output_string fc "ManyMethods\n";
  close_out fc;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m widgets -f %s %s %s > /dev/null 2>&1"
    tools_dir test_filter test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Many methods generator should exit successfully" (exit_code = 0);

  let mli_file = Filename.concat output_dir "many_methods.mli" in
  let content = read_file mli_file in

  (* Check that all 8 methods are generated (not just first 5) *)
  assert_contains "Method 1 should be generated" content "method1";
  assert_contains "Method 5 should be generated" content "method5";
  assert_contains "Method 6 should be generated (beyond old 5-method limit)" content "method6";
  assert_contains "Method 7 should be generated" content "method7";
  assert_contains "Method 8 should be generated" content "method8"

(* Test enum generation *)
let create_test_enum_gir filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <enumeration name="WrapMode" c:type="GtkWrapMode">
      <member name="none" value="0" c:identifier="GTK_WRAP_NONE"/>
      <member name="char" value="1" c:identifier="GTK_WRAP_CHAR"/>
      <member name="word" value="2" c:identifier="GTK_WRAP_WORD"/>
      <member name="word_char" value="3" c:identifier="GTK_WRAP_WORD_CHAR"/>
    </enumeration>
    <class name="EventControllerKey" c:type="GtkEventControllerKey" parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
    </class>
  </namespace>
</repository>
|};
  close_out oc

let test_enum_generation () =
  let test_gir = "/tmp/test_enum_gen.gir" in
  let output_dir = "/tmp/test_enum_output" in

  create_test_enum_gir test_gir;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m controllers %s %s > /dev/null 2>&1"
    tools_dir test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Enum generator should exit successfully" (exit_code = 0);

  let enum_file = Filename.concat output_dir "gtk_enums.mli" in
  assert_true "gtk_enums.mli should be created" (file_exists enum_file);

  let enum_content = read_file enum_file in
  (* Check enum type definition *)
  assert_contains "Enum type should be defined" enum_content "type wrapmode = [";
  assert_contains "Should have NONE variant" enum_content "`NONE";
  assert_contains "Should have CHAR variant" enum_content "`CHAR";
  assert_contains "Should have WORD variant" enum_content "`WORD";
  assert_contains "Should have WORD_CHAR variant" enum_content "`WORD_CHAR";

  (* Check C converter generation *)
  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  let c_content = read_file c_file in
  assert_contains "C to OCaml converter" c_content "Val_WrapMode";
  assert_contains "OCaml to C converter" c_content "WrapMode_val";
  assert_contains "C converter should use switch" c_content "switch (val)";
  assert_contains "C converter should check GTK constants" c_content "GTK_WRAP_NONE"

(* Test bitfield generation *)
let create_test_bitfield_gir filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <bitfield name="StateFlags" c:type="GtkStateFlags">
      <member name="normal" value="0" c:identifier="GTK_STATE_FLAG_NORMAL"/>
      <member name="active" value="1" c:identifier="GTK_STATE_FLAG_ACTIVE"/>
      <member name="prelight" value="2" c:identifier="GTK_STATE_FLAG_PRELIGHT"/>
      <member name="selected" value="4" c:identifier="GTK_STATE_FLAG_SELECTED"/>
    </bitfield>
    <class name="EventControllerKey" c:type="GtkEventControllerKey" parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
    </class>
  </namespace>
</repository>
|};
  close_out oc

let test_bitfield_generation () =
  let test_gir = "/tmp/test_bitfield_gen.gir" in
  let output_dir = "/tmp/test_bitfield_output" in

  create_test_bitfield_gir test_gir;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m controllers %s %s > /dev/null 2>&1"
    tools_dir test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Bitfield generator should exit successfully" (exit_code = 0);

  let enum_file = Filename.concat output_dir "gtk_enums.mli" in
  assert_true "gtk_enums.mli should be created for bitfields" (file_exists enum_file);

  let enum_content = read_file enum_file in
  (* Check bitfield type definition *)
  assert_contains "Flag variant type should be defined" enum_content "type stateflags_flag = [";
  assert_contains "Should have NORMAL flag" enum_content "`NORMAL";
  assert_contains "Should have ACTIVE flag" enum_content "`ACTIVE";
  assert_contains "Should have PRELIGHT flag" enum_content "`PRELIGHT";
  assert_contains "Should have SELECTED flag" enum_content "`SELECTED";
  assert_contains "Bitfield list type should be defined" enum_content "type stateflags = stateflags_flag list";

  (* Check C converter generation *)
  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  let c_content = read_file c_file in
  assert_contains "C to OCaml flag converter" c_content "Val_StateFlags";
  assert_contains "OCaml to C flag converter" c_content "StateFlags_val";
  assert_contains "Converter should check flags with &" c_content "flags & GTK_STATE_FLAG_";
  assert_contains "Converter should OR flags" c_content "result |= GTK_STATE_FLAG_";
  assert_contains "Converter should build list" c_content "Val_emptylist";
  assert_contains "Converter should allocate cons cells" c_content "caml_alloc(2, 0)"

(* Test nullable parameter generation *)
let create_test_nullable_gir filename =
  let oc = open_out filename in
  output_string oc {|<?xml version="1.0"?>
<repository version="1.2"
            xmlns="http://www.gtk.org/introspection/core/1.0"
            xmlns:c="http://www.gtk.org/introspection/c/1.0">
  <namespace name="Gtk">
    <class name="TestWidget" c:type="GtkTestWidget" parent="Widget">
      <constructor name="new" c:identifier="gtk_test_widget_new">
        <parameters>
          <parameter name="label" nullable="1">
            <type name="utf8" c:type="const gchar*"/>
          </parameter>
        </parameters>
      </constructor>
      <method name="set_group" c:identifier="gtk_test_widget_set_group">
        <return-value><type name="none" c:type="void"/></return-value>
        <parameters>
          <parameter name="group" nullable="1">
            <type name="Widget" c:type="GtkWidget*"/>
          </parameter>
        </parameters>
      </method>
    </class>
  </namespace>
</repository>
|};
  close_out oc

let test_nullable_parameters () =
  let test_gir = "/tmp/test_nullable_gen.gir" in
  let test_filter = "/tmp/test_nullable_filter.conf" in
  let output_dir = "/tmp/test_nullable_output" in

  create_test_nullable_gir test_gir;
  let fc = open_out test_filter in
  output_string fc "TestWidget\n";
  close_out fc;
  (try Unix.mkdir output_dir 0o755 with Unix.Unix_error _ -> ());

  let tools_dir = Filename.dirname Sys.argv.(0) in
  let cmd = sprintf "%s/gir_gen.exe -m widgets -f %s %s %s > /dev/null 2>&1"
    tools_dir test_filter test_gir output_dir in

  let exit_code = Sys.command cmd in
  assert_true "Nullable generator should exit successfully" (exit_code = 0);

  let mli_file = Filename.concat output_dir "test_widget.mli" in
  let content = read_file mli_file in

  (* Check OCaml interface uses option types *)
  assert_contains "Constructor should have string option parameter" content "string option";
  assert_contains "Method should have Widget option parameter" content "Gtk.Widget.t option";

  (* Check C code uses option macros *)
  let c_file = Filename.concat output_dir "ml_event_controllers_gen.c" in
  let c_content = read_file c_file in
  assert_contains "C should check Is_some" c_content "Is_some";
  assert_contains "C should extract Some_val" c_content "Some_val";
  assert_contains "C should handle NULL" c_content "NULL"

(* ========================================================================= *)
(* Main Test Runner *)
(* ========================================================================= *)

let () =
  printf "\n";
  printf "====================================\n";
  printf "GIR Generator Test Suite (Phase 5)\n";
  printf "====================================\n\n";

  ignore (test "GIR file parsing" test_gir_parsing);
  ignore (test "C code generation" test_c_code_generation);
  ignore (test "Widget generation" test_widget_generation);
  ignore (test "Property generation" test_property_generation);
  ignore (test "C property generation (Phase 5.2)" test_c_property_generation);
  ignore (test "All methods generated (Phase 5.2)" test_all_methods_generated);
  ignore (test "Enum generation (Phase 5.3)" test_enum_generation);
  ignore (test "Bitfield generation (Phase 5.3)" test_bitfield_generation);
  ignore (test "Nullable parameters (Phase 5.3)" test_nullable_parameters);
  ignore (test "Help output" test_help_output);

  printf "\n====================================\n";
  printf "Test Summary\n";
  printf "====================================\n";
  printf "Total:  %d tests\n" !test_count;
  printf "Passed: %d tests\n" !pass_count;
  printf "Failed: %d tests\n" !fail_count;

  if !fail_count = 0 then begin
    printf "\n✓ All tests passed!\n";
    exit 0
  end else begin
    printf "\n✗ Some tests failed\n";
    exit 1
  end
