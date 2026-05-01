(** Round-trip tests for [ocgtk_classify].

    Allocates one value of each pure-data custom-block kind via the public
    OCaml allocator and asserts the C-level classifier returns the matching
    [ocgtk_kind] discriminator. GObject and GIR-record kinds are covered by the
    existing finalizer / interface tests; GValue and GClosure have no public
    standalone allocator and are exercised indirectly via signal infrastructure
    in later milestones. *)

external classify_int : 'a -> int = "caml_ocgtk_classify"

(* Mirrors the OCGTK_KIND_* enum in value_kinds.h. *)
let kind_int = 0
let kind_gvariant = 3
let kind_gvariant_type = 4
let kind_gbytes = 5

let check_int_eq label expected actual =
  Alcotest.(check int) label expected actual

let test_int_immediate () =
  check_int_eq "42 -> KIND_INT" kind_int (classify_int 42);
  check_int_eq "0 -> KIND_INT" kind_int (classify_int 0);
  check_int_eq "min_int -> KIND_INT" kind_int (classify_int min_int)

let test_gvariant () =
  let v = Gvariant.of_string "hello" in
  check_int_eq "Gvariant -> KIND_GVARIANT" kind_gvariant (classify_int v)

let test_gvariant_type () =
  let t = Gvariant_type.of_string "s" in
  check_int_eq "Gvariant_type -> KIND_GVARIANT_TYPE" kind_gvariant_type
    (classify_int t)

let test_gbytes () =
  let b = Glib_bytes.create "test data" in
  check_int_eq "Glib_bytes -> KIND_GBYTES" kind_gbytes (classify_int b)

let () =
  Alcotest.run "ocgtk_classify"
    [
      ("immediate", [ Alcotest.test_case "int" `Quick test_int_immediate ]);
      ( "custom blocks",
        [
          Alcotest.test_case "Gvariant" `Quick test_gvariant;
          Alcotest.test_case "Gvariant_type" `Quick test_gvariant_type;
          Alcotest.test_case "Glib_bytes" `Quick test_gbytes;
        ] );
    ]
