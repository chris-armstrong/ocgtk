(** Round-trip tests for [ocgtk_classify].

    Allocates one value of each custom-block kind via the public OCaml allocator
    and asserts the C-level classifier returns the matching [ocgtk_kind]
    discriminator. GValue and GClosure have no public standalone allocator and
    are exercised indirectly via signal infrastructure in later milestones; the
    remaining kinds are covered directly here so Phase 7 Signal_marshaller
    consumers can depend on the dispatch with confidence. *)

open Ocgtk_gtk.Gtk
module Helpers = Gtk_test_helpers

external classify_int : 'a -> int = "caml_ocgtk_classify"

(* Mirrors the OCGTK_KIND_* enum in value_kinds.h. *)
let kind_int = 0
let kind_gobject = 1
let kind_gir_record = 2
let kind_gvariant = 3
let kind_gvariant_type = 4
let kind_gbytes = 5
let require_gtk = Helpers.require_gtk

let check_int_eq label expected actual =
  Alcotest.(check int) label expected actual

let test_int_immediate () =
  check_int_eq "42 -> KIND_INT" kind_int (classify_int 42);
  check_int_eq "0 -> KIND_INT" kind_int (classify_int 0);
  check_int_eq "min_int -> KIND_INT" kind_int (classify_int min_int)

let test_gobject () =
  (* DropTarget is a concrete GObject whose constructor needs no display.
     Its custom block must classify as KIND_GOBJECT — the dispatch Phase 7
     Signal_marshaller relies on for object-typed signal arguments. *)
  let dt = Wrappers.Drop_target.new_ (Gobject.Type.from_name "gchararray") [] in
  check_int_eq "Drop_target -> KIND_GOBJECT" kind_gobject (classify_int dt)

let test_gir_record () =
  (* TreePath is a boxed gir_record allocated via the GType-aware path
     introduced in PR #126. Its custom block must classify as
     KIND_GIR_RECORD so Signal_marshaller routes record-typed arguments
     through ml_gir_record_ptr_val rather than the GObject accessor. *)
  let p = Wrappers.Tree_path.new_ () in
  check_int_eq "Tree_path -> KIND_GIR_RECORD" kind_gir_record (classify_int p)

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
          Alcotest.test_case "GObject (Drop_target)" `Quick
            (require_gtk test_gobject);
          Alcotest.test_case "gir_record (Tree_path)" `Quick
            (require_gtk test_gir_record);
          Alcotest.test_case "Gvariant" `Quick test_gvariant;
          Alcotest.test_case "Gvariant_type" `Quick test_gvariant_type;
          Alcotest.test_case "Glib_bytes" `Quick test_gbytes;
        ] );
    ]
