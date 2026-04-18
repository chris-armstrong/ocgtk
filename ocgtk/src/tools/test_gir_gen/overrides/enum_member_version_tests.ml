(* Tests for per-member version guards in enum and bitfield C converters.
   Validates that generate_c_enum_converters and generate_c_bitfield_converters
   emit correct #if/#else/#endif guards when member_version / flag_version is set. *)

open Gir_gen_lib.Types
open Gir_gen_lib.Generate.Enum_code

(* ========================================================================= *)
(* Helpers *)
(* ========================================================================= *)

(** Check that [sub] appears as a substring of [s]. *)
let contains s sub =
  let n = String.length sub in
  let m = String.length s in
  if n = 0 then true
  else
    let rec loop i =
      if i + n > m then false
      else if String.sub s i n = sub then true
      else loop (i + 1)
    in
    loop 0

let assert_contains ~label ~expected actual =
  if not (contains actual expected) then
    Alcotest.failf "%s: expected substring %S in:\n%s" label expected actual

let assert_not_contains ~label ~unexpected actual =
  if contains actual unexpected then
    Alcotest.failf "%s: unexpected substring %S found in:\n%s" label unexpected
      actual

(* ========================================================================= *)
(* Enum member builders *)
(* ========================================================================= *)

let make_member ~name ~c_identifier ~value ?member_version () =
  {
    member_name = name;
    member_value = value;
    c_identifier;
    member_doc = None;
    member_version;
    member_os = None;
  }

let make_enum ~name ~c_type members =
  {
    enum_name = name;
    enum_c_type = c_type;
    members;
    functions = [];
    enum_doc = None;
    enum_version = None;
    enum_os = None;
  }

(* ========================================================================= *)
(* Bitfield member builders *)
(* ========================================================================= *)

let make_flag ~name ~c_identifier ~value ?flag_version () =
  {
    flag_name = name;
    flag_value = value;
    flag_c_identifier = c_identifier;
    flag_doc = None;
    flag_version;
    flag_os = None;
  }

let make_bitfield ~name ~c_type flags =
  {
    bitfield_name = name;
    bitfield_c_type = c_type;
    flags;
    bitfield_doc = None;
    bitfield_version = None;
    bitfield_os = None;
  }

(* ========================================================================= *)
(* Enum test 1: no versions at all → no guards *)
(* ========================================================================= *)

let test_enum_no_version () =
  let member =
    make_member ~name:"none" ~c_identifier:"GTK_WRAP_NONE" ~value:0 ()
  in
  let enum = make_enum ~name:"WrapMode" ~c_type:"GtkWrapMode" [ member ] in
  let output =
    generate_c_enum_converters ~namespace:"Gtk" ~class_version:None enum
  in
  assert_not_contains ~label:"no #if guard" ~unexpected:"#if" output;
  assert_not_contains ~label:"no caml_failwith guard" ~unexpected:"#else" output;
  assert_contains ~label:"case line present" ~expected:"GTK_WRAP_NONE" output

(* ========================================================================= *)
(* Enum test 2: member_version set, class_version = None → Member_guard *)
(* ========================================================================= *)

let test_enum_member_version_no_class () =
  let member =
    make_member ~name:"stretch" ~c_identifier:"GTK_WRAP_STRETCH" ~value:4
      ~member_version:"4.14" ()
  in
  let enum = make_enum ~name:"WrapMode" ~c_type:"GtkWrapMode" [ member ] in
  let output =
    generate_c_enum_converters ~namespace:"Gtk" ~class_version:None enum
  in
  (* C->OCaml: case line wrapped in #if / #endif, no #else *)
  assert_contains ~label:"c_to_ocaml: opening #if"
    ~expected:"#if GTK_CHECK_VERSION(4,14,0)" output;
  assert_contains ~label:"c_to_ocaml: case line" ~expected:"GTK_WRAP_STRETCH"
    output;
  assert_contains ~label:"c_to_ocaml: closing #endif" ~expected:"#endif" output;
  (* OCaml->C: if-branch wrapped in #if / #else caml_failwith / #endif *)
  assert_contains ~label:"ocaml_to_c: #else present" ~expected:"#else" output;
  assert_contains ~label:"ocaml_to_c: caml_failwith in #else"
    ~expected:"caml_failwith" output

(* ========================================================================= *)
(* Enum test 3: member_version == class_version → Class_guard, no inner guard *)
(* ========================================================================= *)

let test_enum_member_version_equals_class () =
  let member =
    make_member ~name:"stretch" ~c_identifier:"GTK_WRAP_STRETCH" ~value:4
      ~member_version:"4.10" ()
  in
  let enum = make_enum ~name:"WrapMode" ~c_type:"GtkWrapMode" [ member ] in
  let output =
    generate_c_enum_converters ~namespace:"Gtk" ~class_version:(Some "4.10")
      enum
  in
  (* resolve_guard returns Class_guard → no inner #if *)
  assert_not_contains ~label:"no inner #if" ~unexpected:"#if" output;
  assert_contains ~label:"case line present" ~expected:"GTK_WRAP_STRETCH" output

(* ========================================================================= *)
(* Enum test 4: member_version older than class_version → Class_guard, no inner guard *)
(* ========================================================================= *)

let test_enum_member_version_older_than_class () =
  let member =
    make_member ~name:"stretch" ~c_identifier:"GTK_WRAP_STRETCH" ~value:4
      ~member_version:"4.8" ()
  in
  let enum = make_enum ~name:"WrapMode" ~c_type:"GtkWrapMode" [ member ] in
  let output =
    generate_c_enum_converters ~namespace:"Gtk" ~class_version:(Some "4.14")
      enum
  in
  (* resolve_guard returns Class_guard → no inner #if *)
  assert_not_contains ~label:"no inner #if" ~unexpected:"#if" output;
  assert_contains ~label:"case line present" ~expected:"GTK_WRAP_STRETCH" output

(* ========================================================================= *)
(* Enum test 5: member_version newer than class_version → Member_guard *)
(* ========================================================================= *)

let test_enum_member_version_newer_than_class () =
  let member =
    make_member ~name:"stretch" ~c_identifier:"GTK_WRAP_STRETCH" ~value:4
      ~member_version:"4.16" ()
  in
  let enum = make_enum ~name:"WrapMode" ~c_type:"GtkWrapMode" [ member ] in
  let output =
    generate_c_enum_converters ~namespace:"Gtk" ~class_version:(Some "4.14")
      enum
  in
  assert_contains ~label:"inner #if for 4.16"
    ~expected:"#if GTK_CHECK_VERSION(4,16,0)" output;
  assert_contains ~label:"case line present" ~expected:"GTK_WRAP_STRETCH" output;
  assert_contains ~label:"#else present" ~expected:"#else" output;
  assert_contains ~label:"#endif present" ~expected:"#endif" output

(* ========================================================================= *)
(* Enum test 6: mixed members — unversioned and versioned in same enum *)
(* ========================================================================= *)

let test_enum_mixed_members () =
  let m1 = make_member ~name:"none" ~c_identifier:"GTK_WRAP_NONE" ~value:0 () in
  let m2 =
    make_member ~name:"stretch" ~c_identifier:"GTK_WRAP_STRETCH" ~value:4
      ~member_version:"4.14" ()
  in
  let enum = make_enum ~name:"WrapMode" ~c_type:"GtkWrapMode" [ m1; m2 ] in
  let output =
    generate_c_enum_converters ~namespace:"Gtk" ~class_version:None enum
  in
  (* First member has no guard *)
  assert_contains ~label:"unguarded member present" ~expected:"GTK_WRAP_NONE"
    output;
  (* Second member is guarded *)
  assert_contains ~label:"guard for versioned member"
    ~expected:"#if GTK_CHECK_VERSION(4,14,0)" output;
  assert_contains ~label:"versioned member present" ~expected:"GTK_WRAP_STRETCH"
    output;
  assert_contains ~label:"#else for versioned member" ~expected:"#else" output

(* ========================================================================= *)
(* Bitfield test 7: no versions → no guards *)
(* ========================================================================= *)

let test_bitfield_no_version () =
  let flag =
    make_flag ~name:"normal" ~c_identifier:"GTK_STATE_FLAG_NORMAL" ~value:0 ()
  in
  let bitfield =
    make_bitfield ~name:"StateFlags" ~c_type:"GtkStateFlags" [ flag ]
  in
  let output =
    generate_c_bitfield_converters ~namespace:"Gtk" ~class_version:None bitfield
  in
  assert_not_contains ~label:"no #if guard" ~unexpected:"#if" output;
  assert_not_contains ~label:"no #else guard" ~unexpected:"#else" output;
  assert_contains ~label:"flag present" ~expected:"GTK_STATE_FLAG_NORMAL" output

(* ========================================================================= *)
(* Bitfield test 8: flag_version set, class_version = None → Member_guard *)
(* ========================================================================= *)

let test_bitfield_flag_version () =
  let flag =
    make_flag ~name:"focus_within" ~c_identifier:"GTK_STATE_FLAG_FOCUS_WITHIN"
      ~value:512 ~flag_version:"4.14" ()
  in
  let bitfield =
    make_bitfield ~name:"StateFlags" ~c_type:"GtkStateFlags" [ flag ]
  in
  let output =
    generate_c_bitfield_converters ~namespace:"Gtk" ~class_version:None bitfield
  in
  (* C->OCaml: if-block wrapped in #if / #endif, no #else *)
  assert_contains ~label:"c_to_ocaml: opening #if"
    ~expected:"#if GTK_CHECK_VERSION(4,14,0)" output;
  assert_contains ~label:"c_to_ocaml: flag check present"
    ~expected:"GTK_STATE_FLAG_FOCUS_WITHIN" output;
  assert_contains ~label:"c_to_ocaml: closing #endif" ~expected:"#endif" output;
  (* OCaml->C: tag-match wrapped in #if / #else caml_failwith / #endif *)
  assert_contains ~label:"ocaml_to_c: #else present" ~expected:"#else" output;
  assert_contains ~label:"ocaml_to_c: caml_failwith in #else"
    ~expected:"caml_failwith" output

(* ========================================================================= *)
(* Bitfield test 9: flag_version <= class_version → Class_guard, no inner guard *)
(* ========================================================================= *)

let test_bitfield_flag_covered_by_class () =
  let flag =
    make_flag ~name:"focus_within" ~c_identifier:"GTK_STATE_FLAG_FOCUS_WITHIN"
      ~value:512 ~flag_version:"4.10" ()
  in
  let bitfield =
    make_bitfield ~name:"StateFlags" ~c_type:"GtkStateFlags" [ flag ]
  in
  let output =
    generate_c_bitfield_converters ~namespace:"Gtk" ~class_version:(Some "4.14")
      bitfield
  in
  (* resolve_guard returns Class_guard → no inner #if *)
  assert_not_contains ~label:"no inner #if" ~unexpected:"#if" output;
  assert_contains ~label:"flag present" ~expected:"GTK_STATE_FLAG_FOCUS_WITHIN"
    output

(* ========================================================================= *)
(* Test suite *)
(* ========================================================================= *)

let test_suite =
  [
    Alcotest.test_case "enum no version" `Quick test_enum_no_version;
    Alcotest.test_case "enum member_version, no class_version" `Quick
      test_enum_member_version_no_class;
    Alcotest.test_case "enum member_version equals class_version" `Quick
      test_enum_member_version_equals_class;
    Alcotest.test_case "enum member_version older than class_version" `Quick
      test_enum_member_version_older_than_class;
    Alcotest.test_case "enum member_version newer than class_version" `Quick
      test_enum_member_version_newer_than_class;
    Alcotest.test_case "enum mixed members (unversioned + versioned)" `Quick
      test_enum_mixed_members;
    Alcotest.test_case "bitfield no version" `Quick test_bitfield_no_version;
    Alcotest.test_case "bitfield flag_version, no class_version" `Quick
      test_bitfield_flag_version;
    Alcotest.test_case "bitfield flag covered by class_version" `Quick
      test_bitfield_flag_covered_by_class;
  ]
