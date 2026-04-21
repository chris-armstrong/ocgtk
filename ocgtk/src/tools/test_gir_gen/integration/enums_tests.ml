(* Enum and bitfield generation tests *)

open Helpers

let enum_gir =
  wrap_namespace
    ({|
    <enumeration name="WrapMode" c:type="GtkWrapMode">
      <member name="none" value="0" c:identifier="GTK_WRAP_NONE"/>
      <member name="char" value="1" c:identifier="GTK_WRAP_CHAR"/>
      <member name="word" value="2" c:identifier="GTK_WRAP_WORD"/>
      <member name="word_char" value="3" c:identifier="GTK_WRAP_WORD_CHAR"/>
    </enumeration>
|}
   ^ eventcontroller_key_class_xml)

let bitfield_gir =
  wrap_namespace
    ({|
    <bitfield name="StateFlags" c:type="GtkStateFlags">
      <member name="normal" value="0" c:identifier="GTK_STATE_FLAG_NORMAL"/>
      <member name="active" value="1" c:identifier="GTK_STATE_FLAG_ACTIVE"/>
      <member name="prelight" value="2" c:identifier="GTK_STATE_FLAG_PRELIGHT"/>
      <member name="selected" value="4" c:identifier="GTK_STATE_FLAG_SELECTED"/>
    </bitfield>
|}
   ^ eventcontroller_key_class_xml)

let multiple_enums_gir =
  wrap_namespace
    ({|
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
|}
   ^ eventcontroller_key_class_xml)

let single_enum_gir =
  wrap_namespace
    ({|
    <enumeration name="SingleValue" c:type="GtkSingleValue">
      <member name="only" value="0" c:identifier="GTK_SINGLE_VALUE_ONLY"/>
    </enumeration>
|}
   ^ eventcontroller_key_class_xml)

let test_enum_generation () =
  let output_dir =
    run_integration_test ~gir_content:enum_gir ~class_names:[]
      ~test_name:"enum_gen" ()
  in
  let enums = enum_file output_dir in
  assert_true "gtk_enums.mli should be created" (file_exists enums);

  let enum_content = read_file enums in
  let sig_ast = Ml_ast_helpers.parse_interface enum_content in

  Ml_validation.assert_type_has_variant_tag_sig sig_ast "wrapmode" "NONE";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "wrapmode" "CHAR";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "wrapmode" "WORD";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "wrapmode" "WORD_CHAR";

  let c_file = enum_c_file output_dir in
  let c_content = read_file c_file in
  let c_functions = C_parser.parse_c_code c_content in

  let find_fn name =
    expect_some
      (Printf.sprintf "C function '%s' not found" name)
      (List.find_opt (fun (f : C_ast.c_function) -> f.name = name) c_functions)
      Fun.id
  in

  let val_fn = find_fn "Val_GtkWrapMode" in
  assert_true "C to OCaml converter should use switch"
    (C_validation.calls_c_function val_fn "switch");
  let _ = find_fn "GtkWrapMode_val" in
  ()

let test_bitfield_generation () =
  let output_dir =
    run_integration_test ~gir_content:bitfield_gir ~class_names:[]
      ~test_name:"bitfield_gen" ()
  in
  let enums = enum_file output_dir in
  assert_true "gtk_enums.mli should be created for bitfields"
    (file_exists enums);

  let enum_content = read_file enums in
  let sig_ast = Ml_ast_helpers.parse_interface enum_content in

  Ml_validation.assert_type_has_variant_tag_sig sig_ast "stateflags_flag"
    "NORMAL";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "stateflags_flag"
    "ACTIVE";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "stateflags_flag"
    "PRELIGHT";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "stateflags_flag"
    "SELECTED";
  (* stateflags list type: type stateflags = stateflags_flag list *)
  Ml_validation.assert_type_exists_sig sig_ast "stateflags";

  let c_file = enum_c_file output_dir in
  let c_content = read_file c_file in
  let c_functions = C_parser.parse_c_code c_content in

  let find_fn name =
    expect_some
      (Printf.sprintf "C function '%s' not found" name)
      (List.find_opt (fun (f : C_ast.c_function) -> f.name = name) c_functions)
      Fun.id
  in

  let _ = find_fn "Val_GtkStateFlags" in
  let _ = find_fn "GtkStateFlags_val" in
  assert_true "Converter should call caml_alloc (cons cells)"
    (List.exists (fun f -> C_validation.calls_caml_alloc f) c_functions)

let test_multiple_enums () =
  let output_dir =
    run_integration_test ~gir_content:multiple_enums_gir ~class_names:[]
      ~test_name:"multiple_enums" ()
  in
  let enums = enum_file output_dir in
  let content = read_file enums in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  Ml_validation.assert_type_has_variant_tag_sig sig_ast "align" "FILL";
  Ml_validation.assert_type_exists_sig sig_ast "orientation";
  Ml_validation.assert_type_exists_sig sig_ast "eventmask_flag";
  Ml_validation.assert_type_exists_sig sig_ast "eventmask"

let test_single_value_enum () =
  let output_dir =
    run_integration_test ~gir_content:single_enum_gir ~class_names:[]
      ~test_name:"single_enum" ()
  in
  let enums = enum_file output_dir in
  let content = read_file enums in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  Ml_validation.assert_type_has_variant_tag_sig sig_ast "singlevalue" "ONLY"

let test_enum_naming_conventions () =
  let output_dir =
    run_integration_test ~gir_content:multiple_enums_gir ~class_names:[]
      ~test_name:"enum_naming" ()
  in
  let enums = enum_file output_dir in
  let content = read_file enums in
  let sig_ast = Ml_ast_helpers.parse_interface content in

  (* Enum type names are lowercase *)
  Ml_validation.assert_type_exists_sig sig_ast "align";
  Ml_validation.assert_type_exists_sig sig_ast "orientation";
  (* Bitfield flag type has _flag suffix *)
  Ml_validation.assert_type_exists_sig sig_ast "eventmask_flag";
  (* Variants are uppercase *)
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "align" "FILL";
  Ml_validation.assert_type_has_variant_tag_sig sig_ast "orientation"
    "HORIZONTAL"

let tests =
  [
    Alcotest.test_case "Enum generation (Phase 5.3)" `Quick test_enum_generation;
    Alcotest.test_case "Bitfield generation (Phase 5.3)" `Quick
      test_bitfield_generation;
    Alcotest.test_case "Multiple enums in one file" `Quick test_multiple_enums;
    Alcotest.test_case "Single value enum" `Quick test_single_value_enum;
    Alcotest.test_case "Enum naming conventions" `Quick
      test_enum_naming_conventions;
  ]
