(* Field Accessor External Declaration Tests
 *
 * Unit tests for [Layer1_field] — validates generated OCaml [external]
 * declarations for record field getters, setters, and the [make] constructor.
 * All tests are pure (no subprocess).
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

(* ========================================================================= *)
(* Test 1: getter external declaration *)
(* ========================================================================= *)

let test_getter_external_decl () =
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Layer1.Layer1_field.generate_field_getter_decl ~buf fi;
  let output = Buffer.contents buf in
  Helpers.assert_true "getter decl contains 'get_left'"
    (Helpers.string_contains output "get_left");
  Helpers.assert_true "getter decl has correct type annotation 't -> int'"
    (Helpers.string_contains output "t -> int");
  Helpers.assert_true "getter decl references C name"
    (Helpers.string_contains output "ml_gtk_border_get_left")

(* ========================================================================= *)
(* Test 2: setter external declaration *)
(* ========================================================================= *)

let test_setter_external_decl () =
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ()
  in
  let fi = compute_fi ~field () in
  let buf = Buffer.create 64 in
  Gir_gen_lib.Generate.Layer1.Layer1_field.generate_field_setter_decl ~buf fi;
  let output = Buffer.contents buf in
  Helpers.assert_true "setter decl contains 'set_left'"
    (Helpers.string_contains output "set_left");
  Helpers.assert_true "setter decl has correct type annotation 't -> int -> unit'"
    (Helpers.string_contains output "t -> int -> unit");
  Helpers.assert_true "setter decl references C name"
    (Helpers.string_contains output "ml_gtk_border_set_left")

(* ========================================================================= *)
(* Test 3: make decl for ≤5 fields — simple form *)
(* ========================================================================= *)

let test_make_decl_few_fields () =
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
  Gir_gen_lib.Generate.Layer1.Layer1_field.generate_field_make_decl ~buf
    field_infos;
  let output = Buffer.contents buf in
  (* Simple form: single C name, no bytecode/native split *)
  Helpers.assert_true "make decl uses simple external form"
    (Helpers.string_contains output "\"ml_gtk_border_make\"");
  Helpers.assert_true "make decl has correct arity (int -> int -> t)"
    (Helpers.string_contains output "int -> int -> t")

(* ========================================================================= *)
(* Test 4: make decl for >5 fields — bytecode/native form *)
(* ========================================================================= *)

let test_make_decl_many_fields () =
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
  let buf = Buffer.create 256 in
  Gir_gen_lib.Generate.Layer1.Layer1_field.generate_field_make_decl ~buf
    field_infos;
  let output = Buffer.contents buf in
  Helpers.assert_true "make decl (>5) contains _bytecode entry"
    (Helpers.string_contains output "ml_gtk_border_make_bytecode");
  Helpers.assert_true "make decl (>5) contains _native entry"
    (Helpers.string_contains output "ml_gtk_border_make_native")

(* ========================================================================= *)
(* Test 5: no_getter — getter decl absent from generate_field_getters output *)
(* ========================================================================= *)

let test_no_getter_decl_absent () =
  (* [generate_field_getters] is called with only those fields that pass
     [Field_filter.should_generate_field_getter].  When the caller filters
     correctly, an empty list produces empty output.  We emulate the pipeline:
     build the field, filter, then call generate_field_getters. *)
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ~no_getter:true ()
  in
  let passes_getter_filter =
    Gir_gen_lib.Generate.Field_filter.should_generate_field_getter field
  in
  Alcotest.(check bool) "no_getter field is filtered out" false
    passes_getter_filter;
  (* Confirm: passing an empty list gives empty output *)
  let buf = Buffer.create 16 in
  Gir_gen_lib.Generate.Layer1.Layer1_field.generate_field_getters ~buf [];
  Alcotest.(check string) "empty getter list gives empty output" ""
    (Buffer.contents buf)

(* ========================================================================= *)
(* Test 6: no_setter — setter decl absent from generate_field_setters output *)
(* ========================================================================= *)

let test_no_setter_decl_absent () =
  let field =
    make_gir_record_field ~field_name:"left" ~field_type:gint_type ~readable:true
      ~writable:true ~no_setter:true ()
  in
  let passes_setter_filter =
    Gir_gen_lib.Generate.Field_filter.should_generate_field_setter field
  in
  Alcotest.(check bool) "no_setter field is filtered out" false
    passes_setter_filter;
  let buf = Buffer.create 16 in
  Gir_gen_lib.Generate.Layer1.Layer1_field.generate_field_setters ~buf [];
  Alcotest.(check string) "empty setter list gives empty output" ""
    (Buffer.contents buf)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "getter external decl" `Quick test_getter_external_decl;
    Alcotest.test_case "setter external decl" `Quick test_setter_external_decl;
    Alcotest.test_case "make decl for ≤5 fields (simple form)" `Quick
      test_make_decl_few_fields;
    Alcotest.test_case "make decl for >5 fields (bytecode/native)" `Quick
      test_make_decl_many_fields;
    Alcotest.test_case "no_getter — getter decl absent" `Quick
      test_no_getter_decl_absent;
    Alcotest.test_case "no_setter — setter decl absent" `Quick
      test_no_setter_decl_absent;
  ]
