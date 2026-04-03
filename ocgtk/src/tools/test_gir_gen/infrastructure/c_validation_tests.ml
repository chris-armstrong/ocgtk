(* C Validation Tests - Unit tests for C_validation module *)

(* ========================================================================= *)
(* Test Data *)
(* ========================================================================= *)

(* Sample header content with forward declarations for local enums *)
let sample_header_with_decls =
  {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

/* Forward declarations for GtkWrapMode */
#define Val_GtkWrapMode(v) (Val_int(v))
#define GtkWrapMode_val(v) (Int_val(v))

/* Forward declarations for GtkStateFlags */
#define Val_GtkStateFlags(v) (Val_int(v))
#define GtkStateFlags_val(v) (Int_val(v))

#endif /* _gtk_decls_h_ */
|}

(* Sample header content without specific forward declarations *)
let sample_header_without_decls =
  {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

/* Some other macros */
#define GTK_TYPE_BUTTON (gtk_button_get_type())

#endif /* _gtk_decls_h_ */
|}

(* Sample header with complete guard *)
let sample_header_complete_guard =
  {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

/* Content */

#endif /* _gtk_decls_h_ */
|}

(* Sample header with incomplete guard (missing define) *)
let sample_header_incomplete_guard =
  {|
#ifndef _gdk_decls_h_

/* Content */

#endif /* _gdk_decls_h_ */
|}

(* ========================================================================= *)
(* Test Cases *)
(* ========================================================================= *)

let test_assert_forward_decl_exists () =
  (* Test that assert_forward_decl_exists succeeds when declaration is present *)
  (* Check for Val_<Type> pattern *)
  C_validation.assert_forward_decl_exists sample_header_with_decls "GtkWrapMode"
    "Val_";
  C_validation.assert_forward_decl_exists sample_header_with_decls
    "GtkStateFlags" "Val_";

  (* Check for <Type>_val pattern *)
  C_validation.assert_forward_decl_exists sample_header_with_decls
    "GtkWrapMode_val" "";
  C_validation.assert_forward_decl_exists sample_header_with_decls
    "GtkStateFlags_val" ""

let test_assert_forward_decl_exists_different_types () =
  (* Test that assert_forward_decl_exists works for different types in the same header *)
  C_validation.assert_forward_decl_exists sample_header_with_decls "GtkWrapMode"
    "Val_";
  C_validation.assert_forward_decl_exists sample_header_with_decls
    "GtkStateFlags" "Val_";
  C_validation.assert_forward_decl_exists sample_header_with_decls
    "GtkWrapMode_val" "";
  C_validation.assert_forward_decl_exists sample_header_with_decls
    "GtkStateFlags_val" ""

let test_assert_forward_decl_not_exists () =
  (* Test that assert_forward_decl_not_exists succeeds when declaration is absent *)
  C_validation.assert_forward_decl_not_exists sample_header_without_decls
    "GdkTextureType" "Val_";
  C_validation.assert_forward_decl_not_exists sample_header_without_decls
    "GdkTextureType_val" "";

  (* Verify it also works when checking for declarations in the "with_decls" header 
     for types that aren't there *)
  C_validation.assert_forward_decl_not_exists sample_header_with_decls
    "GdkEventMask" "Val_";
  C_validation.assert_forward_decl_not_exists sample_header_with_decls
    "GdkEventMask_val" ""

let test_assert_forward_decl_not_exists_different_patterns () =
  (* Test that assert_forward_decl_not_exists works for different patterns *)
  (* These should all succeed because they're not in the header *)
  C_validation.assert_forward_decl_not_exists sample_header_without_decls
    "GdkTextureType" "Val_";
  C_validation.assert_forward_decl_not_exists sample_header_without_decls
    "GdkTextureType_val" "";
  C_validation.assert_forward_decl_not_exists sample_header_with_decls
    "GdkEventMask" "Val_";
  C_validation.assert_forward_decl_not_exists sample_header_with_decls
    "GdkEventMask_val" ""

let test_assert_header_guard_format () =
  (* Test that assert_header_guard_format succeeds with correct pattern *)
  C_validation.assert_header_guard_format sample_header_complete_guard
    "_decls_h_";
  C_validation.assert_header_guard_format sample_header_complete_guard
    "_gtk_decls_h_"

let test_assert_header_guard_format_different_patterns () =
  (* Test that assert_header_guard_format works with different pattern suffixes *)
  C_validation.assert_header_guard_format sample_header_complete_guard
    "_decls_h_";
  C_validation.assert_header_guard_format sample_header_complete_guard
    "_gtk_decls_h_";
  C_validation.assert_header_guard_format sample_header_complete_guard "h_";
  (* "_gtk_" is not a suffix, so this should fail - let's skip it in the success test *)
  ()

let test_header_guard_parsing_variations () =
  (* Test that parse_header_guards handles different header formats *)
  let guards = C_validation.parse_header_guards sample_header_complete_guard in
  Alcotest.(check int) "Should find exactly one guard" 1 (List.length guards);

  (* Test with incomplete guard - should still find it *)
  let guards_incomplete =
    C_validation.parse_header_guards sample_header_incomplete_guard
  in
  Alcotest.(check int)
    "Should find one guard even if incomplete" 1
    (List.length guards_incomplete)

let test_parse_header_guards () =
  (* Test the parse_header_guards function directly *)
  let guards = C_validation.parse_header_guards sample_header_complete_guard in

  (* Should find exactly one guard *)
  Alcotest.(check int) "Should find exactly one guard" 1 (List.length guards);

  (* Verify the guard has correct structure *)
  match guards with
  | [ guard ] ->
      Alcotest.(check string)
        "Guard name should be _gtk_decls_h_" "_gtk_decls_h_" guard.guard_name;
      Alcotest.(check bool) "Should have #ifndef" true guard.has_ifndef;
      Alcotest.(check bool) "Should have #define" true guard.has_define;
      Alcotest.(check bool) "Should have #endif" true guard.has_endif
  | _ -> Alcotest.fail "Expected exactly one guard"

let test_extract_forward_decls () =
  (* Test that extract_forward_decls finds all forward declarations *)
  let decls = C_validation.extract_forward_decls sample_header_with_decls in

  (* Should find 4 declarations: Val_GtkWrapMode, GtkWrapMode_val, Val_GtkStateFlags, GtkStateFlags_val *)
  Alcotest.(check int)
    "Should find 4 forward declarations" 4 (List.length decls);

  (* Verify specific declarations are present *)
  Alcotest.(check bool)
    "Should contain Val_GtkWrapMode" true
    (List.mem "Val_GtkWrapMode" decls);
  Alcotest.(check bool)
    "Should contain GtkWrapMode_val" true
    (List.mem "GtkWrapMode_val" decls);
  Alcotest.(check bool)
    "Should contain Val_GtkStateFlags" true
    (List.mem "Val_GtkStateFlags" decls);
  Alcotest.(check bool)
    "Should contain GtkStateFlags_val" true
    (List.mem "GtkStateFlags_val" decls)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "assert_forward_decl_exists finds existing declarations"
      `Quick test_assert_forward_decl_exists;
    Alcotest.test_case "assert_forward_decl_exists finds different types" `Quick
      test_assert_forward_decl_exists_different_types;
    Alcotest.test_case
      "assert_forward_decl_not_exists succeeds for absent declarations" `Quick
      test_assert_forward_decl_not_exists;
    Alcotest.test_case
      "assert_forward_decl_not_exists works for different patterns" `Quick
      test_assert_forward_decl_not_exists_different_patterns;
    Alcotest.test_case "assert_header_guard_format validates complete guards"
      `Quick test_assert_header_guard_format;
    Alcotest.test_case "assert_header_guard_format works for different patterns"
      `Quick test_assert_header_guard_format_different_patterns;
    Alcotest.test_case "parse_header_guards handles variations" `Quick
      test_header_guard_parsing_variations;
    Alcotest.test_case "parse_header_guards extracts guards correctly" `Quick
      test_parse_header_guards;
    Alcotest.test_case "extract_forward_decls finds all declarations" `Quick
      test_extract_forward_decls;
  ]
