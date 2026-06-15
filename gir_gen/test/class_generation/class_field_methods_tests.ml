(* L2 Class Field Method Generation Tests
 *
 * Unit tests for [Class_gen_field] — validates generated OCaml L2 class getter/
 * setter method implementations, method type signatures, and the module-level
 * [make] constructor and signature.  All tests are pure (no subprocess).
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
  let output = Buffer.contents buf in
  Helpers.assert_true "getter impl contains 'method get_x'"
    (Helpers.string_contains output "method get_x");
  Helpers.assert_true "getter impl calls Border.get_x obj"
    (Helpers.string_contains output "Border.get_x obj");
  Helpers.assert_true "getter impl has return type annotation 'int'"
    (Helpers.string_contains output ": int")

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
  let output = Buffer.contents buf in
  Helpers.assert_true "setter impl contains 'method set_x'"
    (Helpers.string_contains output "method set_x");
  Helpers.assert_true "setter impl has 'int -> unit' type"
    (Helpers.string_contains output "int -> unit");
  Helpers.assert_true "setter impl calls Border.set_x obj"
    (Helpers.string_contains output "Border.set_x obj")

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
  let output = Buffer.contents buf in
  Helpers.assert_true "getter sig contains 'method get_x'"
    (Helpers.string_contains output "method get_x");
  Helpers.assert_true "getter sig has return type 'int'"
    (Helpers.string_contains output ": int")

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
  let output = Buffer.contents buf in
  Helpers.assert_true "setter sig contains 'method set_x'"
    (Helpers.string_contains output "method set_x");
  Helpers.assert_true "setter sig has type 'int -> unit'"
    (Helpers.string_contains output "int -> unit")

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
  let output = Buffer.contents buf in
  Helpers.assert_true "no_getter: getter is absent"
    (not (Helpers.string_contains output "method get_x"));
  Helpers.assert_true "no_getter: setter is still present"
    (Helpers.string_contains output "method set_x")

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
  let output = Buffer.contents buf in
  Helpers.assert_true "no_setter: setter is absent"
    (not (Helpers.string_contains output "method set_x"));
  Helpers.assert_true "no_setter: getter is still present"
    (Helpers.string_contains output "method get_x")

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
  Helpers.assert_true "make fn contains 'let make'"
    (Helpers.string_contains output "let make");
  Helpers.assert_true "make fn has x parameter"
    (Helpers.string_contains output "(x : int)");
  Helpers.assert_true "make fn has y parameter"
    (Helpers.string_contains output "(y : int)");
  Helpers.assert_true "make fn returns border_t"
    (Helpers.string_contains output ": border_t");
  Helpers.assert_true "make fn delegates to Border.make"
    (Helpers.string_contains output "Border.make");
  Helpers.assert_true "make fn wraps in new border"
    (Helpers.string_contains output "new border")

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
  (* If a gir_method named "get_x" already exists, the field getter must not
     be emitted — it would create a duplicate method definition. *)
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
  let output = Buffer.contents buf in
  (* "GetX" snake-cases to "get_x", conflicting with the generated getter. *)
  Helpers.assert_true "conflict: getter is suppressed"
    (not (Helpers.string_contains output "method get_x"));
  Helpers.assert_true "conflict: setter is unaffected"
    (Helpers.string_contains output "method set_x")

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
