(* Enum and bitfield generation tests *)

open Printf
open Helpers

let enum_gir = wrap_namespace {|
    <enumeration name="WrapMode" c:type="GtkWrapMode">
      <member name="none" value="0" c:identifier="GTK_WRAP_NONE"/>
      <member name="char" value="1" c:identifier="GTK_WRAP_CHAR"/>
      <member name="word" value="2" c:identifier="GTK_WRAP_WORD"/>
      <member name="word_char" value="3" c:identifier="GTK_WRAP_WORD_CHAR"/>
    </enumeration>
    <class name="EventControllerKey" c:type="GtkEventControllerKey" parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
    </class>
|}

let bitfield_gir = wrap_namespace {|
    <bitfield name="StateFlags" c:type="GtkStateFlags">
      <member name="normal" value="0" c:identifier="GTK_STATE_FLAG_NORMAL"/>
      <member name="active" value="1" c:identifier="GTK_STATE_FLAG_ACTIVE"/>
      <member name="prelight" value="2" c:identifier="GTK_STATE_FLAG_PRELIGHT"/>
      <member name="selected" value="4" c:identifier="GTK_STATE_FLAG_SELECTED"/>
    </bitfield>
    <class name="EventControllerKey" c:type="GtkEventControllerKey" parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
    </class>
|}

let multiple_enums_gir = wrap_namespace {|
    <enumeration name="Align" c:type="GtkAlign">
      <member name="fill" value="0" c:identifier="GTK_ALIGN_FILL"/>
      <member name="start" value="1" c:identifier="GTK_ALIGN_START"/>
      <member name="end" value="2" c:identifier="GTK_ALIGN_END"/>
    </enumeration>
    <enumeration name="Orientation" c:type="GtkOrientation">
      <member name="horizontal" value="0" c:identifier="GTK_ORIENTATION_HORIZONTAL"/>
      <member name="vertical" value="1" c:identifier="GTK_ORIENTATION_VERTICAL"/>
    </enumeration>
    <bitfield name="EventMask" c:type="GtkEventMask">
      <member name="button_press" value="1" c:identifier="GTK_EVENT_MASK_BUTTON_PRESS"/>
      <member name="button_release" value="2" c:identifier="GTK_EVENT_MASK_BUTTON_RELEASE"/>
    </bitfield>
    <class name="EventControllerKey" c:type="GtkEventControllerKey" parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
    </class>
|}

let single_enum_gir = wrap_namespace {|
    <enumeration name="SingleValue" c:type="GtkSingleValue">
      <member name="only" value="0" c:identifier="GTK_SINGLE_VALUE_ONLY"/>
    </enumeration>
    <class name="EventControllerKey" c:type="GtkEventControllerKey" parent="EventController">
      <constructor name="new" c:identifier="gtk_event_controller_key_new"/>
    </class>
|}

let test_enum_generation () =
  let test_gir = "/tmp/test_enum_gen.gir" in
  let output_dir = "/tmp/test_enum_output" in

  create_gir_file test_gir enum_gir;
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen test_gir output_dir in
  assert_true "Enum generator should exit successfully" (exit_code = 0);

  let enums = enum_file output_dir in
  assert_true "gtk_enums.mli should be created" (file_exists enums);

  let enum_content = read_file enums in
  assert_contains "Enum type should be defined" enum_content "type wrapmode = [";
  assert_contains "Should have NONE variant" enum_content "`NONE";
  assert_contains "Should have CHAR variant" enum_content "`CHAR";
  assert_contains "Should have WORD variant" enum_content "`WORD";
  assert_contains "Should have WORD_CHAR variant" enum_content "`WORD_CHAR";

  let c_file = enum_c_file output_dir in
  let c_content = read_file c_file in
  assert_contains "C to OCaml converter" c_content "Val_GtkWrapMode";
  assert_contains "OCaml to C converter" c_content "GtkWrapMode_val";
  assert_contains "C converter should use switch" c_content "switch (val)";
  assert_contains "C converter should check GTK constants" c_content
    "GTK_WRAP_NONE"

let test_bitfield_generation () =
  let test_gir = "/tmp/test_bitfield_gen.gir" in
  let output_dir = "/tmp/test_bitfield_output" in

  create_gir_file test_gir bitfield_gir;
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen test_gir output_dir in
  assert_true "Bitfield generator should exit successfully" (exit_code = 0);

  let enums = enum_file output_dir in
  assert_true "gtk_enums.mli should be created for bitfields"
    (file_exists enums);

  let enum_content = read_file enums in
  assert_contains "Flag variant type should be defined" enum_content
    "type stateflags_flag = [";
  assert_contains "Should have NORMAL flag" enum_content "`NORMAL";
  assert_contains "Should have ACTIVE flag" enum_content "`ACTIVE";
  assert_contains "Should have PRELIGHT flag" enum_content "`PRELIGHT";
  assert_contains "Should have SELECTED flag" enum_content "`SELECTED";
  assert_contains "Bitfield list type should be defined" enum_content
    "type stateflags = stateflags_flag list";

  let c_file = enum_c_file output_dir in
  let c_content = read_file c_file in
  assert_contains "C to OCaml flag converter" c_content "Val_GtkStateFlags";
  assert_contains "OCaml to C flag converter" c_content "GtkStateFlags_val";
  assert_contains "Converter should check flags with &" c_content
    "flags & GTK_STATE_FLAG_";
  assert_contains "Converter should OR flags" c_content
    "result |= GTK_STATE_FLAG_";
  assert_contains "Converter should build list" c_content "Val_emptylist";
  assert_contains "Converter should allocate cons cells" c_content
    "caml_alloc(2, 0)"

let test_multiple_enums () =
  let test_gir = "/tmp/test_multiple_enums.gir" in
  let output_dir = "/tmp/test_multiple_enums_output" in

  create_gir_file test_gir multiple_enums_gir;
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen test_gir output_dir in
  assert_true "Multiple enums generator should exit successfully" (exit_code = 0);

  let enums = enum_file output_dir in
  let content = read_file enums in

  assert_contains "Should define Align enum" content "type align = [";
  assert_contains "Should define Orientation enum" content
    "type orientation = [";
  assert_contains "Should define EventMask bitfield" content
    "type eventmask_flag = [";
  assert_contains "Should define EventMask list type" content
    "type eventmask = eventmask_flag list"

let test_single_value_enum () =
  let test_gir = "/tmp/test_single_enum.gir" in
  let output_dir = "/tmp/test_single_enum_output" in

  create_gir_file test_gir single_enum_gir;
  ensure_output_dir output_dir;

  let exit_code = run_gir_gen test_gir output_dir in
  assert_true "Single value enum should be generated" (exit_code = 0);

  let enums = enum_file output_dir in
  let content = read_file enums in

  assert_contains "Should define single value enum" content
    "type singlevalue = [";
  assert_contains "Should have ONLY variant" content "`ONLY"

let test_enum_naming_conventions () =
  let test_gir = "/tmp/test_enum_naming.gir" in
  let output_dir = "/tmp/test_enum_naming_output" in

  create_gir_file test_gir multiple_enums_gir;
  ensure_output_dir output_dir;

  let _ = run_gir_gen test_gir output_dir in

  let enums = enum_file output_dir in
  let content = read_file enums in

  assert_contains "Enum type should be lowercase" content "type align";
  assert_contains "Enum type should be lowercase" content "type orientation";

  assert_contains "Bitfield flag type should have _flag suffix" content
    "type eventmask_flag";

  assert_contains "Variants should be uppercase" content "`FILL";
  assert_contains "Variants should be uppercase" content "`HORIZONTAL"

let run_tests () =
  printf "\n--- Enum and Bitfield Tests ---\n";
  ignore (test "Enum generation (Phase 5.3)" test_enum_generation);
  ignore (test "Bitfield generation (Phase 5.3)" test_bitfield_generation);
  ignore (test "Multiple enums in one file" test_multiple_enums);
  ignore (test "Single value enum" test_single_value_enum);
  ignore (test "Enum naming conventions" test_enum_naming_conventions)
