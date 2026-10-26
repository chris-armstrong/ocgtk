(** Reproduction: arrays of plain (non-boxed) records returned by value.

    [Print_settings.get_page_ranges] wraps [GtkPageRange], a plain record with
    no [glib:get-type]. The generated stub builds each OCaml element with
    [Val_GtkPageRange(&result[i])], which wraps the interior pointer without
    copying (the custom block's finalizer later calls [g_free] on it), and then
    calls [g_free(result)] on the whole array.

    Expected once fixed: the call returns an array of 3 elements and a full GC
    finishes cleanly.

    Observed while the bug is present: the process aborts or segfaults during
    [Gc.full_major] (double free / invalid pointer in [g_free]), so this test is
    expected to FAIL until the stub is fixed. [Page_range.t] has no field
    accessors, so the test only checks the array length and that finalization
    survives. *)

open Alcotest
open Ocgtk_gtk.Gtk

let make_settings () =
  let s = Wrappers.Print_settings.new_ () in
  (* "page-ranges" is a comma-separated list of from-to pairs (0-based). *)
  Wrappers.Print_settings.set s "page-ranges" (Some "0-2,4-6,9-9");
  s

let test_get_page_ranges_length () =
  let ranges, n = Wrappers.Print_settings.get_page_ranges (make_settings ()) in
  check int "n_ranges" 3 n;
  check int "array length" 3 (Array.length ranges)

let test_page_ranges_survive_gc () =
  (let ranges, _ = Wrappers.Print_settings.get_page_ranges (make_settings ()) in
   ignore (Sys.opaque_identity ranges));
  (* Drop the elements, then run their finalizers. With the bug present this
     frees pointers into an already-freed array. *)
  Gc.full_major ();
  Gc.full_major ();
  (* Churn the allocator so a stale pointer is more likely to be noticed. *)
  for _ = 1 to 100 do
    ignore (Sys.opaque_identity (Bytes.create 64))
  done;
  Gc.full_major ();
  check pass "finalizers ran without crashing" () ()

let () =
  run "Plain record arrays"
    [
      ( "Print_settings.get_page_ranges",
        [
          test_case "returns 3 ranges" `Quick test_get_page_ranges_length;
          test_case "survives GC of elements" `Quick test_page_ranges_survive_gc;
        ] );
    ]
