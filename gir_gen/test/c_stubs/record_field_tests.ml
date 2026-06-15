(* Record Field Accessor C Stub Tests
 *
 * Unit tests for [C_stub_field] via pre-computed [Field_analysis.field_info]
 * values.  All tests are pure (no subprocess).
 *)

open Type_factory

let create_ctx = Helpers.create_test_context

(* Build a [field_info] for a named record with the given field.
   Fails the test if [compute_field_info] returns [None]. *)
let compute_fi ?(record_name = "Border") ?(c_type = "GtkBorder") ~field () =
  let ctx = create_ctx () in
  match
    Gir_gen_lib.Generate.Field_analysis.compute_field_info ~ctx ~record_name
      ~c_type field
  with
  | Some fi -> fi
  | None ->
      Alcotest.fail
        (Printf.sprintf "compute_field_info returned None for field %s"
           field.field_name)

(* ========================================================================= *)
(* Test 1: gint field getter *)
(* ========================================================================= *)

let test_gint_field_getter () =
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  (* Check C names *)
  Alcotest.(check string)
    "getter C name" "ml_gtk_border_get_left" fi.getter_c_name;
  (* Check getter body reads rec->left *)
  Helpers.assert_true "getter body contains ->left"
    (Helpers.string_contains fi.c_getter_body "->left");
  (* Generate the getter stub and verify function name in output *)
  let stub_opt =
    Gir_gen_lib.Generate.C_stub_field.generate_field_getter ~c_type:"GtkBorder"
      fi
  in
  Helpers.assert_some "getter stub should be Some" stub_opt;
  let stub = Option.get stub_opt in
  Helpers.assert_true "stub contains function name"
    (Helpers.string_contains stub "ml_gtk_border_get_left")

(* ========================================================================= *)
(* Test 2: gint field setter *)
(* ========================================================================= *)

let test_gint_field_setter () =
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  Alcotest.(check string)
    "setter C name" "ml_gtk_border_set_left" fi.setter_c_name;
  Helpers.assert_true "setter body writes obj->left"
    (Helpers.string_contains fi.c_setter_body "->left");
  let stub_opt =
    Gir_gen_lib.Generate.C_stub_field.generate_field_setter ~c_type:"GtkBorder"
      fi
  in
  Helpers.assert_some "setter stub should be Some" stub_opt;
  let stub = Option.get stub_opt in
  Helpers.assert_true "stub contains function name"
    (Helpers.string_contains stub "ml_gtk_border_set_left")

(* ========================================================================= *)
(* Test 3: string (utf8) field *)
(* ========================================================================= *)

let test_string_field () =
  let field =
    make_gir_record_field ~field_name:"label" ~field_type:utf8_type
      ~readable:true ~writable:true ()
  in
  let fi = compute_fi ~field () in
  (* String fields need g_strdup in the setter and caml_copy_string in the getter *)
  Alcotest.(check bool) "needs_g_strdup" true fi.needs_g_strdup;
  Helpers.assert_true "getter body uses caml_copy_string"
    (Helpers.string_contains fi.c_getter_body "caml_copy_string");
  Helpers.assert_true "setter body uses g_strdup"
    (Helpers.string_contains fi.c_setter_body "g_strdup")

(* ========================================================================= *)
(* Test 4: no_getter flag - should_generate_field_getter returns false *)
(* ========================================================================= *)

let test_no_getter_suppresses_getter () =
  (* The field_info is still computed (no_getter is not a field_info flag).
     Filtering happens at the [Field_filter.should_generate_field_getter] level,
     which is called before building the field_info list passed to the stub
     generators.  We test the filter predicate directly. *)
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ~no_getter:true ()
  in
  Alcotest.(check bool)
    "should_generate_field_getter returns false when no_getter=true" false
    (Gir_gen_lib.Generate.Field_filter.should_generate_field_getter field)

(* ========================================================================= *)
(* Test 5: no_setter flag - should_generate_field_setter returns false *)
(* ========================================================================= *)

let test_no_setter_suppresses_setter () =
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ~no_setter:true ()
  in
  Alcotest.(check bool)
    "should_generate_field_setter returns false when no_setter=true" false
    (Gir_gen_lib.Generate.Field_filter.should_generate_field_setter field)

(* ========================================================================= *)
(* Test 6: make constructor includes all writable fields *)
(* ========================================================================= *)

let test_make_includes_all_writable_fields () =
  let ctx = create_ctx () in
  let fields =
    [
      make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
        ~writable:true ();
      make_gir_record_field ~field_name:"y" ~field_type:gint_type ~readable:true
        ~writable:true ();
      make_gir_record_field ~field_name:"z" ~field_type:gint_type ~readable:true
        ~writable:true ();
    ]
  in
  let field_infos =
    List.filter_map
      (fun f ->
        Gir_gen_lib.Generate.Field_analysis.compute_field_info ~ctx
          ~record_name:"Border" ~c_type:"GtkBorder" f)
      fields
  in
  Alcotest.(check int) "three field_infos computed" 3 (List.length field_infos);
  let make_opt =
    Gir_gen_lib.Generate.C_stub_field.generate_field_make_from_fields
      ~c_type:"GtkBorder" field_infos
  in
  Helpers.assert_some "make stub should be Some" make_opt;
  let stub = Option.get make_opt in
  (* The simple (<=5 params) form has all three params on the function signature *)
  Helpers.assert_true "make stub contains v_x"
    (Helpers.string_contains stub "v_x");
  Helpers.assert_true "make stub contains v_y"
    (Helpers.string_contains stub "v_y");
  Helpers.assert_true "make stub contains v_z"
    (Helpers.string_contains stub "v_z")

(* ========================================================================= *)
(* Test 7: make for >5 fields produces bytecode/native entry points *)
(* ========================================================================= *)

let test_make_six_fields_produces_native_and_bytecode () =
  let ctx = create_ctx () in
  let field_names = [ "a"; "b"; "c"; "d"; "e"; "f" ] in
  let fields =
    List.map
      (fun name ->
        make_gir_record_field ~field_name:name ~field_type:gint_type
          ~readable:true ~writable:true ())
      field_names
  in
  let field_infos =
    List.filter_map
      (fun f ->
        Gir_gen_lib.Generate.Field_analysis.compute_field_info ~ctx
          ~record_name:"Border" ~c_type:"GtkBorder" f)
      fields
  in
  Alcotest.(check int) "six field_infos computed" 6 (List.length field_infos);
  let make_opt =
    Gir_gen_lib.Generate.C_stub_field.generate_field_make_from_fields
      ~c_type:"GtkBorder" field_infos
  in
  Helpers.assert_some "make stub (6 params) should be Some" make_opt;
  let stub = Option.get make_opt in
  (* Multi-param form emits both _native and _bytecode entry points.
     Checking for these suffixes is appropriate here because the distinction
     between native/bytecode is not modelled by C_parser (it only parses
     function declarations, not naming conventions for bytecode wrappers). *)
  Helpers.assert_true "stub contains _native suffix"
    (Helpers.string_contains stub "_native");
  Helpers.assert_true "stub contains _bytecode suffix"
    (Helpers.string_contains stub "_bytecode")

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "gint field getter" `Quick test_gint_field_getter;
    Alcotest.test_case "gint field setter" `Quick test_gint_field_setter;
    Alcotest.test_case "string field uses g_strdup/caml_copy_string" `Quick
      test_string_field;
    Alcotest.test_case "no_getter suppresses getter" `Quick
      test_no_getter_suppresses_getter;
    Alcotest.test_case "no_setter suppresses setter" `Quick
      test_no_setter_suppresses_setter;
    Alcotest.test_case "make includes all writable fields" `Quick
      test_make_includes_all_writable_fields;
    Alcotest.test_case "make for >5 fields produces native+bytecode" `Quick
      test_make_six_fields_produces_native_and_bytecode;
  ]
