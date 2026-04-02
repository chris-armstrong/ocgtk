open Gir_gen_lib.Version_guard

let test_parse_version_two_component () =
  let result = parse_version "4.14" in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok v ->
      Alcotest.(check int) "major" 4 v.major;
      Alcotest.(check int) "minor" 14 v.minor;
      Alcotest.(check int) "micro" 0 v.micro

let test_parse_version_three_component () =
  let result = parse_version "1.32.4" in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok v ->
      Alcotest.(check int) "major" 1 v.major;
      Alcotest.(check int) "minor" 32 v.minor;
      Alcotest.(check int) "micro" 4 v.micro

let test_parse_version_single_component () =
  let result = parse_version "4" in
  match result with
  | Error _ -> ()
  | Ok _ -> Alcotest.fail "Should reject single-component version"

let test_parse_version_four_components () =
  let result = parse_version "4.14.0.1" in
  match result with
  | Error _ -> ()
  | Ok _ -> Alcotest.fail "Should reject four-component version"

let test_parse_version_non_numeric () =
  let result = parse_version "4.abc" in
  match result with
  | Error _ -> ()
  | Ok _ -> Alcotest.fail "Should reject non-numeric version"

let test_compare_versions_major () =
  let v1 = { major = 5; minor = 0; micro = 0 } in
  let v2 = { major = 4; minor = 14; micro = 0 } in
  let cmp = compare_versions v1 v2 in
  Alcotest.(check int) "v1 > v2" 1 cmp

let test_compare_versions_minor () =
  let v1 = { major = 4; minor = 14; micro = 0 } in
  let v2 = { major = 4; minor = 12; micro = 0 } in
  let cmp = compare_versions v1 v2 in
  Alcotest.(check int) "v1 > v2" 1 cmp

let test_compare_versions_micro () =
  let v1 = { major = 4; minor = 12; micro = 5 } in
  let v2 = { major = 4; minor = 12; micro = 3 } in
  let cmp = compare_versions v1 v2 in
  Alcotest.(check int) "v1 > v2" 1 cmp

let test_compare_versions_equal () =
  let v1 = { major = 4; minor = 12; micro = 5 } in
  let v2 = { major = 4; minor = 12; micro = 5 } in
  let cmp = compare_versions v1 v2 in
  Alcotest.(check int) "v1 == v2" 0 cmp

let test_compare_versions_less () =
  let v1 = { major = 4; minor = 10; micro = 0 } in
  let v2 = { major = 4; minor = 12; micro = 0 } in
  let cmp = compare_versions v1 v2 in
  Alcotest.(check int) "v1 < v2" (-1) cmp

let test_resolve_guard_neither_version () =
  let result = resolve_guard ~class_version:None ~member_version:None in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> (
      match guard with
      | No_guard -> ()
      | _ -> Alcotest.fail "Expected No_guard")

let test_resolve_guard_class_only () =
  let result = resolve_guard ~class_version:(Some "4.10") ~member_version:None in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> (
      match guard with
      | Class_guard v ->
          Alcotest.(check int) "major" 4 v.major;
          Alcotest.(check int) "minor" 10 v.minor
      | _ -> Alcotest.fail "Expected Class_guard")

let test_resolve_guard_member_only () =
  let result =
    resolve_guard ~class_version:None ~member_version:(Some "1.46")
  in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> (
      match guard with
      | Member_guard v ->
          Alcotest.(check int) "major" 1 v.major;
          Alcotest.(check int) "minor" 46 v.minor
      | _ -> Alcotest.fail "Expected Member_guard")

let test_resolve_guard_member_higher_than_class () =
  let result =
    resolve_guard ~class_version:(Some "4.10") ~member_version:(Some "4.12")
  in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> (
      match guard with
      | Member_guard v ->
          Alcotest.(check int) "major" 4 v.major;
          Alcotest.(check int) "minor" 12 v.minor
      | _ -> Alcotest.fail "Expected Member_guard")

let test_resolve_guard_member_lower_than_class () =
  let result =
    resolve_guard ~class_version:(Some "4.12") ~member_version:(Some "4.10")
  in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> (
      match guard with
      | Class_guard v ->
          Alcotest.(check int) "major" 4 v.major;
          Alcotest.(check int) "minor" 12 v.minor
      | _ -> Alcotest.fail "Expected Class_guard")

let test_resolve_guard_member_equal_to_class () =
  let result =
    resolve_guard ~class_version:(Some "4.10") ~member_version:(Some "4.10")
  in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> (
      match guard with
      | Class_guard v ->
          Alcotest.(check int) "major" 4 v.major;
          Alcotest.(check int) "minor" 10 v.minor
      | _ -> Alcotest.fail "Expected Class_guard")

let test_resolve_guard_invalid_class_version () =
  let result =
    resolve_guard ~class_version:(Some "bad") ~member_version:None
  in
  match result with
  | Error _ -> ()
  | Ok _ -> Alcotest.fail "Should return Error for invalid class version"

let test_resolve_guard_invalid_member_version () =
  let result =
    resolve_guard ~class_version:(Some "4.10") ~member_version:(Some "bad")
  in
  match result with
  | Error _ -> ()
  | Ok _ -> Alcotest.fail "Should return Error for invalid member version"

let test_emit_c_guard_gtk_opening () =
  let version = { major = 4; minor = 12; micro = 0 } in
  let result = emit_c_guard "Gtk" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard" "#if GTK_CHECK_VERSION(4,12,0)" guard

let test_emit_c_guard_gtk_closing () =
  let version = { major = 4; minor = 12; micro = 0 } in
  let result = emit_c_guard "Gtk" version ~is_opening:false in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard -> Alcotest.(check string) "guard" "#endif" guard

let test_emit_c_guard_gdk () =
  let version = { major = 4; minor = 10; micro = 0 } in
  let result = emit_c_guard "Gdk" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard" "#if GTK_CHECK_VERSION(4,10,0)" guard

let test_emit_c_guard_gsk () =
  let version = { major = 4; minor = 10; micro = 0 } in
  let result = emit_c_guard "Gsk" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard" "#if GTK_CHECK_VERSION(4,10,0)" guard

let test_emit_c_guard_pango_opening () =
  let version = { major = 1; minor = 46; micro = 0 } in
  let result = emit_c_guard "Pango" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard" "#if PANGO_VERSION_CHECK(1,46,0)" guard

let test_emit_c_guard_pangocairo () =
  let version = { major = 1; minor = 46; micro = 0 } in
  let result = emit_c_guard "PangoCairo" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard" "#if PANGO_VERSION_CHECK(1,46,0)" guard

let test_emit_c_guard_gdkpixbuf () =
  let version = { major = 2; minor = 0; micro = 0 } in
  let result = emit_c_guard "GdkPixbuf" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string)
        "guard" "#if GDK_PIXBUF_CHECK_VERSION(2,0,0)" guard

let test_emit_c_guard_gio () =
  let version = { major = 2; minor = 72; micro = 0 } in
  let result = emit_c_guard "Gio" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard" "#if GLIB_CHECK_VERSION(2,72,0)" guard

let test_emit_c_guard_graphene () =
  let version = { major = 1; minor = 10; micro = 0 } in
  let result = emit_c_guard "Graphene" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string)
        "guard" "#if GRAPHENE_CHECK_VERSION(1,10,0)" guard

let test_emit_c_guard_cairo_opening () =
  let version = { major = 1; minor = 17; micro = 0 } in
  let result = emit_c_guard "Cairo" version ~is_opening:true in
  match result with
  | Error msg -> Alcotest.fail msg
  | Ok guard ->
      Alcotest.(check string) "guard"
        "#if CAIRO_VERSION >= CAIRO_VERSION_ENCODE(1,17,0)" guard

let test_emit_c_guard_unknown_namespace () =
  let version = { major = 4; minor = 12; micro = 0 } in
  let result = emit_c_guard "UnknownLib" version ~is_opening:true in
  match result with
  | Ok _ -> Alcotest.fail "Should return error for unknown namespace"
  | Error _ -> ()

let test_c_guard_else () =
  Alcotest.(check string) "guard" "#else" c_guard_else

let test_suite =
  [
    ("parse_version_two_component", `Quick, test_parse_version_two_component);
    ( "parse_version_three_component",
      `Quick,
      test_parse_version_three_component );
    ( "parse_version_single_component",
      `Quick,
      test_parse_version_single_component );
    ("parse_version_four_components", `Quick, test_parse_version_four_components);
    ("parse_version_non_numeric", `Quick, test_parse_version_non_numeric);
    ("compare_versions_major", `Quick, test_compare_versions_major);
    ("compare_versions_minor", `Quick, test_compare_versions_minor);
    ("compare_versions_micro", `Quick, test_compare_versions_micro);
    ("compare_versions_equal", `Quick, test_compare_versions_equal);
    ("compare_versions_less", `Quick, test_compare_versions_less);
    ("resolve_guard_neither_version", `Quick, test_resolve_guard_neither_version);
    ("resolve_guard_class_only", `Quick, test_resolve_guard_class_only);
    ("resolve_guard_member_only", `Quick, test_resolve_guard_member_only);
    ( "resolve_guard_member_higher_than_class",
      `Quick,
      test_resolve_guard_member_higher_than_class );
    ( "resolve_guard_member_lower_than_class",
      `Quick,
      test_resolve_guard_member_lower_than_class );
    ( "resolve_guard_member_equal_to_class",
      `Quick,
      test_resolve_guard_member_equal_to_class );
    ( "resolve_guard_invalid_class_version",
      `Quick,
      test_resolve_guard_invalid_class_version );
    ( "resolve_guard_invalid_member_version",
      `Quick,
      test_resolve_guard_invalid_member_version );
    ("emit_c_guard_gtk_opening", `Quick, test_emit_c_guard_gtk_opening);
    ("emit_c_guard_gtk_closing", `Quick, test_emit_c_guard_gtk_closing);
    ("emit_c_guard_gdk", `Quick, test_emit_c_guard_gdk);
    ("emit_c_guard_gsk", `Quick, test_emit_c_guard_gsk);
    ("emit_c_guard_pango_opening", `Quick, test_emit_c_guard_pango_opening);
    ("emit_c_guard_pangocairo", `Quick, test_emit_c_guard_pangocairo);
    ("emit_c_guard_gdkpixbuf", `Quick, test_emit_c_guard_gdkpixbuf);
    ("emit_c_guard_gio", `Quick, test_emit_c_guard_gio);
    ("emit_c_guard_graphene", `Quick, test_emit_c_guard_graphene);
    ("emit_c_guard_cairo_opening", `Quick, test_emit_c_guard_cairo_opening);
    ( "emit_c_guard_unknown_namespace",
      `Quick,
      test_emit_c_guard_unknown_namespace );
    ("c_guard_else", `Quick, test_c_guard_else);
  ]
