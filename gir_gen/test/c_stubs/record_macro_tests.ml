(* Record Macro Tests — validates that value-like record _val macros in generated
   forward declarations route through ml_gir_record_ptr_val rather than the
   legacy ext_of_val helper.  This covers the phase-3 generator fix in
   c_stub_record.ml. *)

open Type_factory

(* Build a minimal value-like record: non-opaque, has a copy method, and has a
   glib:get-type so it qualifies as a registered boxed type. *)
let make_value_like_record () =
  let copy_method =
    make_gir_method ~method_name:"copy" ~c_identifier:"test_rgba_copy"
      ~return_type:
        (make_gir_type ~name:"TestRGBA" ~c_type:"TestRGBA*"
           ~transfer_ownership:TransferFull ())
      ()
  in
  make_gir_record ~record_name:"TestRGBA" ~c_type:"TestRGBA"
    ~glib_get_type:"test_rgba_get_type" ~opaque:false ~methods:[ copy_method ]
    ()

(* Generate the forward-declaration header fragment for a single value-like
   record and return the string for inspection. *)
let generate_forward_decls_for record =
  Gir_gen_lib.Generate.C_stub_record.generate_forward_decls
    ~namespace_prefix:"test" ~records:[ record ]

(* ========================================================================= *)
(* Test: value-like _val macro uses ml_gir_record_ptr_val *)
(* ========================================================================= *)

let test_value_like_record_val_macro_uses_ml_gir_record_ptr_val () =
  (* Arrange *)
  let record = make_value_like_record () in
  (* Act *)
  let output = generate_forward_decls_for record in
  Helpers.log_generated_c_code "value-like record forward decls" output;
  (* Assert: the _val macro must reference ml_gir_record_ptr_val.
     C_validation.extract_forward_decls only extracts declaration *names*, not
     macro bodies, so we use Helpers.string_contains here — this is an
     acknowledged exception for checking C preprocessor directive bodies, as
     documented in helpers.ml. *)
  Alcotest.(check bool)
    "value-like _val macro contains ml_gir_record_ptr_val" true
    (Helpers.string_contains output "ml_gir_record_ptr_val")

(* ========================================================================= *)
(* Test (negative): value-like _val macro does NOT use ext_of_val *)
(* ========================================================================= *)

let test_value_like_record_val_macro_does_not_emit_ext_of_val () =
  (* Arrange *)
  let record = make_value_like_record () in
  (* Act *)
  let output = generate_forward_decls_for record in
  Helpers.log_generated_c_code "value-like record forward decls (neg)" output;
  (* Assert: the legacy ext_of_val helper must not appear in any _val macro.
     Same justification as above — macro body content is not modelled by the
     C AST layer, so string search is the only mechanism available here. *)
  Alcotest.(check bool)
    "value-like _val macro does not contain ext_of_val" false
    (Helpers.string_contains output "ext_of_val")

(* ========================================================================= *)
(* Test: the forward decl name (TestRGBA_val) is still present *)
(* ========================================================================= *)

let test_value_like_record_val_declaration_name_present () =
  (* Arrange *)
  let record = make_value_like_record () in
  (* Act *)
  let output = generate_forward_decls_for record in
  (* Assert: macro name exists — uses the proper AST-level helper *)
  C_validation.assert_forward_decl_exists output "TestRGBA_val" ""

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Value-like record _val macro uses ml_gir_record_ptr_val"
      `Quick test_value_like_record_val_macro_uses_ml_gir_record_ptr_val;
    Alcotest.test_case "Value-like record _val macro does not emit ext_of_val"
      `Quick test_value_like_record_val_macro_does_not_emit_ext_of_val;
    Alcotest.test_case "Value-like record _val forward declaration name present"
      `Quick test_value_like_record_val_declaration_name_present;
  ]
