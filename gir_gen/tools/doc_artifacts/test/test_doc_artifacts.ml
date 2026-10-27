(* Unit tests for the doc artifact cache's keys, manifest, warning filter and
   file formats. The commands themselves run git, dune and tar, and are
   checked by running them. *)

open Doc_artifacts_lib

let sha = "0123456789abcdef0123456789abcdef01234567"
let other_sha = "0123456789abcdef0123456789abcdef89abcdef"

let key_exn ~is_dirty =
  match Artifact_key.of_tree ~sha ~is_dirty with
  | Ok key -> key
  | Error message -> Alcotest.fail message

let check_ok_key msg ~expected result =
  match result with
  | Ok key -> Alcotest.(check string) msg expected (Artifact_key.to_string key)
  | Error message -> Alcotest.fail (msg ^ ": " ^ message)

let check_error msg result =
  match result with
  | Ok key ->
      Alcotest.fail
        (msg ^ ": expected an error, got " ^ Artifact_key.to_string key)
  | Error _ -> ()

(* ---------- keys ---------- *)

let test_clean_tree_key_is_sha () =
  Alcotest.(check string)
    "clean" sha
    (Artifact_key.to_string (key_exn ~is_dirty:false))

let test_dirty_tree_key_has_suffix () =
  Alcotest.(check string)
    "dirty" (sha ^ "-dirty")
    (Artifact_key.to_string (key_exn ~is_dirty:true))

let test_short_or_non_hex_sha_rejected () =
  check_error "short" (Artifact_key.of_tree ~sha:"0123abc" ~is_dirty:false);
  check_error "upper case"
    (Artifact_key.of_tree ~sha:(String.uppercase_ascii sha) ~is_dirty:false)

let test_of_string_round_trips () =
  check_ok_key "clean" ~expected:sha (Artifact_key.of_string sha);
  check_ok_key "dirty" ~expected:(sha ^ "-dirty")
    (Artifact_key.of_string (sha ^ "-dirty"));
  check_error "bare suffix" (Artifact_key.of_string "-dirty")

let available = [ sha; sha ^ "-dirty"; other_sha ]

let test_resolve_exact_key_wins_over_prefix () =
  check_ok_key "a clean key is a prefix of its dirty key" ~expected:sha
    (Artifact_key.resolve ~available sha)

let test_resolve_unique_prefix () =
  check_ok_key "unique" ~expected:other_sha
    (Artifact_key.resolve ~available "0123456789abcdef0123456789abcdef8")

let test_resolve_ambiguous_or_missing_prefix_fails () =
  check_error "ambiguous" (Artifact_key.resolve ~available "0123");
  check_error "missing" (Artifact_key.resolve ~available "fff")

(* ---------- manifest ---------- *)

let manifest ~note =
  {
    Manifest.key = key_exn ~is_dirty:true;
    branch = "m3";
    date = "2026-10-27T03:04:05Z";
    odoc_version = "3.2.1";
    dune_version = "3.23.1";
    byte_size = 1234;
    html_file_count = 56;
    note;
    odoc_warning_count = 7;
  }

let test_manifest_json () =
  Alcotest.(check string)
    "fields in order, sha and dirty from the key"
    (Yojson.Safe.to_string
       (`Assoc
          [
            ("key", `String (sha ^ "-dirty"));
            ("sha", `String sha);
            ("dirty", `Bool true);
            ("branch", `String "m3");
            ("date", `String "2026-10-27T03:04:05Z");
            ("odoc_version", `String "3.2.1");
            ("dune_version", `String "3.23.1");
            ("byte_size", `Int 1234);
            ("html_file_count", `Int 56);
            ("note", `String "phase 2");
            ("odoc_warning_count", `Int 7);
          ]))
    (Yojson.Safe.to_string (Manifest.to_yojson (manifest ~note:"phase 2")))

let test_manifest_json_parses_back () =
  let note = "a \"b\"\\c\nd\001" in
  let json = Yojson.Safe.from_string (Manifest.to_json (manifest ~note)) in
  Alcotest.(check string)
    "note survives quotes, backslash, newline and control characters" note
    Yojson.Safe.Util.(json |> member "note" |> to_string)

(* ---------- odoc warnings ---------- *)

let test_report_keeps_odoc_warnings_with_location () =
  let output =
    String.concat "\n"
      [
        "File \"ocgtk/index.mld\", line 3, characters 4-33:";
        "Warning: Failed to resolve reference";
        "File \"a.ml\", line 1, characters 0-5:";
        "Warning 50 [unexpected-docstring]: unattached documentation comment";
        "Warning: no location";
        "";
      ]
  in
  Alcotest.(check (list string))
    "odoc's two warnings, not the compiler's"
    [
      "File \"ocgtk/index.mld\", line 3, characters 4-33:\n\
       Warning: Failed to resolve reference";
      "Warning: no location";
    ]
    (Odoc_warnings.report output)

let test_report_of_clean_build_is_empty () =
  Alcotest.(check (list string)) "none" [] (Odoc_warnings.report "")

(* ---------- layout and file formats ---------- *)

let env bindings name = List.assoc_opt name bindings

let check_root msg ~expected bindings =
  match Cache_layout.default_root ~getenv:(env bindings) with
  | Ok root -> Alcotest.(check string) msg expected root
  | Error message -> Alcotest.fail (msg ^ ": " ^ message)

let test_default_root_precedence () =
  check_root "override" ~expected:"/c"
    [ ("OCGTK_DOC_ARTIFACTS", "/c"); ("XDG_CACHE_HOME", "/x"); ("HOME", "/h") ];
  check_root "XDG" ~expected:"/x/ocgtk-doc-artifacts"
    [ ("OCGTK_DOC_ARTIFACTS", ""); ("XDG_CACHE_HOME", "/x"); ("HOME", "/h") ];
  check_root "home" ~expected:"/h/.cache/ocgtk-doc-artifacts" [ ("HOME", "/h") ]

let test_artifact_paths () =
  let key = key_exn ~is_dirty:false in
  Alcotest.(check string)
    "tarball"
    ("/c/artifacts/" ^ sha ^ ".tar.gz")
    (Cache_layout.tarball ~root:"/c" key);
  Alcotest.(check string)
    "build log"
    ("/c/artifacts/" ^ sha ^ ".doc.log")
    (Cache_layout.build_log ~root:"/c" key ~step:"doc");
  Alcotest.(check (option string))
    "key of a tarball name" (Some sha)
    (Cache_layout.key_of_tarball_name (sha ^ ".tar.gz"));
  Alcotest.(check (option string))
    "not a tarball" None
    (Cache_layout.key_of_tarball_name (sha ^ ".json"))

let test_index_line_is_one_tab_separated_line () =
  Alcotest.(check string)
    "tabs and newlines in fields become spaces"
    (sha ^ "\t2026-10-27T03:04:05Z\tm3\ta b c\n")
    (Cache_layout.index_line ~key:(key_exn ~is_dirty:false)
       ~date:"2026-10-27T03:04:05Z" ~branch:"m3" ~note:"a\tb\nc")

let test_baseline_round_trips () =
  let key = key_exn ~is_dirty:false in
  check_ok_key "key back" ~expected:sha
    (Cache_layout.baseline_of_contents
       (Cache_layout.baseline_contents ~key ~note:"first baseline"));
  check_error "empty" (Cache_layout.baseline_of_contents "\n")

let () =
  Alcotest.run "doc_artifacts"
    [
      ( "keys",
        [
          ("clean tree key is the sha", `Quick, test_clean_tree_key_is_sha);
          ("dirty tree key has -dirty", `Quick, test_dirty_tree_key_has_suffix);
          ( "short or non-hex sha rejected",
            `Quick,
            test_short_or_non_hex_sha_rejected );
          ("of_string round-trips to_string", `Quick, test_of_string_round_trips);
          ( "resolve: exact key beats a prefix",
            `Quick,
            test_resolve_exact_key_wins_over_prefix );
          ("resolve: unique prefix", `Quick, test_resolve_unique_prefix);
          ( "resolve: ambiguous or missing prefix fails",
            `Quick,
            test_resolve_ambiguous_or_missing_prefix_fails );
        ] );
      ( "manifest",
        [
          ("JSON fields and order", `Quick, test_manifest_json);
          ("written JSON parses back", `Quick, test_manifest_json_parses_back);
        ] );
      ( "odoc warnings",
        [
          ( "odoc warnings kept with their location, compiler's dropped",
            `Quick,
            test_report_keeps_odoc_warnings_with_location );
          ( "clean build has no warnings",
            `Quick,
            test_report_of_clean_build_is_empty );
        ] );
      ( "layout",
        [
          ("cache root precedence", `Quick, test_default_root_precedence);
          ("artifact paths", `Quick, test_artifact_paths);
          ("index line", `Quick, test_index_line_is_one_tab_separated_line);
          ("baseline round-trips", `Quick, test_baseline_round_trips);
        ] );
    ]
