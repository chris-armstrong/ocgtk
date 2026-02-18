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

(* Bug 7: Record copy function should have balanced parentheses in generated C code
   See ocgtk/docs/plans/fix_codegen_bugs.md lines 743-768 *)
let test_record_copy_parses_successfully () =
  let open Gir_gen_lib.Types in
  let _ctx = Helpers.create_test_context () in

  (* Create a record with a copy method where c_identifier ends with _copy
     but method_name is NOT "copy". This triggers the fallback copy function.
     The fallback generates: return ml_gir_record_val_ptr(copy));
     which has an extra parenthesis causing a syntax error. *)
  let copy_method =
    {
      method_name = "clone";  (* Not "copy" - triggers fallback *)
      c_identifier = "test_record_copy";  (* Ends with _copy *)
      return_type =
        { name = "TestRecord"; c_type = Some "TestRecord*"; nullable = false; transfer_ownership = TransferFull; array = None };
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
      record_name = "TestRecord";
      c_type = "TestRecord";
      glib_type_name = None;
      glib_get_type = None;
      opaque = false;
      disguised = false;
      c_symbol_prefix = Some "test_record";
      is_gtype_struct_for = None;
      fields =
        [
          {
            field_name = "data";
            field_type =
              Some
                {
                  name = "gint";
                  c_type = Some "int";
                  nullable = false;
                  transfer_ownership = TransferNone;
                  array = None;
                };
            readable = true;
            writable = true;
            field_doc = None;
          };
        ];
      constructors = [];
      methods = [ copy_method ];  (* Has copy method via c_identifier *)
      functions = [];
      record_doc = None;
      introspectable = true;
    }
  in

  (* Generate the copy function C code *)
  let buf = Buffer.create 1024 in
  Gir_gen_lib.Generate.C_stub_record.generate_record_converters ~buf record;
  let c_code = Buffer.contents buf in
  Helpers.log_generated_c_code "record_copy_syntax" c_code;

  (* Positive: code parses without error - this catches unbalanced parens *)
  let functions = C_parser.parse_c_code c_code in
  let copy_func = C_ast.find_function functions "copy_TestRecord" in
  Alcotest.(check bool) "copy function parses to valid AST" true
    (Option.is_some copy_func);

  (* Positive: the parsed copy function has a return statement *)
  let func = Option.get copy_func in
  Alcotest.(check bool) "Has return statement" true
    (Option.is_some (C_ast.return_expr func));

  (* Positive: return expression wraps copy in ml_gir_record_val_ptr *)
  let ret = C_ast.return_expr func in
  match ret with
  | Some expr ->
      let calls = C_ast.get_function_calls expr in
      Alcotest.(check bool) "Return wraps in ml_gir_record_val_ptr" true
        (List.mem "ml_gir_record_val_ptr" calls)
  | None -> Alcotest.fail "Copy function missing return expression"

(* Bug 10: Module name capitalization must match dune convention
   Dune lowercases all characters after the first in module names.
   So "GdkPixbuf" becomes "Gdkpixbuf" in the module name.
   Therefore, enums_module_name must return "Gdkpixbuf_enums" not "GdkPixbuf_enums". *)
let test_enum_module_name_matches_dune_convention () =
  let open Gir_gen_lib.Types in
  (* Create a context with a multi-word namespace like GdkPixbuf *)
  let namespace =
    {
      namespace_name = "GdkPixbuf";
      namespace_version = "2.0";
      namespace_shared_library = "libgdk_pixbuf-2.0.so.0";
      namespace_c_identifier_prefixes = "Gdk";
      namespace_c_symbol_prefixes = "gdk_pixbuf";
    }
  in
  let ctx =
    {
      namespace;
      repository = { repository_c_includes = []; repository_includes = []; repository_packages = [] };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      external_enums = [];
      external_bitfields = [];
      hierarchy_map = Hashtbl.create 0;
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = Gir_gen_lib.Types.StringMap.empty;
    }
  in
  (* Create a dummy enum for the test *)
  let dummy_enum =
    {
      enum_name = "Colorspace";
      enum_c_type = "GdkColorspace";
      members = [];
      functions = [];
      enum_doc = None;
    }
  in
  (* Check that the module name follows dune convention *)
  let module_name = Gir_gen_lib.Utils.enums_module_name ctx dummy_enum in
  Alcotest.(check string)
    "Enums module name follows dune convention (first char uppercase, rest lowercase)"
    "Gdkpixbuf_enums"
    module_name;

  (* Also test bitfields_module_name *)
  let dummy_bitfield =
    {
      bitfield_name = "PixbufRotation";
      bitfield_c_type = "GdkPixbufRotation";
      flags = [];
      bitfield_doc = None;
    }
  in
  let bitfield_module_name = Gir_gen_lib.Utils.bitfields_module_name ctx dummy_bitfield in
  Alcotest.(check string)
    "Bitfields module name follows dune convention"
    "Gdkpixbuf_enums"
    bitfield_module_name

(* Bug 8: Class with no c:type attribute should use namespace c:identifier-prefixes,
   not hardcoded "Gtk" prefix. E.g., GdkPixbufNonAnim not GtkNonAnim. *)
let test_non_gtk_namespace_c_type_prefix () =
  (* Create GIR with GdkPixbuf namespace, class with no c:type attribute *)
  let gir =
    wrap_namespace ~namespace_name:"GdkPixbuf" ~c_prefix:"Gdk"
      ~symbol_prefix:"gdk_pixbuf"
      {|
      <class name="NonAnim" parent="GObject.Object"
             glib:type-name="GdkPixbufNonAnim" glib:get-type="gdk_pixbuf_non_anim_get_type">
        <!-- No c:type attribute! Should infer from namespace prefix -->
      </class>
      <interface name="Anim"
                 glib:type-name="GdkPixbufAnim" glib:get-type="gdk_pixbuf_anim_get_type">
        <!-- No c:type attribute! Should infer from namespace prefix -->
      </interface>
  |}
  in
  create_gir_file test_gir gir;

  (* Parse it *)
  let _, _, classes, interfaces, _, _, _ =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file test_gir []
  in

  (* Verify the inferred c_type for class uses Gdk prefix, not Gtk *)
  let cls =
    List.find
      (fun (c : Gir_gen_lib.Types.gir_class) ->
        String.equal c.class_name "NonAnim")
      classes
  in
  Alcotest.(check string)
    "Class c_type uses namespace prefix (Gdk), not hardcoded Gtk"
    "GdkNonAnim"
    cls.c_type;

  (* Verify the inferred c_type for interface uses Gdk prefix, not Gtk *)
  let intf =
    List.find
      (fun (i : Gir_gen_lib.Types.gir_interface) ->
        String.equal i.interface_name "Anim")
      interfaces
  in
  Alcotest.(check string)
    "Interface c_type uses namespace prefix (Gdk), not hardcoded Gtk"
    "GdkAnim"
    intf.c_type

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
    Alcotest.test_case "Record copy function has balanced parentheses"
      `Quick test_record_copy_parses_successfully;
    Alcotest.test_case "Enum module name matches dune convention"
      `Quick test_enum_module_name_matches_dune_convention;
    Alcotest.test_case "Non-Gtk namespace c:type prefix inferred correctly"
      `Quick test_non_gtk_namespace_c_type_prefix;
  ]
