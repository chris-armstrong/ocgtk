(* Unit tests for Dune_file — stub-batch layout.

    The generated C stubs are split into batch libraries because of the
    Windows command-line length limit. OCaml's native linker emits the -cclib
    archive flags in the reverse of the order the libraries are listed, so the
    first-listed batch (batch_0) is scanned *last* by ld. Batch_0 must
    therefore hold the leaf converter files (ml_<ns>_enums_gen) that every
    class stub file depends on: with alphabetical chunking they land mid
    sequence, and any executable that pulls only batch_0 class stubs (e.g. a
    test using Button/Box but no Widget/Window) fails to link because the
    enums archive was scanned before anything referenced it.

    These tests pin the ordering invariant: enums converters first, everything
    else alphabetical, chunking stable. *)

open Gir_gen_lib.Generate.Dune_file

let check_string_list msg expected actual =
  Alcotest.(check (list string)) msg expected actual

(* ---------- ordering ---------------------------------------------------- *)

let test_enums_files_move_to_front () =
  check_string_list "enums converter files are listed first"
    [ "ml_gdk_enums_gen"; "ml_gtk_enums_gen"; "ml_box_gen"; "ml_button_gen" ]
    (order_stub_names_for_batching
       ([ "ml_box_gen"; "ml_gtk_enums_gen"; "ml_button_gen" ]
       @ [ "ml_gdk_enums_gen" ]))

let test_non_enums_stay_alphabetical () =
  check_string_list "non-enums files remain sorted"
    [ "ml_gtk_enums_gen"; "ml_aaa_gen"; "ml_bbb_gen"; "ml_zzz_gen" ]
    (order_stub_names_for_batching
       [ "ml_zzz_gen"; "ml_bbb_gen"; "ml_aaa_gen"; "ml_gtk_enums_gen" ])

let test_no_enums_unchanged () =
  check_string_list "without enums files the list is just sorted"
    [ "ml_aaa_gen"; "ml_bbb_gen" ]
    (order_stub_names_for_batching [ "ml_bbb_gen"; "ml_aaa_gen" ])

(* ---------- chunking invariant ------------------------------------------- *)

(* Every enums converter must land in the first chunk: batch_0 is the
   last-scanned archive at link time, so converters placed anywhere else can
   leave dangling references from later-scanned batches. *)
let test_chunking_puts_enums_in_first_batch () =
  let names =
    order_stub_names_for_batching
      (List.init 200 (fun i -> Fmt.str "ml_s%03d_gen" i)
      @ [ "ml_gtk_enums_gen" ])
  in
  let contains_enums batch =
    List.exists (String.equal "ml_gtk_enums_gen") batch
  in
  match list_chunks stub_batch_size names with
  | [] -> Alcotest.fail "no batches produced"
  | first :: rest ->
      Alcotest.(check bool)
        "enums converter is in batch_0" true (contains_enums first);
      Alcotest.(check bool)
        "enums converter only in batch_0" false
        (List.exists contains_enums rest)

(* ---------- stanza text -------------------------------------------------- *)

let lines_of_stub_library ~dep_libraries =
  let buf = Buffer.create 512 in
  emit_stub_library buf ~name:"ocgtk_x_generated_stubs" ~public_name:None
    ~dep_libraries ~stub_names:[ "ml_x_gen" ] ~cflag_file:"cflag-x.sexp"
    ~clink_file:"clink-x.sexp";
  String.split_on_char '\n' (Buffer.contents buf)

let check_has_line msg line lines =
  Alcotest.(check bool) msg true (List.mem line lines)

(* The C stubs take wrappers.h and value_kinds.h from ocglib, which installs
   them; dune adds its directory to the include path. *)
let test_stub_library_depends_on_ocglib () =
  check_has_line "no namespace dependencies"
    " (libraries ocglib)  ; Depend on ocglib for header files"
    (lines_of_stub_library ~dep_libraries:"");
  check_has_line "with namespace dependencies"
    " (libraries ocgtk.gio ocglib)  ; Dependencies and ocglib for header files"
    (lines_of_stub_library ~dep_libraries:"ocgtk.gio")

let test_stub_library_has_no_common_include () =
  check_has_line "flags without -I../common"
    "  (flags -fPIC -Igenerated -Icore (:include cflag-x.sexp) \
     -Wno-deprecated-declarations -Wno-incompatible-pointer-types \
     -Wno-int-conversion))"
    (lines_of_stub_library ~dep_libraries:"")

let test_pkg_config_rule_uses_root_configurator () =
  let buf = Buffer.create 256 in
  emit_pkg_config_rule buf ~cflag_file:"cflag-x.sexp" ~clink_file:"clink-x.sexp"
    ~all_packages:[ "glib-2.0" ] ~is_optional:(fun _ -> false);
  check_has_line "configurator at the repository root"
    "   %{exe:../../../configurator/config_flags.exe}"
    (String.split_on_char '\n' (Buffer.contents buf))

let tests =
  [
    ("enums files move to front", `Quick, test_enums_files_move_to_front);
    ("non-enums stay alphabetical", `Quick, test_non_enums_stay_alphabetical);
    ("no enums files: just sorted", `Quick, test_no_enums_unchanged);
    ( "chunking puts enums in first batch",
      `Quick,
      test_chunking_puts_enums_in_first_batch );
    ( "stub library depends on ocglib",
      `Quick,
      test_stub_library_depends_on_ocglib );
    ( "stub library has no ../common include",
      `Quick,
      test_stub_library_has_no_common_include );
    ( "pkg-config rule uses the root configurator",
      `Quick,
      test_pkg_config_rule_uses_root_configurator );
  ]
