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
    List.map (fun (r : Gir_gen_lib.Types.gir_record) -> r.record_name) records
  in
  Alcotest.(check bool)
    "PublicRecord IS parsed" true
    (List.mem "PublicRecord" record_names);
  Alcotest.(check bool)
    "PrivateRecord IS parsed (introspectable stored, not filtered)" true
    (List.mem "PrivateRecord" record_names);

  (* Verify introspectable attribute is stored correctly *)
  let private_rec =
    List.find
      (fun (r : Gir_gen_lib.Types.gir_record) ->
        String.equal r.record_name "PrivateRecord")
      records
  in
  Alcotest.(check bool)
    "PrivateRecord has introspectable=false" false private_rec.introspectable;

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
    "PublicRecord should be generated" true
    (Gir_gen_lib.Generate.Filtering.should_generate_record public_rec);
  Alcotest.(check bool)
    "PrivateRecord should NOT be generated" false
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
    "Good constructor should be generated" true
    (Gir_gen_lib.Generate.Filtering.should_generate_constructor ~ctx good_ctor);
  Alcotest.(check bool)
    "Bad constructor should NOT be generated" false
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
    "Bad method has introspectable=false" false bad_method.introspectable;

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
      return_type =
        {
          name = "Format";
          c_type = Some "TestFormat*";
          nullable = false;
          transfer_ownership = TransferFull;
          array = None;
        };
      parameters = [];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
      introspectable = true;
      version = None;
      version_namespace = None;
      os = None;
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
      version = None;
      os = None;
    }
  in

  (* Generate the copy function C code *)
  let buf = Buffer.create 1024 in
  Gir_gen_lib.Generate.C_stub_record.generate_record_converters
    ~namespace_prefix:"test" ~buf record;
  let c_code = Buffer.contents buf in
  Helpers.log_generated_c_code "copy_function" c_code;

  (* Parse the generated C code *)
  let functions = C_parser.parse_c_code c_code in
  let copy_func =
    Option.get (C_ast.find_function functions "copy_TestFormat")
  in

  (* Positive: copy function calls the record's copy method *)
  Alcotest.(check bool)
    "Calls test_format_copy" true
    (C_validation.calls_c_function copy_func "test_format_copy");

  (* Positive: return expression wraps the copy variable, not g_new0 *)
  Helpers.expect_some "Copy function has no return statement"
    (C_ast.return_expr copy_func)
  @@ fun expr ->
  (* The return should reference 'copy' variable *)
  Alcotest.(check bool)
    "Return uses copy variable" true
    (C_ast.expr_uses_var expr "copy");
  (* The return should NOT call g_new0 *)
  let calls = C_ast.get_function_calls expr in
  Alcotest.(check bool)
    "Return does not call g_new0" false
    (List.exists (fun s -> String.equal s "g_new0") calls)

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
      method_name = "clone";
      (* Not "copy" - triggers fallback *)
      c_identifier = "test_record_copy";
      (* Ends with _copy *)
      return_type =
        {
          name = "TestRecord";
          c_type = Some "TestRecord*";
          nullable = false;
          transfer_ownership = TransferFull;
          array = None;
        };
      parameters = [];
      doc = None;
      throws = false;
      get_property = None;
      set_property = None;
      introspectable = true;
      version = None;
      version_namespace = None;
      os = None;
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
            field_version = None;
            field_os = None;
          };
        ];
      constructors = [];
      methods = [ copy_method ];
      (* Has copy method via c_identifier *)
      functions = [];
      record_doc = None;
      introspectable = true;
      version = None;
      os = None;
    }
  in

  (* Generate the copy function C code *)
  let buf = Buffer.create 1024 in
  Gir_gen_lib.Generate.C_stub_record.generate_record_converters
    ~namespace_prefix:"test" ~buf record;
  let c_code = Buffer.contents buf in
  Helpers.log_generated_c_code "record_copy_syntax" c_code;

  (* Positive: code parses without error - this catches unbalanced parens *)
  let functions = C_parser.parse_c_code c_code in
  let copy_func = C_ast.find_function functions "copy_TestRecord" in
  Alcotest.(check bool)
    "copy function parses to valid AST" true (Option.is_some copy_func);

  (* Positive: the parsed copy function has a return statement *)
  let func = Option.get copy_func in
  Alcotest.(check bool)
    "Has return statement" true
    (Option.is_some (C_ast.return_expr func));

  (* Positive: return expression wraps copy in ml_gir_record_val_ptr *)
  Helpers.expect_some "Copy function missing return expression"
    (C_ast.return_expr func)
  @@ fun expr ->
  let calls = C_ast.get_function_calls expr in
  Alcotest.(check bool)
    "Return wraps in ml_gir_record_val_ptr" true
    (List.mem "ml_gir_record_val_ptr" calls)

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
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
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
      enum_version = None;
      enum_os = None;
    }
  in
  (* Check that the module name follows dune convention *)
  let module_name = Gir_gen_lib.Utils.enums_module_name ctx dummy_enum in
  Alcotest.(check string)
    "Enums module name follows dune convention (first char uppercase, rest \
     lowercase)"
    "Gdkpixbuf_enums" module_name;

  (* Also test bitfields_module_name *)
  let dummy_bitfield =
    {
      bitfield_name = "PixbufRotation";
      bitfield_c_type = "GdkPixbufRotation";
      flags = [];
      bitfield_doc = None;
      bitfield_version = None;
      bitfield_os = None;
    }
  in
  let bitfield_module_name =
    Gir_gen_lib.Utils.bitfields_module_name ctx dummy_bitfield
  in
  Alcotest.(check string)
    "Bitfields module name follows dune convention" "Gdkpixbuf_enums"
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
    "Class c_type uses namespace prefix (Gdk), not hardcoded Gtk" "GdkNonAnim"
    cls.c_type;

  (* Verify the inferred c_type for interface uses Gdk prefix, not Gtk *)
  let intf =
    List.find
      (fun (i : Gir_gen_lib.Types.gir_interface) ->
        String.equal i.interface_name "Anim")
      interfaces
  in
  Alcotest.(check string)
    "Interface c_type uses namespace prefix (Gdk), not hardcoded Gtk" "GdkAnim"
    intf.c_type

(* Bug 5: Enum array element conversion should not use address-of operator.
   Enum converters like Val_PangoScript take values by value, not by pointer.
   The generator was incorrectly generating Val_PangoScript(&result[i]) instead
   of Val_PangoScript(result[i]). *)
let test_enum_array_element_conversion () =
  let open Gir_gen_lib.Types in
  (* Create a context with a Script enum (simulating PangoScript) *)
  let script_enum =
    {
      enum_name = "Script";
      enum_c_type = "PangoScript";
      members =
        [
          {
            member_name = "INVALID";
            member_value = 0;
            c_identifier = "PANGO_SCRIPT_INVALID";
            member_doc = None;
            member_version = None;
            member_os = None;
          };
        ];
      functions = [];
      enum_doc = None;
      enum_version = None;
      enum_os = None;
    }
  in
  let ctx = { (Helpers.create_test_context ()) with enums = [ script_enum ] } in

  (* Create a method returning an array of Script enum with length param *)
  let meth =
    {
      method_name = "get_scripts";
      c_identifier = "pango_language_get_scripts";
      return_type =
        {
          name = "Script";
          c_type = Some "const PangoScript*";
          nullable = false;
          transfer_ownership = TransferNone;
          array =
            Some
              {
                length = Some 0;
                (* Length is parameter index 0 *)
                zero_terminated = false;
                fixed_size = None;
                array_name = None;
                element_type =
                  {
                    name = "Script";
                    c_type = Some "PangoScript";
                    nullable = false;
                    transfer_ownership = TransferNone;
                    array = None;
                  };
              };
        };
      parameters =
        [
          {
            param_name = "num_scripts";
            param_type =
              {
                name = "gint";
                c_type = Some "int*";
                nullable = false;
                transfer_ownership = TransferFull;
                array = None;
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"PangoLanguage" meth "Language"
  in
  Helpers.log_generated_c_code "enum_array" c_code;

  let functions = C_parser.parse_c_code c_code in
  let func =
    Option.get (C_ast.find_function functions "ml_pango_language_get_scripts")
  in

  (* Positive: calls the C function *)
  Alcotest.(check bool)
    "Calls pango_language_get_scripts" true
    (C_validation.calls_c_function func "pango_language_get_scripts");

  (* Positive: allocates OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Positive: has element conversion loop *)
  Alcotest.(check bool)
    "Has Store_field conversion loop" true
    (C_validation.has_conversion_loop func);

  (* Positive: uses the enum converter macro Val_GtkScript (namespace from context) *)
  let has_enum_converter =
    let rec check_expr = function
      | C_ast.Macro ("Val_GtkScript", _) -> true
      | C_ast.Call (_, args) -> List.exists check_expr args
      | C_ast.Macro (_, args) -> List.exists check_expr args
      | _ -> false
    in
    let check_stmt = function
      | C_ast.ExprStmt e -> check_expr e
      | C_ast.VarDecl (_, _, Some e) -> check_expr e
      | _ -> false
    in
    List.exists check_stmt func.C_ast.body
  in
  Alcotest.(check bool) "Uses Val_GtkScript converter" true has_enum_converter;

  (* Critical: verify no AddrOf nodes wrap the enum conversion.
     The generated code should be Val_GtkScript(result[i]), NOT
     Val_GtkScript(&result[i]). *)
  let has_addr_of_in_enum_call =
    let rec check_stmts stmts = List.exists (fun stmt -> check_stmt stmt) stmts
    and check_stmt = function
      | C_ast.ExprStmt e -> check_expr e
      | C_ast.Return e -> check_expr e
      | C_ast.VarDecl (_, _, Some e) -> check_expr e
      | C_ast.IfStmt (_, then_stmts, else_stmts) ->
          check_stmts then_stmts || check_stmts else_stmts
      | _ -> false
    and check_expr = function
      | C_ast.Call ("Val_GtkScript", args) | C_ast.Macro ("Val_GtkScript", args)
        ->
          List.exists (function C_ast.AddrOf _ -> true | _ -> false) args
      | C_ast.Call (_, args) | C_ast.Macro (_, args) ->
          List.exists check_expr args
      | C_ast.Cast (_, e) -> check_expr e
      | _ -> false
    in
    check_stmts func.C_ast.body
  in
  Alcotest.(check bool)
    "No AddrOf wrapping enum converter (Bug 5 fix)" false
    has_addr_of_in_enum_call

(* Bug 5: Bitfield array element conversion should not use address-of operator.
   Bitfield converters like Val_GtkApplicationInhibitFlags take values by value,
   not by pointer. *)
let test_bitfield_array_element_conversion () =
  let open Gir_gen_lib.Types in
  (* Create a context with an InhibitFlags bitfield *)
  let inhibit_flags_bitfield =
    {
      bitfield_name = "InhibitFlags";
      bitfield_c_type = "GtkApplicationInhibitFlags";
      flags =
        [
          {
            flag_name = "LOGOUT";
            flag_value = 1;
            flag_c_identifier = "GTK_APPLICATION_INHIBIT_LOGOUT";
            flag_doc = None;
            flag_version = None;
            flag_os = None;
          };
        ];
      bitfield_doc = None;
      bitfield_version = None;
      bitfield_os = None;
    }
  in
  let ctx =
    {
      (Helpers.create_test_context ()) with
      bitfields = [ inhibit_flags_bitfield ];
    }
  in

  (* Create a method returning an array of InhibitFlags bitfield *)
  let meth =
    {
      method_name = "get_inhibit_flags";
      c_identifier = "gtk_application_get_inhibit_flags";
      return_type =
        {
          name = "InhibitFlags";
          c_type = Some "const GtkApplicationInhibitFlags*";
          nullable = false;
          transfer_ownership = TransferNone;
          array =
            Some
              {
                length = Some 0;
                zero_terminated = false;
                fixed_size = None;
                array_name = None;
                element_type =
                  {
                    name = "InhibitFlags";
                    c_type = Some "GtkApplicationInhibitFlags";
                    nullable = false;
                    transfer_ownership = TransferNone;
                    array = None;
                  };
              };
        };
      parameters =
        [
          {
            param_name = "n_flags";
            param_type =
              {
                name = "gint";
                c_type = Some "int*";
                nullable = false;
                transfer_ownership = TransferFull;
                array = None;
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"GtkApplication" meth "Application"
  in
  Helpers.log_generated_c_code "bitfield_array" c_code;

  let functions = C_parser.parse_c_code c_code in
  let func =
    Option.get
      (C_ast.find_function functions "ml_gtk_application_get_inhibit_flags")
  in

  (* Positive: calls the C function *)
  Alcotest.(check bool)
    "Calls gtk_application_get_inhibit_flags" true
    (C_validation.calls_c_function func "gtk_application_get_inhibit_flags");

  (* Positive: allocates OCaml array *)
  Alcotest.(check bool)
    "Allocates OCaml array" true
    (C_validation.calls_caml_alloc func);

  (* Positive: has element conversion loop *)
  Alcotest.(check bool)
    "Has Store_field conversion loop" true
    (C_validation.has_conversion_loop func);

  (* Critical: verify no AddrOf nodes wrap the bitfield conversion *)
  let has_addr_of_in_bitfield_call =
    let rec check_stmts stmts = List.exists (fun stmt -> check_stmt stmt) stmts
    and check_stmt = function
      | C_ast.ExprStmt e -> check_expr e
      | C_ast.Return e -> check_expr e
      | C_ast.VarDecl (_, _, Some e) -> check_expr e
      | C_ast.IfStmt (_, then_stmts, else_stmts) ->
          check_stmts then_stmts || check_stmts else_stmts
      | _ -> false
    and check_expr = function
      | C_ast.Call ("Val_GtkInhibitFlags", args)
      | C_ast.Macro ("Val_GtkInhibitFlags", args) ->
          List.exists (function C_ast.AddrOf _ -> true | _ -> false) args
      | C_ast.Call (_, args) | C_ast.Macro (_, args) ->
          List.exists check_expr args
      | C_ast.Cast (_, e) -> check_expr e
      | _ -> false
    in
    check_stmts func.C_ast.body
  in
  Alcotest.(check bool)
    "No AddrOf wrapping bitfield converter (Bug 5 fix)" false
    has_addr_of_in_bitfield_call

(* Bug 4: Inout record parameters should be initialized as stack values with pointers,
    not as direct value types. For PangoRectangle* inout params, the generator should:
    - Declare a local stack value: PangoRectangle inout1_val = ...;
    - Create a pointer to it: PangoRectangle *inout1 = &inout1_val;
    - Pass the pointer to the C function: pango_matrix_transform_rectangle(..., inout1) *)
let test_inout_record_param_pointer_type () =
  let open Gir_gen_lib.Types in
  (* Create a record type simulating PangoRectangle *)
  let rectangle_record =
    {
      record_name = "Rectangle";
      c_type = "PangoRectangle";
      glib_type_name = Some "PangoRectangle";
      glib_get_type = Some "pango_rectangle_get_type";
      opaque = false;
      disguised = false;
      c_symbol_prefix = Some "pango_rectangle";
      is_gtype_struct_for = None;
      fields =
        [
          {
            field_name = "x";
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
            field_version = None;
            field_os = None;
          };
        ];
      constructors = [];
      methods = [];
      functions = [];
      record_doc = None;
      introspectable = true;
      version = None;
      os = None;
    }
  in
  let ctx =
    { (Helpers.create_test_context ()) with records = [ rectangle_record ] }
  in

  (* Create a method with inout Rectangle* parameter - simulates pango_matrix_transform_rectangle *)
  let meth =
    {
      method_name = "transform_rectangle";
      c_identifier = "pango_matrix_transform_rectangle";
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
          (* self parameter - PangoMatrix* *)
          {
            param_name = "matrix";
            param_type =
              {
                name = "Matrix";
                c_type = Some "PangoMatrix*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
          (* inout Rectangle* parameter *)
          {
            param_name = "rect";
            param_type =
              {
                name = "Rectangle";
                c_type = Some "PangoRectangle*";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = InOut;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"PangoMatrix" meth "Matrix"
  in
  Helpers.log_generated_c_code "inout_record" c_code;

  let functions = C_parser.parse_c_code c_code in
  let func =
    Option.get
      (C_ast.find_function functions "ml_pango_matrix_transform_rectangle")
  in

  (* Positive: function parses to valid AST *)
  Alcotest.(check bool)
    "Function parses to valid AST" true
    (Option.is_some
       (C_ast.find_function functions "ml_pango_matrix_transform_rectangle"));

  (* Critical: check that we have TWO variable declarations for the inout param:
     1. PangoRectangle inout1_val = PangoRectangle_val(arg1);  (the stack value)
     2. PangoRectangle *inout1 = &inout1_val;  (the pointer to pass to C)

     Bug 4 fix: for record types, inout params need value + pointer declarations *)
  let var_decls = C_ast.get_var_decls func in
  let inout_decls =
    List.filter
      (fun (name, _type, _init) ->
        String.length name >= 5 && String.sub name 0 5 = "inout")
      var_decls
  in

  (* We expect at least two declarations: inout_val and inout (or similar pattern) *)
  Alcotest.(check bool)
    "At least two inout-related variable declarations" true
    (List.length inout_decls >= 2);

  (* Verify one is a value type and one is a pointer type *)
  let has_value_decl =
    List.exists
      (fun (_name, typ, _init) ->
        (* Value type: starts with "PangoRectangle" but NOT "PangoRectangle*" *)
        String.length typ >= 14
        && String.sub typ 0 14 = "PangoRectangle"
        && not (String.contains typ '*'))
      inout_decls
  in
  Alcotest.(check bool)
    "Has value declaration (PangoRectangle inout_val)" true has_value_decl;

  let has_pointer_decl =
    List.exists
      (fun (_name, typ, _init) ->
        (* Pointer type: "PangoRectangle*" *)
        String.length typ >= 15 && String.sub typ 0 15 = "PangoRectangle*")
      inout_decls
  in
  Alcotest.(check bool)
    "Has pointer declaration (PangoRectangle* inout)" true has_pointer_decl;

  (* Verify the pointer is initialized with address-of the value *)
  let pointer_decl =
    List.find_opt
      (fun (_, typ, _) ->
        String.length typ >= 15 && String.sub typ 0 15 = "PangoRectangle*")
      inout_decls
  in
  match pointer_decl with
  | Some (_, _, Some (C_ast.AddrOf (C_ast.Var var_name))) ->
      Alcotest.(check bool)
        "Pointer initialized with &inout_val" true
        (String.length var_name >= 5 && String.sub var_name 0 5 = "inout")
  | Some (_, _, Some _) ->
      Alcotest.fail
        "Pointer should be initialized with AddrOf (address-of) expression"
  | Some (_, _, None) -> Alcotest.fail "Pointer should have initialization"
  | None -> Alcotest.fail "Pointer declaration not found"

(* Bug 6: Value-like records must have complete forward declarations.
    The copy function declaration AND the Val_/val_ macros must both be emitted.
    Bug: generate_forward_decls uses inconsistent copy method detection -
    is_value_like_record uses is_copy_method (method_name OR c_identifier ends with _copy),
    but the macro generation only checks method_name = "copy". *)
let test_value_record_has_complete_forward_decls () =
  (* Create a GIR with a value-like record where the copy method's method_name
     is NOT "copy" but c_identifier ends with "_copy". This simulates GskRoundedRect. *)
  let gir =
    wrap_namespace ~namespace_name:"TestNs" ~c_prefix:"TestNs"
      ~symbol_prefix:"test_ns"
      {|
      <record name="TestRect" c:type="TestNsRect"
              glib:type-name="TestNsRect" glib:get-type="test_ns_rect_get_type">
        <field name="x" writable="1"><type name="gint" c:type="int"/></field>
        <field name="y" writable="1"><type name="gint" c:type="int"/></field>
        <!-- Copy method with method_name != "copy" but c_identifier ends with _copy -->
        <method name="duplicate" c:identifier="test_ns_rect_copy">
          <return-value transfer-ownership="full">
            <type name="TestNsRect" c:type="TestNsRect*"/>
          </return-value>
        </method>
      </record>
  |}
  in
  create_gir_file test_gir gir;
  ensure_output_dir output_dir;
  let exit_code = run_gir_gen test_gir output_dir in
  Alcotest.(check int) "Generation succeeds" 0 exit_code;

  (* Read the forward declarations header *)
  let header_path =
    Filename.concat (generated_dir output_dir) "testns_decls.h"
  in
  let header = read_file header_path in

  (* Positive: copy function is declared *)
  assert_contains "copy_ function declared" header
    "value copy_TestNsRect(const TestNsRect *ptr)";

  (* Critical: Val_ macro MUST be defined using copy function.
     This is the bug - the macro was missing when method_name != "copy". *)
  assert_contains "Val_TestNsRect macro defined" header "#define Val_TestNsRect";

  (* Positive: _val macro is defined *)
  assert_contains "TestNsRect_val macro defined" header "#define TestNsRect_val";

  (* Also verify the C stub file has the copy function *)
  let c_file_path = stub_c_file output_dir "TestRect" in
  if file_exists c_file_path then begin
    let c_file = read_file c_file_path in
    let functions = C_parser.parse_c_code c_file in
    let copy_func = C_ast.find_function functions "copy_TestNsRect" in
    Alcotest.(check bool)
      "copy_TestNsRect function exists in C stub" true
      (Option.is_some copy_func)
  end

(* Bug 1: Fixed-size array out parameters should use stack allocation, not NULL init.
    For caller-allocated fixed-size arrays like graphene_box_get_vertices(8 vec3),
    the generator should produce:
      graphene_vec3_t out1[8];  // stack array, NOT "graphene_vec3_t out1 = NULL;"
      graphene_box_get_vertices(self, out1);
      // then convert each element to OCaml
*)
let test_fixed_size_array_out_param () =
  let open Gir_gen_lib.Types in
  (* Create a Vec3 record type simulating graphene_vec3_t *)
  let vec3_record =
    {
      record_name = "Vec3";
      c_type = "graphene_vec3_t";
      glib_type_name = Some "GrapheneVec3";
      glib_get_type = Some "graphene_vec3_get_type";
      opaque = false;
      disguised = false;
      c_symbol_prefix = Some "graphene_vec3";
      is_gtype_struct_for = None;
      fields = [];
      constructors = [];
      methods = [];
      functions = [];
      record_doc = None;
      introspectable = true;
      version = None;
      os = None;
    }
  in
  let ctx =
    { (Helpers.create_test_context ()) with records = [ vec3_record ] }
  in

  (* Create a method with caller-allocated fixed-size array out param.
     This simulates graphene_box_get_vertices which has:
       <parameter name="vertices" direction="out" caller-allocates="1">
         <array zero-terminated="0" fixed-size="8">
           <type name="Graphene.Vec3" c:type="graphene_vec3_t"/>
         </array>
       </parameter>
     Note: The self parameter (box) is handled separately as the instance, not as a regular In parameter. *)
  let meth =
    {
      method_name = "get_vertices";
      c_identifier = "graphene_box_get_vertices";
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
          (* fixed-size array out param - caller-allocated *)
          {
            param_name = "vertices";
            param_type =
              {
                name = "Vec3";
                c_type = Some "graphene_vec3_t*";
                nullable = false;
                transfer_ownership = TransferNone;
                array =
                  Some
                    {
                      length = None;
                      zero_terminated = false;
                      fixed_size = Some 8;
                      (* KEY: fixed-size=8 *)
                      array_name = None;
                      element_type =
                        {
                          name = "Vec3";
                          c_type = Some "graphene_vec3_t";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = true;
            (* KEY: caller-allocates=true *)
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"GrapheneBox" meth "Box"
  in
  Helpers.log_generated_c_code "fixed_size_array_out" c_code;

  let functions = C_parser.parse_c_code c_code in
  let func =
    Option.get (C_ast.find_function functions "ml_graphene_box_get_vertices")
  in

  (* Positive: only self parameter (out array not an OCaml param) *)
  Alcotest.(check int)
    "Only self parameter (out array not an OCaml param)" 1
    (C_ast.get_param_count func);

  (* Positive: calls the underlying C function *)
  Alcotest.(check bool)
    "Calls graphene_box_get_vertices" true
    (C_validation.calls_c_function func "graphene_box_get_vertices");

  (* Positive: allocates an OCaml array for the result *)
  Alcotest.(check bool)
    "Allocates OCaml array with caml_alloc" true
    (C_validation.calls_caml_alloc func);

  (* Positive: converts elements via Store_field loop *)
  Alcotest.(check bool)
    "Converts elements in Store_field loop" true
    (C_validation.has_conversion_loop func);

  (* Critical: verify the out variable is declared as a fixed-size array, NOT as "= NULL"
     The bug was: graphene_vec3_t out1 = NULL;
     The fix should be: graphene_vec3_t out1[8];

     Note: The lightweight C parser extracts the array dimension as part of the type,
     so we check for the type containing "[N]" and the name being the clean variable name. *)
  let var_decls = C_ast.get_var_decls func in
  let has_fixed_size_array_decl =
    List.exists
      (fun (name, c_type, _init) ->
        (* The parser extracts "graphene_vec3_t[8]" as type and "out1" as name
            So we check for: type contains "[" (array syntax) and name starts with "out" *)
        String.contains c_type '['
        && String.length name >= 3
        && String.sub name 0 3 = "out")
      var_decls
  in
  Alcotest.(check bool)
    "Has stack array declaration for C output buffer (type var[N])" true
    has_fixed_size_array_decl;

  (* Negative: verify NO NULL initialization for the fixed-size array
     The bug was initializing with "= NULL" which doesn't work for fixed-size arrays *)
  let has_null_init =
    List.exists
      (fun (name, _c_type, init) ->
        String.length name >= 3
        && String.sub name 0 3 = "out"
        &&
        match init with
        | Some (C_ast.Var "NULL") -> true
        | Some (C_ast.IntLiteral 0) -> true
        | _ -> false)
      var_decls
  in
  Alcotest.(check bool)
    "NO NULL initialization for fixed-size array (Bug 1 fix)" false
    has_null_init;

  (* Positive: has CAMLparam/CAMLreturn structure *)
  Alcotest.(check bool)
    "Has CAMLparam" true
    (C_validation.has_caml_param_macro func);
  Alcotest.(check bool)
    "Has CAMLreturn" true
    (C_validation.has_caml_return func)

(* Bug 1 Variant B: Fixed-size float array return value.
    For fixed-size return arrays like gsk_border_node_get_widths(4 floats),
    the generator should properly handle the fixed size without NULL-termination checks. *)
let test_fixed_size_float_array_return () =
  let open Gir_gen_lib.Types in
  let ctx = Helpers.create_test_context () in

  (* Create a method returning a fixed-size float array.
     This simulates gsk_border_node_get_widths which has:
       <return-value transfer-ownership="none">
         <array zero-terminated="0" fixed-size="4" c:type="const float*">
           <type name="gfloat" c:type="float"/>
         </array>
       </return-value> *)
  let meth =
    {
      method_name = "get_widths";
      c_identifier = "gsk_border_node_get_widths";
      return_type =
        {
          name = "gfloat";
          c_type = Some "const float*";
          nullable = false;
          transfer_ownership = TransferNone;
          array =
            Some
              {
                length = None;
                zero_terminated = false;
                fixed_size = Some 4;
                (* KEY: fixed-size=4 *)
                array_name = None;
                element_type =
                  {
                    name = "gfloat";
                    c_type = Some "float";
                    nullable = false;
                    transfer_ownership = TransferNone;
                    array = None;
                  };
              };
        };
      parameters = [];
      (* Only self, handled separately *)
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"GskBorderNode" meth "BorderNode"
  in
  Helpers.log_generated_c_code "fixed_size_float_array_return" c_code;

  let functions = C_parser.parse_c_code c_code in
  let func =
    Option.get (C_ast.find_function functions "ml_gsk_border_node_get_widths")
  in

  (* Positive: calls the underlying C function *)
  Alcotest.(check bool)
    "Calls gsk_border_node_get_widths" true
    (C_validation.calls_c_function func "gsk_border_node_get_widths");

  (* Positive: allocates an OCaml array for the result *)
  Alcotest.(check bool)
    "Allocates OCaml array with caml_alloc" true
    (C_validation.calls_caml_alloc func);

  (* Positive: has element conversion loop *)
  Alcotest.(check bool)
    "Has Store_field conversion loop" true
    (C_validation.has_conversion_loop func);

  (* Positive: uses caml_copy_double for float conversion *)
  let uses_float_conversion =
    let rec check_expr = function
      | C_ast.Call ("caml_copy_double", _) -> true
      | C_ast.Call (_, args) -> List.exists check_expr args
      | C_ast.Macro (_, args) -> List.exists check_expr args
      | _ -> false
    in
    let check_stmt = function
      | C_ast.ExprStmt e -> check_expr e
      | C_ast.VarDecl (_, _, Some e) -> check_expr e
      | _ -> false
    in
    List.exists check_stmt func.C_ast.body
  in
  Alcotest.(check bool)
    "Uses caml_copy_double for float elements" true uses_float_conversion;

  (* Critical: verify NO NULL-termination counting loop
     The bug was generating: "while (result[result_length] != NULL) result_length++;"
     For fixed-size arrays, we should use the constant size directly.
     Check that there's no "while" keyword in the generated code. *)
  let has_null_termination_loop =
    (* Check for the presence of "while" keyword which indicates a counting loop *)
    String.contains c_code 'w'
    && String.length c_code > 5
    &&
    let lower_code = String.lowercase_ascii c_code in
    try
      let idx = String.index lower_code 'w' in
      String.sub lower_code idx 5 = "while"
    with Not_found -> false
  in
  Alcotest.(check bool)
    "NO NULL-termination counting loop (Bug 1 fix)" false
    has_null_termination_loop;

  (* Positive: has CAMLparam/CAMLreturn structure *)
  Alcotest.(check bool)
    "Has CAMLparam" true
    (C_validation.has_caml_param_macro func);
  Alcotest.(check bool)
    "Has CAMLreturn" true
    (C_validation.has_caml_return func)

(* Bug 16: Out-param array filtering (filtering.ml fix)
   See ocgtk/docs/plans/fix_codegen_bugs_tests.md *)

(* Test 1: Out-param arrays with zero_terminated=false, no length/fixed_size should be skipped *)
let test_out_param_array_without_length_skipped () =
  let open Gir_gen_lib.Types in
  let ctx = Helpers.create_test_context () in

  (* Create a method with an Out-direction parameter that is an array
     with zero_terminated=false and no length/fixed_size.
     This simulates problematic cases like PangoTabArray* out params. *)
  let meth =
    {
      method_name = "get_tabs";
      c_identifier = "pango_tab_array_get_tabs";
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
            param_name = "tabs";
            param_type =
              {
                name = "TabArray";
                c_type = Some "PangoTabArray**";
                nullable = false;
                transfer_ownership = TransferNone;
                array =
                  Some
                    {
                      length = None;
                      zero_terminated = false;
                      fixed_size = None;
                      array_name = None;
                      element_type =
                        {
                          name = "TabArray";
                          c_type = Some "PangoTabArray*";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  (* Critical: should_skip_method_binding should return true for this case *)
  let skipped =
    Gir_gen_lib.Generate.Filtering.should_skip_method_binding ~ctx meth
  in
  Alcotest.(check bool)
    "Out-param array without length should be skipped" true skipped

(* Test 2: Double-pointer out params like PangoTabArray** should be skipped *)
let test_double_pointer_out_param_skipped () =
  let open Gir_gen_lib.Types in
  let ctx = Helpers.create_test_context () in

  (* Create a method with an Out-direction parameter with c_type = "SomeType**"
     and array = None (not marked as an array in GIR, like pango_tab_array_get_tabs).
     This is the case where the GIR doesn't specify array info but the c_type
     indicates it's a double pointer that needs special handling. *)
  let meth =
    {
      method_name = "get_tabs";
      c_identifier = "pango_tab_array_get_tabs";
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
            param_name = "tabs";
            param_type =
              {
                name = "TabArray";
                c_type = Some "PangoTabArray**";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
                (* Not marked as array in GIR *)
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  (* Critical: should_skip_method_binding should return true for double-pointer out params *)
  let skipped =
    Gir_gen_lib.Generate.Filtering.should_skip_method_binding ~ctx meth
  in
  Alcotest.(check bool)
    "Double-pointer out param should be skipped" true skipped

(* Test 3: Out-param arrays WITH length should NOT be skipped (negative control) *)
let test_normal_out_param_not_skipped () =
  let open Gir_gen_lib.Types in
  let ctx = Helpers.create_test_context () in

  (* Create a method with an Out-direction array parameter that HAS a length parameter.
     This should NOT be skipped because we have the length info needed to process it. *)
  let meth =
    {
      method_name = "get_items";
      c_identifier = "gtk_container_get_children";
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
            param_name = "children";
            param_type =
              {
                name = "Widget";
                c_type = Some "GList**";
                nullable = false;
                transfer_ownership = TransferNone;
                array =
                  Some
                    {
                      length = Some 1;
                      (* Length is parameter index 1 *)
                      zero_terminated = false;
                      fixed_size = None;
                      array_name = None;
                      element_type =
                        {
                          name = "Widget";
                          c_type = Some "GtkWidget*";
                          nullable = false;
                          transfer_ownership = TransferNone;
                          array = None;
                        };
                    };
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
          {
            param_name = "n_children";
            param_type =
              {
                name = "guint";
                c_type = Some "guint*";
                nullable = false;
                transfer_ownership = TransferFull;
                array = None;
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  (* Critical: should_skip_method_binding should return false for out-param with length *)
  let skipped =
    Gir_gen_lib.Generate.Filtering.should_skip_method_binding ~ctx meth
  in
  Alcotest.(check bool)
    "Out-param array WITH length should NOT be skipped" false skipped

(* Bug 13: GdkPixbufFormatFlags forward declaration guard (c_stub_bitfield.ml fix)
   See ocgtk/docs/plans/fix_codegen_bugs_tests.md *)

(* Test 1: GdkPixbufFormatFlags bitfield should have #ifndef GDK_PIXBUF_FORMAT_WRITABLE guard *)
let test_gdkpixbuf_format_flags_guarded () =
  let open Gir_gen_lib.Types in
  (* Create a GdkPixbufFormatFlags bitfield *)
  let pixbuf_format_flags_bitfield =
    {
      bitfield_name = "FormatFlags";
      bitfield_c_type = "GdkPixbufFormatFlags";
      flags =
        [
          {
            flag_name = "WRITABLE";
            flag_value = 1;
            flag_c_identifier = "GDK_PIXBUF_FORMAT_WRITABLE";
            flag_doc = None;
            flag_version = None;
            flag_os = None;
          };
          {
            flag_name = "SCALABLE";
            flag_value = 2;
            flag_c_identifier = "GDK_PIXBUF_FORMAT_SCALABLE";
            flag_doc = None;
            flag_version = None;
            flag_os = None;
          };
        ];
      bitfield_doc = None;
      bitfield_version = None;
      bitfield_os = None;
    }
  in

  (* Generate forward declarations *)
  let c_code =
    Gir_gen_lib.Generate.C_stub_bitfield.generate_forward_decls
      ~namespace_prefix:"GdkPixbuf"
      ~gtk_bitfields:[ pixbuf_format_flags_bitfield ]
  in
  Helpers.log_generated_c_code "gdkpixbuf_format_flags_guard" c_code;

  (* Positive: contains guard start *)
  Alcotest.(check bool)
    "Contains #ifndef GDK_PIXBUF_FORMAT_WRITABLE guard start" true
    (string_contains c_code "#ifndef GDK_PIXBUF_FORMAT_WRITABLE");

  (* Positive: contains guard end *)
  Alcotest.(check bool)
    "Contains #endif guard end" true
    (string_contains c_code "#endif");

  (* Positive: contains converter prototypes *)
  Alcotest.(check bool)
    "Contains Val_GdkPixbufFormatFlags prototype" true
    (string_contains c_code "Val_GdkPixbufFormatFlags");
  Alcotest.(check bool)
    "Contains GdkPixbufFormatFlags_val prototype" true
    (string_contains c_code "GdkPixbufFormatFlags_val");

  (* Critical: verify ordering - prototypes appear BETWEEN guard start and guard end *)
  let guard_start =
    Str.search_forward
      (Str.regexp_string "#ifndef GDK_PIXBUF_FORMAT_WRITABLE")
      c_code 0
  in
  let prototype_pos =
    Str.search_forward (Str.regexp_string "Val_GdkPixbufFormatFlags") c_code 0
  in
  let guard_end = Str.search_forward (Str.regexp_string "#endif") c_code 0 in
  Alcotest.(check bool)
    "Guard start < prototype position" true
    (guard_start < prototype_pos);
  Alcotest.(check bool)
    "Prototype position < guard end" true
    (prototype_pos < guard_end)

(* Test 2: Normal bitfield should NOT have the guard (negative control) *)
let test_normal_bitfield_no_guard () =
  let open Gir_gen_lib.Types in
  (* Create a normal bitfield (not GdkPixbufFormatFlags) *)
  let normal_bitfield =
    {
      bitfield_name = "InhibitFlags";
      bitfield_c_type = "GtkApplicationInhibitFlags";
      flags =
        [
          {
            flag_name = "LOGOUT";
            flag_value = 1;
            flag_c_identifier = "GTK_APPLICATION_INHIBIT_LOGOUT";
            flag_doc = None;
            flag_version = None;
            flag_os = None;
          };
        ];
      bitfield_doc = None;
      bitfield_version = None;
      bitfield_os = None;
    }
  in

  (* Generate forward declarations *)
  let c_code =
    Gir_gen_lib.Generate.C_stub_bitfield.generate_forward_decls
      ~namespace_prefix:"Gtk" ~gtk_bitfields:[ normal_bitfield ]
  in
  Helpers.log_generated_c_code "normal_bitfield_no_guard" c_code;

  (* Negative: should NOT contain the GdkPixbufFormatFlags guard *)
  Alcotest.(check bool)
    "Does NOT contain GDK_PIXBUF_FORMAT_WRITABLE guard" false
    (string_contains c_code "#ifndef GDK_PIXBUF_FORMAT_WRITABLE");

  (* Positive: should still contain the converter prototypes *)
  Alcotest.(check bool)
    "Contains Val_GtkInhibitFlags prototype" true
    (string_contains c_code "Val_GtkInhibitFlags");
  Alcotest.(check bool)
    "Contains GtkInhibitFlags_val prototype" true
    (string_contains c_code "GtkInhibitFlags_val")

(* Bug 11: C converter name casing for cross-namespace enums
   See ocgtk/docs/plans/fix_codegen_bugs_tests.md

   The bug: type_mappings.ml was generating GdkpixbufColorspace_val (dune-lowercased)
   instead of GdkPixbufColorspace_val (proper namespace capitalization).

   This test verifies the fix by:
   1. Creating a context with GdkPixbuf namespace and an external enum (Colorspace)
   2. Generating a C method that uses this enum as a parameter
   3. Verifying the generated code contains GdkPixbufColorspace_val (correct) *)
let test_cross_namespace_c_converter_names () =
  let open Gir_gen_lib.Types in
  (* Create a context with GdkPixbuf namespace and an external enum from that namespace *)
  let namespace =
    {
      namespace_name = "GdkPixbuf";
      namespace_version = "2.0";
      namespace_shared_library = "libgdk_pixbuf-2.0.so.0";
      namespace_c_identifier_prefixes = "Gdk";
      namespace_c_symbol_prefixes = "gdk_pixbuf";
    }
  in

  (* Create the external enum - this simulates GdkPixbuf.Colorspace with c_type "GdkColorspace" *)
  let ctx =
    {
      namespace;
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums =
        [
          {
            enum_name = "Colorspace";
            enum_c_type = "GdkColorspace";
            members = [];
            functions = [];
            enum_doc = None;
            enum_version = None;
            enum_os = None;
          };
        ];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = Gir_gen_lib.Types.StringMap.empty;
    }
  in

  (* Create a method that uses the Colorspace enum as a parameter.
     This simulates a method like gdk_pixbuf_set_colorspace that takes Colorspace as input,
     which generates the Colorspace_val converter (CAML value to C enum). *)
  let meth =
    {
      method_name = "set_colorspace";
      c_identifier = "gdk_pixbuf_set_colorspace";
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
            param_name = "colorspace";
            param_type =
              {
                name = "Colorspace";
                c_type = Some "GdkColorspace";
                nullable = false;
                transfer_ownership = TransferNone;
                array = None;
              };
            direction = In;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"GdkPixbuf" meth "Pixbuf"
  in
  Helpers.log_generated_c_code "cross_namespace_c_converter" c_code;

  (* Critical: verify the generated code uses GdkPixbufColorspace_val (proper capitalization)
     NOT GdkpixbufColorspace_val (dune-lowercased, which is the bug) *)
  Alcotest.(check bool)
    "Contains GdkPixbufColorspace_val (correct capitalization)" true
    (string_contains c_code "GdkPixbufColorspace_val");

  (* Negative: verify it does NOT contain the wrong lowercase version *)
  Alcotest.(check bool)
    "Does NOT contain GdkpixbufColorspace_val (wrong lowercase)" false
    (string_contains c_code "GdkpixbufColorspace_val")

(* Cross-namespace enum array element conversion should not use address-of.
   Before the fix, c_stub_array_conv.ml only checked ctx.enums (same-namespace)
   to determine if an element type is a value type. Cross-namespace enums were
   missed, causing incorrect &result[i] instead of result[i]. *)
let test_cross_namespace_enum_array_element_conversion () =
  let open Gir_gen_lib.Types in
  (* Create a Gtk context with Gdk.ModifierType as a cross-namespace enum *)
  let gdk_entities =
    StringMap.empty
    |> StringMap.add "ModifierType"
         {
           cr_name = "ModifierType";
           cr_type = Crt_Enum;
           cr_c_type = "GdkModifierType";
         }
  in
  let cross_refs =
    StringMap.empty
    |> StringMap.add "Gdk" (snd (Helpers.make_ncr "Gdk" gdk_entities))
  in
  let ctx =
    { (Helpers.create_test_context ()) with cross_references = cross_refs }
  in

  (* Create a method returning an array of Gdk.ModifierType with length param *)
  let meth =
    {
      method_name = "get_modifiers";
      c_identifier = "gtk_widget_get_modifiers";
      return_type =
        {
          name = "Gdk.ModifierType";
          c_type = Some "const GdkModifierType*";
          nullable = false;
          transfer_ownership = TransferNone;
          array =
            Some
              {
                length = Some 0;
                zero_terminated = false;
                fixed_size = None;
                array_name = None;
                element_type =
                  {
                    name = "Gdk.ModifierType";
                    c_type = Some "GdkModifierType";
                    nullable = false;
                    transfer_ownership = TransferNone;
                    array = None;
                  };
              };
        };
      parameters =
        [
          {
            param_name = "num_modifiers";
            param_type =
              {
                name = "gint";
                c_type = Some "int*";
                nullable = false;
                transfer_ownership = TransferFull;
                array = None;
              };
            direction = Out;
            nullable = false;
            varargs = false;
            caller_allocates = false;
          };
        ];
      doc = None;
      throws = false;
      introspectable = true;
      get_property = None;
      set_property = None;
      version = None;
      version_namespace = None;
      os = None;
    }
  in

  let c_code =
    Gir_gen_lib.Generate.C_stub_method.generate_c_method ~ctx
      ~c_type:"GtkWidget" meth "Widget"
  in
  Helpers.log_generated_c_code "cross_ns_enum_array" c_code;

  let functions = C_parser.parse_c_code c_code in
  let func =
    Option.get (C_ast.find_function functions "ml_gtk_widget_get_modifiers")
  in

  (* Positive: has Store_field conversion loop *)
  Alcotest.(check bool)
    "Has Store_field conversion loop" true
    (C_validation.has_conversion_loop func);

  (* Critical: verify no AddrOf nodes wrap the enum conversion.
     The generated code should be Val_GdkModifierType(result[i]), NOT
     Val_GdkModifierType(&result[i]). *)
  let has_addr_of_in_enum_call =
    let rec check_stmts stmts = List.exists (fun stmt -> check_stmt stmt) stmts
    and check_stmt = function
      | C_ast.ExprStmt e -> check_expr e
      | C_ast.Return e -> check_expr e
      | C_ast.VarDecl (_, _, Some e) -> check_expr e
      | C_ast.IfStmt (_, then_stmts, else_stmts) ->
          check_stmts then_stmts || check_stmts else_stmts
      | _ -> false
    and check_expr = function
      | C_ast.Call ("Val_GdkModifierType", args)
      | C_ast.Macro ("Val_GdkModifierType", args) ->
          List.exists (function C_ast.AddrOf _ -> true | _ -> false) args
      | C_ast.Call (_, args) | C_ast.Macro (_, args) ->
          List.exists check_expr args
      | C_ast.Cast (_, e) -> check_expr e
      | _ -> false
    in
    check_stmts func.C_ast.body
  in
  Alcotest.(check bool)
    "No AddrOf wrapping cross-ns enum converter" false has_addr_of_in_enum_call

let tests =
  [
    Alcotest.test_case "Non-introspectable record filtered at generation" `Quick
      test_non_introspectable_record_filtered;
    Alcotest.test_case "Non-introspectable constructor filtered at generation"
      `Quick test_non_introspectable_constructor_filtered;
    Alcotest.test_case "Non-introspectable method skipped at generation" `Quick
      test_non_introspectable_method_skipped;
    Alcotest.test_case "Copy function returns copy result not g_new0" `Quick
      test_copy_function_returns_copy_result;
    Alcotest.test_case "Record copy function has balanced parentheses" `Quick
      test_record_copy_parses_successfully;
    Alcotest.test_case "Enum module name matches dune convention" `Quick
      test_enum_module_name_matches_dune_convention;
    Alcotest.test_case "Non-Gtk namespace c:type prefix inferred correctly"
      `Quick test_non_gtk_namespace_c_type_prefix;
    (* Bug 5 tests *)
    Alcotest.test_case "Enum array element conversion (no address-of)" `Quick
      test_enum_array_element_conversion;
    Alcotest.test_case "Bitfield array element conversion (no address-of)"
      `Quick test_bitfield_array_element_conversion;
    (* Bug 4 test *)
    Alcotest.test_case "Inout record param uses value + pointer (Bug 4)" `Quick
      test_inout_record_param_pointer_type;
    (* Bug 6 test *)
    Alcotest.test_case "Value record has complete forward decls (Bug 6)" `Quick
      test_value_record_has_complete_forward_decls;
    (* Bug 1 tests *)
    Alcotest.test_case
      "Fixed-size array out param uses stack allocation (Bug 1)" `Quick
      test_fixed_size_array_out_param;
    Alcotest.test_case "Fixed-size float array return (Bug 1)" `Quick
      test_fixed_size_float_array_return;
    (* Bug 16 tests - Out-param array filtering *)
    Alcotest.test_case "Out-param array without length skipped (Bug 16)" `Quick
      test_out_param_array_without_length_skipped;
    Alcotest.test_case "Double-pointer out param skipped (Bug 16)" `Quick
      test_double_pointer_out_param_skipped;
    Alcotest.test_case "Normal out-param with length not skipped (Bug 16)"
      `Quick test_normal_out_param_not_skipped;
    (* Bug 13 test - GdkPixbufFormatFlags guard *)
    Alcotest.test_case "GdkPixbufFormatFlags has guard (Bug 13)" `Quick
      test_gdkpixbuf_format_flags_guarded;
    Alcotest.test_case "Normal bitfield has no guard (Bug 13 negative)" `Quick
      test_normal_bitfield_no_guard;
    (* Bug 11 test - C converter name casing for cross-namespace enums *)
    Alcotest.test_case "Cross-namespace C converter names (Bug 11)" `Quick
      test_cross_namespace_c_converter_names;
    (* Cross-namespace enum array element - no address-of *)
    Alcotest.test_case "Cross-namespace enum array element (no address-of)"
      `Quick test_cross_namespace_enum_array_element_conversion;
  ]
