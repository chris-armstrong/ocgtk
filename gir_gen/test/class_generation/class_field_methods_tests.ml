(* L2 Class Field Method Generation Tests
 *
 * Unit tests for [Class_gen_field] — validates generated OCaml L2 class getter/
 * setter method implementations, method type signatures, and the module-level
 * [make] constructor and signature.  All tests are pure (no subprocess).
 * All OCaml output validation uses AST-based helpers (Ml_ast_helpers /
 * Ml_validation), not string matching.
 *)

open Type_factory

let create_ctx = Helpers.create_test_context

(* Build a [field_info] for a named field within the default "Border"/"GtkBorder"
   record context.  Fails the test if [compute_field_info] returns [None]. *)
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

(* Minimal gir_method stub used for conflict-detection tests. *)
let make_gir_method_stub name =
  make_gir_method ~method_name:name ~c_identifier:("c_" ^ name)
    ~return_type:void_type ()

(* Wrap a class body fragment in a full class definition for AST parsing. *)
let wrap_class_body body =
  Printf.sprintf "class test_class (obj : Border.t) = object (self)\n%s\nend"
    body

(* Wrap a class type body fragment in a full class type for AST parsing. *)
let wrap_class_type_body body =
  Printf.sprintf "class type test_class_type = object\n%s\nend" body

(* Wrap a val declaration in a module signature for AST parsing. *)
let wrap_val_sig body =
  Printf.sprintf "module type S = sig\n%s\nend" body

(* ========================================================================= *)
(* Test 1: getter method implementation *)
(* ========================================================================= *)

let test_getter_method_impl () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_methods ~ctx
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder"
    ~fields:[ field ] ~field_infos:[ fi ] ~methods:[] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_implementation (wrap_class_body body) in
  let cd =
    Helpers.expect_some "class test_class not found"
      (Ml_ast_helpers.find_class_definition ast "test_class")
      Fun.id
  in
  if not (Ml_ast_helpers.method_exists_as_definition cd.pci_expr "get_x") then
    Alcotest.fail "method get_x not generated";
  let method_field =
    Helpers.expect_some "method get_x not found"
      (Ml_ast_helpers.find_method_in_class cd.pci_expr "get_x")
      Fun.id
  in
  let method_type =
    Helpers.expect_some "method get_x has no type annotation"
      (Ml_ast_helpers.get_method_type method_field)
      Fun.id
  in
  let type_str = Ml_ast_helpers.core_type_to_string method_type in
  Alcotest.(check string) "getter return type" "int" type_str

(* ========================================================================= *)
(* Test 2: setter method implementation *)
(* ========================================================================= *)

let test_setter_method_impl () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_methods ~ctx
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder"
    ~fields:[ field ] ~field_infos:[ fi ] ~methods:[] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_implementation (wrap_class_body body) in
  let cd =
    Helpers.expect_some "class test_class not found"
      (Ml_ast_helpers.find_class_definition ast "test_class")
      Fun.id
  in
  if not (Ml_ast_helpers.method_exists_as_definition cd.pci_expr "set_x") then
    Alcotest.fail "method set_x not generated";
  let method_field =
    Helpers.expect_some "method set_x not found"
      (Ml_ast_helpers.find_method_in_class cd.pci_expr "set_x")
      Fun.id
  in
  let method_type =
    Helpers.expect_some "method set_x has no type annotation"
      (Ml_ast_helpers.get_method_type method_field)
      Fun.id
  in
  let type_str = Ml_ast_helpers.core_type_to_string method_type in
  Alcotest.(check string) "setter type" "int -> unit" type_str

(* ========================================================================= *)
(* Test 3: getter method signature *)
(* ========================================================================= *)

let test_getter_method_sig () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_method_sigs ~ctx
    ~current_layer2_module:"GBorder" ~fields:[ field ] ~field_infos:[ fi ]
    ~methods:[] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_interface (wrap_class_type_body body) in
  let ctd =
    Helpers.expect_some "class type test_class_type not found"
      (Ml_ast_helpers.find_class_type_declaration ast "test_class_type")
      Fun.id
  in
  if
    not
      (Ml_ast_helpers.method_signature_exists ctd.pci_expr "get_x")
  then Alcotest.fail "method get_x signature not found";
  let method_field =
    Helpers.expect_some "method get_x not found in class type"
      (Ml_ast_helpers.find_method_in_class_type ctd.pci_expr "get_x")
      Fun.id
  in
  let method_type =
    Helpers.expect_some "method get_x has no type annotation"
      (Ml_ast_helpers.get_method_type_from_class_type_field method_field)
      Fun.id
  in
  let type_str = Ml_ast_helpers.core_type_to_string method_type in
  Alcotest.(check string) "getter sig return type" "int" type_str

(* ========================================================================= *)
(* Test 4: setter method signature *)
(* ========================================================================= *)

let test_setter_method_sig () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_method_sigs ~ctx
    ~current_layer2_module:"GBorder" ~fields:[ field ] ~field_infos:[ fi ]
    ~methods:[] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_interface (wrap_class_type_body body) in
  let ctd =
    Helpers.expect_some "class type test_class_type not found"
      (Ml_ast_helpers.find_class_type_declaration ast "test_class_type")
      Fun.id
  in
  if
    not
      (Ml_ast_helpers.method_signature_exists ctd.pci_expr "set_x")
  then Alcotest.fail "method set_x signature not found";
  let method_field =
    Helpers.expect_some "method set_x not found in class type"
      (Ml_ast_helpers.find_method_in_class_type ctd.pci_expr "set_x")
      Fun.id
  in
  let method_type =
    Helpers.expect_some "method set_x has no type annotation"
      (Ml_ast_helpers.get_method_type_from_class_type_field method_field)
      Fun.id
  in
  let type_str = Ml_ast_helpers.core_type_to_string method_type in
  Alcotest.(check string) "setter sig type" "int -> unit" type_str

(* ========================================================================= *)
(* Test 5: no_getter suppresses getter in class body *)
(* ========================================================================= *)

let test_no_getter_suppresses_method_impl () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ~no_getter:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_methods ~ctx
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder"
    ~fields:[ field ] ~field_infos:[ fi ] ~methods:[] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_implementation (wrap_class_body body) in
  let cd =
    Helpers.expect_some "class test_class not found"
      (Ml_ast_helpers.find_class_definition ast "test_class")
      Fun.id
  in
  if Ml_ast_helpers.method_exists_as_definition cd.pci_expr "get_x" then
    Alcotest.fail "no_getter: getter should be absent";
  if
    not (Ml_ast_helpers.method_exists_as_definition cd.pci_expr "set_x")
  then Alcotest.fail "no_getter: setter should still be present"

(* ========================================================================= *)
(* Test 6: no_setter suppresses setter in class body *)
(* ========================================================================= *)

let test_no_setter_suppresses_method_impl () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ~no_setter:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_methods ~ctx
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder"
    ~fields:[ field ] ~field_infos:[ fi ] ~methods:[] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_implementation (wrap_class_body body) in
  let cd =
    Helpers.expect_some "class test_class not found"
      (Ml_ast_helpers.find_class_definition ast "test_class")
      Fun.id
  in
  if Ml_ast_helpers.method_exists_as_definition cd.pci_expr "set_x" then
    Alcotest.fail "no_setter: setter should be absent";
  if
    not (Ml_ast_helpers.method_exists_as_definition cd.pci_expr "get_x")
  then Alcotest.fail "no_setter: getter should still be present"

(* ========================================================================= *)
(* Test 7: make function implementation *)
(* ========================================================================= *)

let test_make_function_impl () =
  let ctx = create_ctx () in
  let fields =
    [
      make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
        ~writable:true ();
      make_gir_record_field ~field_name:"y" ~field_type:gint_type ~readable:true
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
  Alcotest.(check int) "two field_infos computed" 2 (List.length field_infos);
  let buf = Buffer.create 128 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_make_fn ~ctx
    ~class_snake:"border" ~class_type_name:"border_t"
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder" ~field_infos
    ~buf;
  let output = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_implementation output in
  let _vb =
    Helpers.expect_some "let make not found"
      (Ml_ast_helpers.find_let_binding ast "make")
      Fun.id
  in
  Helpers.assert_true "make fn returns border_t"
    (Helpers.string_contains output ": border_t")

(* ========================================================================= *)
(* Test 8: make function signature *)
(* ========================================================================= *)

let test_make_function_sig () =
  let ctx = create_ctx () in
  let fields =
    [
      make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
        ~writable:true ();
      make_gir_record_field ~field_name:"y" ~field_type:gint_type ~readable:true
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
  let buf = Buffer.create 128 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_make_fn_sig ~ctx
    ~class_type_name:"border_t" ~current_layer2_module:"GBorder" ~field_infos
    ~buf;
  let output = Buffer.contents buf in
  Helpers.assert_true "make sig contains 'val make'"
    (Helpers.string_contains output "val make");
  Helpers.assert_true "make sig has int -> int -> border_t type"
    (Helpers.string_contains output "int -> int -> border_t")

(* ========================================================================= *)
(* Test 9: empty field_infos produce no make output *)
(* ========================================================================= *)

let test_empty_field_infos_no_make () =
  let ctx = create_ctx () in
  let buf = Buffer.create 16 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_make_fn ~ctx
    ~class_snake:"border" ~class_type_name:"border_t"
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder"
    ~field_infos:[] ~buf;
  Alcotest.(check string)
    "empty field_infos produce no make impl" "" (Buffer.contents buf);
  let buf2 = Buffer.create 16 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_make_fn_sig ~ctx
    ~class_type_name:"border_t" ~current_layer2_module:"GBorder"
    ~field_infos:[] ~buf:buf2;
  Alcotest.(check string)
    "empty field_infos produce no make sig" "" (Buffer.contents buf2)

(* ========================================================================= *)
(* Test 10: method name conflict suppresses getter *)
(* ========================================================================= *)

let test_method_conflict_suppresses_getter () =
  let field =
    make_gir_record_field ~field_name:"x" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let ctx = create_ctx () in
  let conflicting_method = make_gir_method_stub "GetX" in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Class_gen_field.generate_field_methods ~ctx
    ~layer1_module_name:"Border" ~current_layer2_module:"GBorder"
    ~fields:[ field ] ~field_infos:[ fi ]
    ~methods:[ conflicting_method ] ~buf;
  let body = Buffer.contents buf in
  let ast = Ml_ast_helpers.parse_implementation (wrap_class_body body) in
  let cd =
    Helpers.expect_some "class test_class not found"
      (Ml_ast_helpers.find_class_definition ast "test_class")
      Fun.id
  in
  if Ml_ast_helpers.method_exists_as_definition cd.pci_expr "get_x" then
    Alcotest.fail "conflict: getter should be suppressed";
  if
    not (Ml_ast_helpers.method_exists_as_definition cd.pci_expr "set_x")
  then Alcotest.fail "conflict: setter should be unaffected"

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "getter method impl" `Quick test_getter_method_impl;
    Alcotest.test_case "setter method impl" `Quick test_setter_method_impl;
    Alcotest.test_case "getter method sig" `Quick test_getter_method_sig;
    Alcotest.test_case "setter method sig" `Quick test_setter_method_sig;
    Alcotest.test_case "no_getter suppresses getter impl" `Quick
      test_no_getter_suppresses_method_impl;
    Alcotest.test_case "no_setter suppresses setter impl" `Quick
      test_no_setter_suppresses_method_impl;
    Alcotest.test_case "make function impl" `Quick test_make_function_impl;
    Alcotest.test_case "make function sig" `Quick test_make_function_sig;
    Alcotest.test_case "empty field_infos produce no make" `Quick
      test_empty_field_infos_no_make;
    Alcotest.test_case "method conflict suppresses getter" `Quick
      test_method_conflict_suppresses_getter;
  ]
