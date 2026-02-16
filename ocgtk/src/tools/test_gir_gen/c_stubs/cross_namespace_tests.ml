(* Cross-namespace tests for bugs surfaced by new library namespaces *)

open Helpers

let test_gir = "/tmp/test_cross_ns.gir"
let output_dir = "/tmp/test_cross_ns_output"

(* Bug 2: Records with introspectable="0" should be parsed but not generated *)
let test_non_introspectable_record_filtered () =
  let gir =
    wrap_namespace ~namespace_name:"TestNs" ~c_prefix:"TestNs"
      ~symbol_prefix:"test_ns"
      {|
      <record name="PrivateRecord" c:type="TestNsPrivateRecord" introspectable="0">
        <field name="data"><type name="gint" c:type="int"/></field>
      </record>
      <record name="PublicRecord" c:type="TestNsPublicRecord">
        <field name="value" writable="1"><type name="gint" c:type="int"/></field>
      </record>
  |}
  in
  create_gir_file test_gir gir;

  (* Parse — both records should be in the AST *)
  let _, _, _, _, _, _, records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir []
  in
  let record_names =
    List.map
      (fun (r : Gir_gen_lib.Types.gir_record) -> r.record_name)
      records
  in
  Alcotest.(check bool)
    "PublicRecord IS parsed" true
    (List.mem "PublicRecord" record_names);
  Alcotest.(check bool)
    "PrivateRecord IS parsed (introspectable stored, not filtered)"
    true
    (List.mem "PrivateRecord" record_names);

  (* Verify introspectable attribute is stored correctly *)
  let private_rec =
    List.find
      (fun (r : Gir_gen_lib.Types.gir_record) ->
        String.equal r.record_name "PrivateRecord")
      records
  in
  Alcotest.(check bool)
    "PrivateRecord has introspectable=false" false
    private_rec.introspectable;

  let public_rec =
    List.find
      (fun (r : Gir_gen_lib.Types.gir_record) ->
        String.equal r.record_name "PublicRecord")
      records
  in
  Alcotest.(check bool)
    "PublicRecord has introspectable=true (default)" true
    public_rec.introspectable;

  (* Verify generation-level filtering *)
  Alcotest.(check bool)
    "PublicRecord should be generated"
    true
    (Gir_gen_lib.Generate.Filtering.should_generate_record public_rec);
  Alcotest.(check bool)
    "PrivateRecord should NOT be generated"
    false
    (Gir_gen_lib.Generate.Filtering.should_generate_record private_rec)

(* Bug 9: Constructors with introspectable="0" should be parsed but filtered
   at generation *)
let test_non_introspectable_constructor_filtered () =
  let gir =
    wrap_namespace ~namespace_name:"TestNs" ~c_prefix:"TestNs"
      ~symbol_prefix:"test_ns"
      {|
      <class name="Widget" c:type="TestNsWidget" parent="GObject.Object"
             glib:type-name="TestNsWidget" glib:get-type="test_ns_widget_get_type">
        <constructor name="new" c:identifier="test_ns_widget_new">
          <return-value transfer-ownership="full">
            <type name="Widget" c:type="TestNsWidget*"/>
          </return-value>
        </constructor>
        <constructor name="new_internal" c:identifier="test_ns_widget_new_internal" introspectable="0">
          <return-value transfer-ownership="full">
            <type name="Widget" c:type="TestNsWidget*"/>
          </return-value>
        </constructor>
      </class>
  |}
  in
  create_gir_file test_gir gir;

  (* Parse — both constructors should be in the AST *)
  let _, _, classes, _, _, _, _ =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir []
  in
  let cls =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_class) ->
        String.equal c.class_name "Widget")
      classes
  in
  Alcotest.(check int)
    "Both constructors are parsed" 2
    (List.length cls.constructors);

  (* Verify introspectable attribute is stored correctly *)
  let good_ctor =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_constructor) ->
        String.equal c.ctor_name "new")
      cls.constructors
  in
  Alcotest.(check bool)
    "Good constructor has introspectable=true" true
    good_ctor.ctor_introspectable;

  let bad_ctor =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_constructor) ->
        String.equal c.ctor_name "new_internal")
      cls.constructors
  in
  Alcotest.(check bool)
    "Bad constructor has introspectable=false" false
    bad_ctor.ctor_introspectable;

  (* Verify generation-level filtering *)
  let ctx = create_test_context () in
  Alcotest.(check bool)
    "Good constructor should be generated"
    true
    (Gir_gen_lib.Generate.Filtering.should_generate_constructor ~ctx good_ctor);
  Alcotest.(check bool)
    "Bad constructor should NOT be generated"
    false
    (Gir_gen_lib.Generate.Filtering.should_generate_constructor ~ctx bad_ctor)

(* Bug 12: Methods with introspectable="0" should be parsed but filtered
   at generation *)
let test_non_introspectable_method_skipped () =
  let gir =
    wrap_namespace ~namespace_name:"TestNs" ~c_prefix:"TestNs"
      ~symbol_prefix:"test_ns"
      {|
      <class name="Widget" c:type="TestNsWidget" parent="GObject.Object"
             glib:type-name="TestNsWidget" glib:get-type="test_ns_widget_get_type">
        <method name="public_method" c:identifier="test_ns_widget_public_method">
          <return-value transfer-ownership="none">
            <type name="none" c:type="void"/>
          </return-value>
        </method>
        <method name="internal_method" c:identifier="test_ns_widget_internal_method" introspectable="0">
          <return-value transfer-ownership="none">
            <type name="none" c:type="void"/>
          </return-value>
        </method>
      </class>
  |}
  in
  create_gir_file test_gir gir;

  (* Parse - both methods should be in the AST *)
  let _, _, classes, _, _, _, _ =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir []
  in
  let cls =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_class) ->
        String.equal c.class_name "Widget")
      classes
  in
  Alcotest.(check int) "Both methods are parsed" 2 (List.length cls.methods);

  (* Verify introspectable attribute is stored correctly *)
  let good_method =
    List.find
      (fun (m : Gir_gen_lib.Types.gir_method) ->
        String.equal m.method_name "public_method")
      cls.methods
  in
  Alcotest.(check bool)
    "Good method has introspectable=true (default)" true
    good_method.introspectable;

  let bad_method =
    List.find
      (fun (m : Gir_gen_lib.Types.gir_method) ->
        String.equal m.method_name "internal_method")
      cls.methods
  in
  Alcotest.(check bool)
    "Bad method has introspectable=false" false
    bad_method.introspectable;

  (* Verify generation-level filtering *)
  let ctx = create_test_context () in
  Alcotest.(check bool)
    "Good method should be generated" false
    (Gir_gen_lib.Generate.Filtering.should_skip_method_binding ~ctx good_method);
  Alcotest.(check bool)
    "Bad method should NOT be generated" true
    (Gir_gen_lib.Generate.Filtering.should_skip_method_binding ~ctx bad_method)

(* Bug 3: Copy function should return the copy result, not g_new0
   See ocgtk/docs/plans/fix_codegen_bugs.md lines 553-592 *)
let test_copy_function_returns_copy_result () =
  let open Gir_gen_lib.Types in
  let _ctx = Helpers.create_test_context () in

  (* Create a record with a copy method - simulates GdkPixbufFormat-like record *)
  let copy_method =
    {
      method_name = "copy";
      c_identifier = "test_format_copy";
      return_type = { name = "Format"; c_type = Some "TestFormat*"; nullable = false; transfer_ownership = TransferFull; array = None };
      parameters = [];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
      introspectable = true;
    }
  in
  let record =
    {
      record_name = "Format";
      c_type = "TestFormat";
      glib_type_name = Some "TestFormat";
      glib_get_type = Some "test_format_get_type";
      opaque = false;
      disguised = false;
      c_symbol_prefix = Some "test_format";
      is_gtype_struct_for = None;
      fields = [];
      constructors = [];
      methods = [ copy_method ];
      functions = [];
      record_doc = None;
      introspectable = true;
    }
  in

  (* Generate the copy function C code *)
  let buf = Buffer.create 1024 in
  Gir_gen_lib.Generate.C_stub_record.generate_record_converters ~buf record;
  let c_code = Buffer.contents buf in
  Helpers.log_generated_c_code "copy_function" c_code;

  (* Parse the generated C code *)
  let functions = C_parser.parse_c_code c_code in
  let copy_func = Option.get (C_ast.find_function functions "copy_TestFormat") in

  (* Positive: copy function calls the record's copy method *)
  Alcotest.(check bool)
    "Calls test_format_copy" true
    (C_validation.calls_c_function copy_func "test_format_copy");

  (* Positive: return expression wraps the copy variable, not g_new0 *)
  let ret = C_ast.return_expr copy_func in
  match ret with
  | Some expr ->
      (* The return should reference 'copy' variable *)
      Alcotest.(check bool)
        "Return uses copy variable" true
        (C_ast.expr_uses_var expr "copy");
      (* The return should NOT call g_new0 *)
      let calls = C_ast.get_function_calls expr in
      Alcotest.(check bool)
        "Return does not call g_new0" false
        (List.exists (fun s -> String.equal s "g_new0") calls)
  | None -> Alcotest.fail "Copy function has no return statement"

let tests =
  [
    Alcotest.test_case "Non-introspectable record filtered at generation"
      `Quick test_non_introspectable_record_filtered;
    Alcotest.test_case "Non-introspectable constructor filtered at generation"
      `Quick test_non_introspectable_constructor_filtered;
    Alcotest.test_case "Non-introspectable method skipped at generation"
      `Quick test_non_introspectable_method_skipped;
    Alcotest.test_case "Copy function returns copy result not g_new0"
      `Quick test_copy_function_returns_copy_result;
  ]
