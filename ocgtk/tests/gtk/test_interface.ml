(* Phase 8: Runtime tests for interface support *)

open Alcotest
open Ocgtk_gtk.Gtk
module Helpers = Gtk_test_helpers

let require_gtk = Helpers.require_gtk

(* ------------------------------------------------------------------ *)
(* Interface inheritance: Entry inherits Editable methods at Layer 2   *)
(* ------------------------------------------------------------------ *)

let test_entry_inherits_editable_set_get_text () =
  let entry = new Entry.entry (Wrappers.Entry.new_ ()) in
  entry#set_text "hello";
  check string "get_text returns set value" "hello" (entry#get_text ())

let test_entry_inherits_editable_delete_text () =
  let entry = new Entry.entry (Wrappers.Entry.new_ ()) in
  entry#set_text "hello";
  entry#delete_text 2 5;
  check string "delete_text removes positions 2..4" "he" (entry#get_text ())

let test_entry_inherits_editable_get_chars () =
  let entry = new Entry.entry (Wrappers.Entry.new_ ()) in
  entry#set_text "hello";
  check string "get_chars extracts substring" "ell" (entry#get_chars 1 4)

let test_entry_inherits_editable_position () =
  let entry = new Entry.entry (Wrappers.Entry.new_ ()) in
  entry#set_text "hello";
  entry#set_position 3;
  check int "get_position returns set position" 3 (entry#get_position ())

(* ------------------------------------------------------------------ *)
(* from_gobject: succeed for implementing class                         *)
(* ------------------------------------------------------------------ *)

let test_from_gobject_succeeds_for_entry () =
  let entry_obj = Wrappers.Entry.new_ () in
  let _editable : Wrappers.Editable.t =
    Wrappers.Editable.from_gobject entry_obj
  in
  ()

let test_from_gobject_succeeds_for_spin_button () =
  let spin_obj = Wrappers.Spin_button.new_with_range 0.0 100.0 1.0 in
  let _editable : Wrappers.Editable.t =
    Wrappers.Editable.from_gobject spin_obj
  in
  ()

(* ------------------------------------------------------------------ *)
(* from_gobject: fail for non-implementing class                        *)
(* ------------------------------------------------------------------ *)

let test_from_gobject_fails_for_button () =
  let button_obj = Wrappers.Button.new_ () in
  match Wrappers.Editable.from_gobject button_obj with
  | exception Failure msg ->
      check bool "error message non-empty" true (String.length msg > 0)
  | _ -> Alcotest.fail "Expected Failure exception for non-implementing class"

(* ------------------------------------------------------------------ *)
(* Layer 1 interface methods work directly on Editable.t               *)
(* ------------------------------------------------------------------ *)

let test_layer1_editable_set_get_text () =
  let entry_obj = Wrappers.Entry.new_ () in
  let editable = Wrappers.Editable.from_gobject entry_obj in
  Wrappers.Editable.set_text editable "world";
  check string "Layer 1 get_text matches set_text" "world"
    (Wrappers.Editable.get_text editable)

let test_layer1_editable_insert_text () =
  let entry_obj = Wrappers.Entry.new_ () in
  let editable = Wrappers.Editable.from_gobject entry_obj in
  Wrappers.Editable.set_text editable "hd";
  (* insert_text: t -> text -> length -> position -> unit
     length = byte count of text to insert (-1 = NUL-terminated equiv.)
     Here we use the byte length of " worl" = 6, inserted at position 1 *)
  Wrappers.Editable.insert_text editable "ello worl" 9 1;
  check string "insert_text inserts at position 1" "hello world"
    (Wrappers.Editable.get_text editable)

let test_layer1_editable_select_region_and_get_selection_bounds () =
  let entry_obj = Wrappers.Entry.new_ () in
  let editable = Wrappers.Editable.from_gobject entry_obj in
  Wrappers.Editable.set_text editable "hello world";
  Wrappers.Editable.select_region editable 6 11;
  let has_selection, start_pos, end_pos =
    Wrappers.Editable.get_selection_bounds editable
  in
  check bool "has_selection is true after select_region" true has_selection;
  check int "selection start is 6" 6 start_pos;
  check int "selection end is 11" 11 end_pos

(* ------------------------------------------------------------------ *)
(* as_editable accessor round-trip                                     *)
(* ------------------------------------------------------------------ *)

let test_entry_as_editable_round_trip () =
  let entry = new Entry.entry (Wrappers.Entry.new_ ()) in
  entry#set_text "round trip";
  let editable = entry#as_editable in
  check string "as_editable round-trip via Layer 1 get_text" "round trip"
    (Wrappers.Editable.get_text editable)

(* ------------------------------------------------------------------ *)
(* Button works normally — no Editable methods are accessible          *)
(* (the absence of set_text/get_text on Button is a compile-time       *)
(*  guarantee; this test verifies Button functionality is unaffected)  *)
(* ------------------------------------------------------------------ *)

let test_button_works_without_editable_interface () =
  let btn = new Button.button (Wrappers.Button.new_ ()) in
  btn#set_label "ok";
  check (option string) "button label works" (Some "ok") (btn#get_label ())

let () =
  run "Interface Support Tests (Phase 8)"
    [
      ( "Interface Inheritance (Editable via Entry)",
        [
          test_case "set_text / get_text via inherited method" `Quick
            (require_gtk test_entry_inherits_editable_set_get_text);
          test_case "delete_text via inherited method" `Quick
            (require_gtk test_entry_inherits_editable_delete_text);
          test_case "get_chars via inherited method" `Quick
            (require_gtk test_entry_inherits_editable_get_chars);
          test_case "set_position / get_position via inherited method" `Quick
            (require_gtk test_entry_inherits_editable_position);
        ] );
      ( "from_gobject",
        [
          test_case "succeeds for implementing class (Entry → Editable)" `Quick
            (require_gtk test_from_gobject_succeeds_for_entry);
          test_case
            "succeeds for second implementing class (SpinButton → Editable)"
            `Quick
            (require_gtk test_from_gobject_succeeds_for_spin_button);
          test_case "fails for non-implementing class (Button → Editable)"
            `Quick
            (require_gtk test_from_gobject_fails_for_button);
        ] );
      ( "Layer 1 interface methods",
        [
          test_case "set_text / get_text via Editable.t directly" `Quick
            (require_gtk test_layer1_editable_set_get_text);
          test_case "insert_text inserts at correct position" `Quick
            (require_gtk test_layer1_editable_insert_text);
          test_case "select_region + get_selection_bounds round-trip" `Quick
            (require_gtk
               test_layer1_editable_select_region_and_get_selection_bounds);
        ] );
      ( "as_editable accessor",
        [
          test_case "as_editable round-trip via Layer 1" `Quick
            (require_gtk test_entry_as_editable_round_trip);
        ] );
      ( "Non-implementing class isolation",
        [
          test_case "Button works normally (no Editable interface)" `Quick
            (require_gtk test_button_works_without_editable_interface);
        ] );
    ]
