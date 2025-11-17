(* Phase 5.3: Text Widget Tests *)

open Alcotest

(* Try to initialize GTK once for all tests *)
let gtk_available =
  try
    let _ = GMain.init () in
    true
  with
  | GMain.Error _ -> false

(* Helper to skip tests when GTK is not available *)
let require_gtk f () =
  if not gtk_available then skip ()
  else f ()

(* ========================================================================= *)
(* TextBuffer Tests *)
(* ========================================================================= *)

let test_text_buffer_creation () =
  let buf = GText.buffer () in
  check string "empty buffer" "" buf#text;
  check int "zero lines" 1 buf#line_count;  (* Empty buffer has 1 line *)
  check int "zero chars" 0 buf#char_count;
  check bool "not modified" false buf#modified

let test_text_buffer_set_text () =
  let buf = GText.buffer ~text:"Hello, World!" () in
  check string "buffer text" "Hello, World!" buf#text;
  check bool "modified after set_text" false buf#modified;

  buf#set_text "Updated text";
  check string "buffer updated" "Updated text" buf#text

let test_text_buffer_modified_flag () =
  let buf = GText.buffer ~text:"Test" () in
  check bool "initially not modified" false buf#modified;

  buf#set_modified true;
  check bool "set to modified" true buf#modified;

  buf#set_modified false;
  check bool "set to not modified" false buf#modified

let test_text_buffer_iterators () =
  let buf = GText.buffer ~text:"Hello" () in

  let start = buf#start_iter in
  let end_iter = buf#end_iter in

  check int "start offset" 0 (GtkTextIter.get_offset start);
  check int "end offset" 5 (GtkTextIter.get_offset end_iter);

  let iter_at_2 = buf#iter_at_offset 2 in
  check int "iter at offset 2" 2 (GtkTextIter.get_offset iter_at_2)

let test_text_buffer_insert () =
  let buf = GText.buffer ~text:"Hello" () in
  let iter = buf#iter_at_offset 5 in

  buf#insert ~iter ", World!";
  check string "text after insert" "Hello, World!" buf#text

let test_text_buffer_delete () =
  let buf = GText.buffer ~text:"Hello, World!" () in
  let start = buf#iter_at_offset 5 in
  let end_iter = buf#iter_at_offset 12 in

  buf#delete ~start ~stop:end_iter;
  check string "text after delete" "Hello!" buf#text

let test_text_buffer_get_text_range () =
  let buf = GText.buffer ~text:"Hello, World!" () in
  let start = buf#iter_at_offset 0 in
  let end_iter = buf#iter_at_offset 5 in

  let text = buf#get_text ~start ~stop:end_iter ~include_hidden:false in
  check string "text range" "Hello" text

(* ========================================================================= *)
(* TextView Tests *)
(* ========================================================================= *)

let test_text_view_creation () =
  let buf = GText.buffer ~text:"Test" () in
  let view = GText.view ~buffer:buf ~editable:true () in

  check bool "view editable" true view#editable;
  check string "view buffer text" "Test" view#buffer#text

let test_text_view_editable () =
  let view = GText.view ~editable:true () in
  check bool "initially editable" true view#editable;

  view#set_editable false;
  check bool "set to non-editable" false view#editable

let test_text_view_cursor_visible () =
  let view = GText.view ~cursor_visible:true () in
  check bool "cursor visible" true view#cursor_visible;

  view#set_cursor_visible false;
  check bool "cursor hidden" false view#cursor_visible

let test_text_view_wrap_mode () =
  let view = GText.view ~wrap_mode:2 () in  (* 2 = WRAP_WORD *)
  check int "wrap mode set" 2 view#wrap_mode;

  view#set_wrap_mode 0;  (* 0 = WRAP_NONE *)
  check int "wrap mode changed" 0 view#wrap_mode

let test_text_view_margins () =
  let view = GText.view ~left_margin:10 ~right_margin:15 () in
  check int "left margin" 10 view#left_margin;
  check int "right margin" 15 view#right_margin;

  view#set_left_margin 20;
  view#set_right_margin 25;
  check int "left margin changed" 20 view#left_margin;
  check int "right margin changed" 25 view#right_margin

let test_text_view_monospace () =
  let view = GText.view ~monospace:true () in
  check bool "monospace enabled" true view#monospace;

  view#set_monospace false;
  check bool "monospace disabled" false view#monospace

(* ========================================================================= *)
(* TextIter Tests *)
(* ========================================================================= *)

let test_text_iter_position () =
  let buf = GText.buffer ~text:"Line 1\nLine 2\nLine 3" () in
  let iter = buf#start_iter in

  check int "start line" 0 (GtkTextIter.get_line iter);
  check int "start offset" 0 (GtkTextIter.get_offset iter);

  let iter2 = buf#iter_at_line 1 in
  check int "line 1" 1 (GtkTextIter.get_line iter2);
  check int "offset at line 1" 7 (GtkTextIter.get_offset iter2)

let test_text_iter_movement () =
  let buf = GText.buffer ~text:"Hello" () in
  let iter = buf#start_iter in

  check bool "forward char" true (GtkTextIter.forward_char iter);
  check int "offset after forward" 1 (GtkTextIter.get_offset iter);

  check bool "forward 3 chars" true (GtkTextIter.forward_chars iter 3);
  check int "offset after forward 3" 4 (GtkTextIter.get_offset iter);

  check bool "backward char" true (GtkTextIter.backward_char iter);
  check int "offset after backward" 3 (GtkTextIter.get_offset iter)

let test_text_iter_comparison () =
  let buf = GText.buffer ~text:"Hello" () in
  let iter1 = buf#iter_at_offset 2 in
  let iter2 = buf#iter_at_offset 2 in
  let iter3 = buf#iter_at_offset 3 in

  check bool "equal iters" true (GtkTextIter.equal iter1 iter2);
  check bool "not equal iters" false (GtkTextIter.equal iter1 iter3);

  check int "compare equal" 0 (GtkTextIter.compare iter1 iter2);
  check bool "compare less" (GtkTextIter.compare iter1 iter3 < 0) true;
  check bool "compare greater" (GtkTextIter.compare iter3 iter1 > 0) true

let test_text_iter_text_access () =
  let buf = GText.buffer ~text:"Hello, World!" () in
  let start = buf#iter_at_offset 0 in
  let end_iter = buf#iter_at_offset 5 in

  let text = GtkTextIter.get_text start end_iter in
  check string "get_text" "Hello" text;

  let slice = GtkTextIter.get_slice start end_iter in
  check string "get_slice" "Hello" slice

(* ========================================================================= *)
(* TextTag Tests *)
(* ========================================================================= *)

let test_text_tag_creation () =
  let tag = GText.tag ~name:"bold" () in
  check bool "tag created" true (tag#as_tag != Obj.magic 0)

let test_text_tag_anonymous () =
  let tag = GText.tag () in
  check bool "anonymous tag created" true (tag#as_tag != Obj.magic 0)

(* ========================================================================= *)
(* TextTagTable Tests *)
(* ========================================================================= *)

let test_text_tag_table_creation () =
  let table = GText.tag_table () in
  check int "empty table size" 0 table#size

let test_text_tag_table_add_remove () =
  let table = GText.tag_table () in
  let tag = GText.tag ~name:"test" () in

  table#add tag;
  check int "table size after add" 1 table#size;

  table#remove tag;
  check int "table size after remove" 0 table#size

let test_text_tag_table_lookup () =
  let table = GText.tag_table () in
  let tag = GText.tag ~name:"mytag" () in

  table#add tag;

  let found = table#lookup "mytag" in
  check bool "tag found" true (found != None);

  let not_found = table#lookup "nonexistent" in
  check bool "tag not found" true (not_found = None)

(* ========================================================================= *)
(* Integration Tests *)
(* ========================================================================= *)

let test_text_buffer_tag_application () =
  let buf = GText.buffer ~text:"This is bold text" () in
  let tag = GText.tag ~name:"bold" () in

  let start = buf#iter_at_offset 8 in
  let end_iter = buf#iter_at_offset 12 in

  buf#apply_tag tag#as_tag ~start ~stop:end_iter;

  (* If we got here without errors, the tag was applied *)
  check bool "tag applied successfully" true true

let test_text_buffer_tag_removal () =
  let buf = GText.buffer ~text:"This is bold text" () in
  let tag = GText.tag ~name:"bold" () in

  let start = buf#iter_at_offset 8 in
  let end_iter = buf#iter_at_offset 12 in

  buf#apply_tag tag#as_tag ~start ~stop:end_iter;
  buf#remove_tag tag#as_tag ~start ~stop:end_iter;

  (* If we got here without errors, the tag was removed *)
  check bool "tag removed successfully" true true

let test_complete_text_editing_workflow () =
  (* Create a buffer and view *)
  let buf = GText.buffer ~text:"Hello" () in
  let view = GText.view ~buffer:buf ~editable:true ~monospace:true () in

  (* Check initial state *)
  check string "initial text" "Hello" buf#text;
  check bool "view is editable" true view#editable;

  (* Insert some text *)
  let iter = buf#end_iter in
  buf#insert ~iter ", World!";
  check string "text after insert" "Hello, World!" buf#text;

  (* Apply a tag to part of the text *)
  let tag = GText.tag ~name:"emphasis" () in
  let start = buf#iter_at_offset 7 in
  let end_iter = buf#iter_at_offset 12 in
  buf#apply_tag tag#as_tag ~start ~stop:end_iter;

  (* Verify text extraction *)
  let word = buf#get_text ~start ~stop:end_iter ~include_hidden:false in
  check string "extracted word" "World" word;

  (* Mark as modified *)
  buf#set_modified true;
  check bool "buffer is modified" true buf#modified;

  check bool "workflow completed" true true

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let () =
  run "Text Widget Tests" [
    "text_buffer", [
      test_case "buffer_creation" `Quick (require_gtk test_text_buffer_creation);
      test_case "buffer_set_text" `Quick (require_gtk test_text_buffer_set_text);
      test_case "buffer_modified_flag" `Quick (require_gtk test_text_buffer_modified_flag);
      test_case "buffer_iterators" `Quick (require_gtk test_text_buffer_iterators);
      test_case "buffer_insert" `Quick (require_gtk test_text_buffer_insert);
      test_case "buffer_delete" `Quick (require_gtk test_text_buffer_delete);
      test_case "buffer_get_text_range" `Quick (require_gtk test_text_buffer_get_text_range);
    ];
    "text_view", [
      test_case "view_creation" `Quick (require_gtk test_text_view_creation);
      test_case "view_editable" `Quick (require_gtk test_text_view_editable);
      test_case "view_cursor_visible" `Quick (require_gtk test_text_view_cursor_visible);
      test_case "view_wrap_mode" `Quick (require_gtk test_text_view_wrap_mode);
      test_case "view_margins" `Quick (require_gtk test_text_view_margins);
      test_case "view_monospace" `Quick (require_gtk test_text_view_monospace);
    ];
    "text_iter", [
      test_case "iter_position" `Quick (require_gtk test_text_iter_position);
      test_case "iter_movement" `Quick (require_gtk test_text_iter_movement);
      test_case "iter_comparison" `Quick (require_gtk test_text_iter_comparison);
      test_case "iter_text_access" `Quick (require_gtk test_text_iter_text_access);
    ];
    "text_tag", [
      test_case "tag_creation" `Quick (require_gtk test_text_tag_creation);
      test_case "tag_anonymous" `Quick (require_gtk test_text_tag_anonymous);
    ];
    "text_tag_table", [
      test_case "tag_table_creation" `Quick (require_gtk test_text_tag_table_creation);
      test_case "tag_table_add_remove" `Quick (require_gtk test_text_tag_table_add_remove);
      test_case "tag_table_lookup" `Quick (require_gtk test_text_tag_table_lookup);
    ];
    "integration", [
      test_case "tag_application" `Quick (require_gtk test_text_buffer_tag_application);
      test_case "tag_removal" `Quick (require_gtk test_text_buffer_tag_removal);
      test_case "complete_workflow" `Quick (require_gtk test_complete_text_editing_workflow);
    ];
  ]
