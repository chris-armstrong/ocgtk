(* C Stub Generation Tests - validates generated C code using lightweight parser *)

open Printf
open Gir_gen_lib.Types

(* ========================================================================= *)
(* Lightweight Parser Helper Functions *)
(* ========================================================================= *)

(* Parse C code string and return our AST *)
let parse_c_string c_code =
  C_parser.parse_c_code c_code

(* Find a function by name *)
let find_function functions name =
  C_ast.find_function functions name

(* Check if a function exists *)
let assert_function_exists functions name =
  match find_function functions name with
  | Some _ -> ()
  | None ->
      let available = List.map (fun f -> f.C_ast.name) functions in
      Alcotest.fail (sprintf "Function '%s' not found. Available: %s"
        name (String.concat ", " available))

(* Get function name *)
let get_function_name f = f.C_ast.name

(* Count parameters *)
let count_function_params f = C_ast.get_param_count f

(* Check if function has return statement *)
let has_return_statement f = C_ast.has_return_stmt f.C_ast.body

(* ========================================================================= *)
(* Test Context Setup *)
(* ========================================================================= *)

(* Use the shared helper from Helpers module *)
let create_test_context = Helpers.create_test_context

(* ========================================================================= *)
(* Constructor Generation Tests *)
(* ========================================================================= *)

let test_simple_constructor () =
  let ctx = create_test_context () in
  let ctor = {
    ctor_name = "new";
    c_identifier = "gtk_button_new";
    ctor_parameters = [];
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkButton" ctor "Button" in

  (* Parse the generated C code *)
  let functions = parse_c_string c_code in

  (* Should have exactly one function *)
  Alcotest.(check int) "Should generate one function" 1 (List.length functions);

  (* Function should be named ml_gtk_button_new *)
  assert_function_exists functions "ml_gtk_button_new";

  (* Function should have a return statement *)
  let func = Option.get (find_function functions "ml_gtk_button_new") in
  Alcotest.(check bool) "Should have return statement" true
    (has_return_statement func)

let test_constructor_with_params () =
  let ctx = create_test_context () in
  let ctor = {
    ctor_name = "new_with_label";
    c_identifier = "gtk_button_new_with_label";
    ctor_parameters = [
      {
        param_name = "label";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkButton" ctor "Button" in

  let functions = parse_c_string c_code in

  assert_function_exists functions "ml_gtk_button_new_with_label";

  let func = Option.get (find_function functions "ml_gtk_button_new_with_label") in
  let param_count = count_function_params func in

  (* Should have 1 parameter (label) *)
  Alcotest.(check int) "Should have 1 parameter" 1 param_count

let test_constructor_many_params () =
  let ctx = create_test_context () in

  (* Create constructor with 6 parameters to trigger bytecode/native split *)
  let params = List.init 6 (fun i ->
    {
      param_name = sprintf "arg%d" (i + 1);
      param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone };
      direction = In;
      nullable = false;
      varargs = false;
    }
  ) in

  let ctor = {
    ctor_name = "new_complex";
    c_identifier = "gtk_widget_new_complex";
    ctor_parameters = params;
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkWidget" ctor "Widget" in

  let functions = parse_c_string c_code in

  (* Should generate 2 functions: _native and _bytecode *)
  Alcotest.(check int) "Should generate 2 functions (native + bytecode)" 2
    (List.length functions);

  assert_function_exists functions "ml_gtk_widget_new_complex_native";
  assert_function_exists functions "ml_gtk_widget_new_complex_bytecode"

(* ========================================================================= *)
(* Method Generation Tests *)
(* ========================================================================= *)

let test_simple_method () =
  let ctx = create_test_context () in
  let meth = {
    method_name = "set_label";
    c_identifier = "gtk_button_set_label";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "label";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkButton" meth "Button" in

  let functions = parse_c_string c_code in

  Alcotest.(check int) "Should generate one function" 1 (List.length functions);

  assert_function_exists functions "ml_gtk_button_set_label";

  let func = Option.get (find_function functions "ml_gtk_button_set_label") in
  let param_count = count_function_params func in

  (* Should have 2 parameters: self + label *)
  Alcotest.(check int) "Should have 2 parameters (self + label)" 2 param_count

let test_method_with_return_value () =
  let ctx = create_test_context () in
  let meth = {
    method_name = "get_label";
    c_identifier = "gtk_button_get_label";
    return_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkButton" meth "Button" in

  let functions = parse_c_string c_code in

  assert_function_exists functions "ml_gtk_button_get_label";

  let func = Option.get (find_function functions "ml_gtk_button_get_label") in

  (* Should have a return statement *)
  Alcotest.(check bool) "Should have return statement" true
    (has_return_statement func)

(* ========================================================================= *)
(* Type Validation Tests *)
(* ========================================================================= *)

let test_constructor_type_conversion () =
  let ctx = create_test_context () in
  let ctor = {
    ctor_name = "new";
    c_identifier = "gtk_button_new";
    ctor_parameters = [];
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkButton" ctor "Button" in

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_button_new") in

  (* Should use Val_GtkButton macro for return conversion *)
  Alcotest.(check bool) "Uses correct return conversion macro" true
    (C_validation.validates_gtk_constructor func "GtkButton")

let test_method_calls_c_function () =
  let ctx = create_test_context () in
  let meth = {
    method_name = "set_label";
    c_identifier = "gtk_button_set_label";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "label";
        param_type = { name = "utf8"; c_type = Some "const gchar*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkButton" meth "Button" in

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_button_set_label") in

  (* Should call gtk_button_set_label *)
  Alcotest.(check bool) "Calls underlying C function" true
    (C_validation.calls_c_function func "gtk_button_set_label")

let test_variable_declarations () =
  let ctx = create_test_context () in
  let ctor = {
    ctor_name = "new";
    c_identifier = "gtk_button_new";
    ctor_parameters = [];
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkButton" ctor "Button" in

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_button_new") in

  (* Extract variable declarations *)
  let var_decls = C_ast.get_var_decls func in

  (* Should declare 'obj' variable of type GtkButton* *)
  Alcotest.(check bool) "Declares obj variable" true
    (List.exists (fun (name, var_type, _) ->
      name = "obj" && String.starts_with ~prefix:"GtkButton" var_type
    ) var_decls)

let test_parameter_flow_to_return () =
  let ctx = create_test_context () in
  let ctor = {
    ctor_name = "new";
    c_identifier = "gtk_button_new";
    ctor_parameters = [];
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkButton" ctor "Button" in

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_button_new") in

  (* Check that 'obj' variable flows to return value *)
  let type_info = C_ast.extract_type_info func in
  match type_info.return_expr with
  | Some expr ->
      (* The return should involve 'obj' *)
      Alcotest.(check bool) "Return expression uses obj variable" true
        (C_ast.expr_uses_var expr "obj")
  | None ->
      Alcotest.fail "No return expression found"

let test_bytecode_calls_native () =
  let ctx = create_test_context () in

  let params = List.init 6 (fun i ->
    {
      param_name = sprintf "arg%d" (i + 1);
      param_type = { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone };
      direction = In;
      nullable = false;
      varargs = false;
    }
  ) in

  let ctor = {
    ctor_name = "new_complex";
    c_identifier = "gtk_widget_new_complex";
    ctor_parameters = params;
    ctor_doc = None;
    throws = false;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_constructor
    ~ctx ~c_type:"GtkWidget" ctor "Widget" in

  let functions = parse_c_string c_code in

  (* Verify bytecode/native pair is correct *)
  Alcotest.(check bool) "Bytecode/native pair properly structured" true
    (C_validation.validates_bytecode_native_pair functions "ml_gtk_widget_new_complex")

(* ========================================================================= *)
(* Record Type Tests *)
(* ========================================================================= *)

let test_non_opaque_record_return () =
  let ctx = Helpers.create_test_context () in

  (* Add a non-opaque record to the context *)
  let test_record = {
    Gir_gen_lib.Types.record_name = "TestRecord";
    c_type = "GtkTestRecord";
    glib_type_name = Some "GtkTestRecord";
    glib_get_type = Some "gtk_test_record_get_type";
    fields = [
      {
        field_name = "width";
        field_type = Some { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone };
        readable = true;
        writable = false;
        field_doc = None;
      }
    ];
    constructors = [];
    methods = [];
    c_symbol_prefix = None;
    is_gtype_struct_for = None;
    disguised = false;
    opaque = false;
    record_doc = None;
  } in

  let ctx = { ctx with records = [test_record] } in

  let meth = {
    method_name = "get_record";
    c_identifier = "gtk_widget_get_record";
    return_type = { name = "TestRecord"; c_type = Some "GtkTestRecord*"; nullable = false; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "non-opaque record return" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_record") in

  (* Should use Val_GtkTestRecord for return conversion *)
  Alcotest.(check bool) "Uses Val_GtkTestRecord conversion" true
    (C_validation.validates_gtk_constructor func "GtkTestRecord")

let test_non_opaque_record_parameter () =
  let ctx = Helpers.create_test_context () in

  let test_record = {
    Gir_gen_lib.Types.record_name = "TestRecord";
    c_type = "GtkTestRecord";
    glib_type_name = Some "GtkTestRecord";
    glib_get_type = Some "gtk_test_record_get_type";
    fields = [
      {
        field_name = "width";
        field_type = Some { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone };
        readable = true;
        writable = false;
        field_doc = None;
      }
    ];
    constructors = [];
    methods = [];
    c_symbol_prefix = None;
    is_gtype_struct_for = None;
    disguised = false;
    opaque = false;
    record_doc = None;
  } in

  let ctx = { ctx with records = [test_record] } in

  let meth = {
    method_name = "set_record";
    c_identifier = "gtk_widget_set_record";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "record";
        param_type = { name = "TestRecord"; c_type = Some "GtkTestRecord*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "non-opaque record parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_set_record") in

  (* Should have 2 params: self + record *)
  Alcotest.(check int) "Has 2 parameters" 2
    (C_ast.get_param_count func);

  (* Should call the C function *)
  Alcotest.(check bool) "Calls C function" true
    (C_validation.calls_c_function func "gtk_widget_set_record")

let test_opaque_record_return () =
  let ctx = Helpers.create_test_context () in

  (* Add an opaque record to the context *)
  let opaque_record = {
    Gir_gen_lib.Types.record_name = "OpaqueRec";
    c_type = "GtkOpaqueRec";
    glib_type_name = None;
    glib_get_type = None;
    fields = [];
    constructors = [];
    methods = [];
    c_symbol_prefix = None;
    is_gtype_struct_for = None;
    disguised = true;
    opaque = true;
    record_doc = None;
  } in

  let ctx = { ctx with records = [opaque_record] } in

  let meth = {
    method_name = "get_opaque";
    c_identifier = "gtk_widget_get_opaque";
    return_type = { name = "OpaqueRec"; c_type = Some "GtkOpaqueRec*"; nullable = false; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "opaque record return" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_opaque") in

  (* Should use Val_GtkOpaqueRec for return conversion *)
  Alcotest.(check bool) "Uses Val_GtkOpaqueRec conversion" true
    (C_validation.validates_gtk_constructor func "GtkOpaqueRec")

let test_opaque_record_parameter () =
  let ctx = Helpers.create_test_context () in

  let opaque_record = {
    Gir_gen_lib.Types.record_name = "OpaqueRec";
    c_type = "GtkOpaqueRec";
    glib_type_name = None;
    glib_get_type = None;
    fields = [];
    constructors = [];
    methods = [];
    c_symbol_prefix = None;
    is_gtype_struct_for = None;
    disguised = true;
    opaque = true;
    record_doc = None;
  } in

  let ctx = { ctx with records = [opaque_record] } in

  let meth = {
    method_name = "set_opaque";
    c_identifier = "gtk_widget_set_opaque";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "opaque";
        param_type = { name = "OpaqueRec"; c_type = Some "GtkOpaqueRec*"; nullable = false; transfer_ownership = TransferNone };
        direction = In;
        nullable = false;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "opaque record parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_set_opaque") in

  (* Should have 2 params: self + opaque *)
  Alcotest.(check int) "Has 2 parameters" 2
    (C_ast.get_param_count func);

  (* Should call the C function *)
  Alcotest.(check bool) "Calls C function" true
    (C_validation.calls_c_function func "gtk_widget_set_opaque")

let test_nullable_record_return () =
  let ctx = Helpers.create_test_context () in

  let test_record = {
    Gir_gen_lib.Types.record_name = "TestRecord";
    c_type = "GtkTestRecord";
    glib_type_name = Some "GtkTestRecord";
    glib_get_type = Some "gtk_test_record_get_type";
    fields = [
      {
        field_name = "width";
        field_type = Some { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone };
        readable = true;
        writable = false;
        field_doc = None;
      }
    ];
    constructors = [];
    methods = [];
    c_symbol_prefix = None;
    is_gtype_struct_for = None;
    disguised = false;
    opaque = false;
    record_doc = None;
  } in

  let ctx = { ctx with records = [test_record] } in

  let meth = {
    method_name = "get_nullable_record";
    c_identifier = "gtk_widget_get_nullable_record";
    return_type = { name = "TestRecord"; c_type = Some "GtkTestRecord*"; nullable = true; transfer_ownership = TransferNone };
    parameters = [];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "nullable record return" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_get_nullable_record") in

  (* Should have return statement *)
  Alcotest.(check bool) "Has return statement" true
    (C_ast.has_return_stmt func.C_ast.body)

let test_nullable_record_parameter () =
  let ctx = Helpers.create_test_context () in

  let test_record = {
    Gir_gen_lib.Types.record_name = "TestRecord";
    c_type = "GtkTestRecord";
    glib_type_name = Some "GtkTestRecord";
    glib_get_type = Some "gtk_test_record_get_type";
    fields = [
      {
        field_name = "width";
        field_type = Some { name = "gint"; c_type = Some "gint"; nullable = false; transfer_ownership = TransferNone };
        readable = true;
        writable = false;
        field_doc = None;
      }
    ];
    constructors = [];
    methods = [];
    c_symbol_prefix = None;
    is_gtype_struct_for = None;
    disguised = false;
    opaque = false;
    record_doc = None;
  } in

  let ctx = { ctx with records = [test_record] } in

  let meth = {
    method_name = "set_nullable_record";
    c_identifier = "gtk_widget_set_nullable_record";
    return_type = { name = "none"; c_type = Some "void"; nullable = false; transfer_ownership = TransferNone };
    parameters = [
      {
        param_name = "record";
        param_type = { name = "TestRecord"; c_type = Some "GtkTestRecord*"; nullable = true; transfer_ownership = TransferNone };
        direction = In;
        nullable = true;
        varargs = false;
      }
    ];
    doc = None;
    throws = false;
    get_property = None;
    set_property = None;
  } in

  let c_code = Gir_gen_lib.Generate.C_stubs.generate_c_method
    ~ctx ~c_type:"GtkWidget" meth "Widget" in

  Helpers.log_generated_c_code "nullable record parameter" c_code;

  let functions = parse_c_string c_code in
  let func = Option.get (find_function functions "ml_gtk_widget_set_nullable_record") in

  (* Should have 2 params: self + record *)
  Alcotest.(check int) "Has 2 parameters" 2
    (C_ast.get_param_count func);

  (* Should call the C function *)
  Alcotest.(check bool) "Calls C function" true
    (C_validation.calls_c_function func "gtk_widget_set_nullable_record")

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    (* Constructor tests *)
    Alcotest.test_case "Simple constructor (0 params)" `Quick test_simple_constructor;
    Alcotest.test_case "Constructor with parameters" `Quick test_constructor_with_params;
    Alcotest.test_case "Constructor with 6+ params (bytecode/native split)" `Quick test_constructor_many_params;

    (* Method tests *)
    Alcotest.test_case "Simple method (void return)" `Quick test_simple_method;
    Alcotest.test_case "Method with return value" `Quick test_method_with_return_value;

    (* Type validation tests *)
    Alcotest.test_case "Constructor uses correct type conversion" `Quick test_constructor_type_conversion;
    Alcotest.test_case "Method calls underlying C function" `Quick test_method_calls_c_function;
    Alcotest.test_case "Variable declarations are parsed" `Quick test_variable_declarations;
    Alcotest.test_case "Parameter flow to return value" `Quick test_parameter_flow_to_return;
    Alcotest.test_case "Bytecode calls native function" `Quick test_bytecode_calls_native;

    (* Record type tests *)
    Alcotest.test_case "Non-opaque record return type" `Quick test_non_opaque_record_return;
    Alcotest.test_case "Non-opaque record parameter" `Quick test_non_opaque_record_parameter;
    Alcotest.test_case "Opaque record return type" `Quick test_opaque_record_return;
    Alcotest.test_case "Opaque record parameter" `Quick test_opaque_record_parameter;
    Alcotest.test_case "Nullable record return type" `Quick test_nullable_record_return;
    Alcotest.test_case "Nullable record parameter" `Quick test_nullable_record_parameter;
  ]
