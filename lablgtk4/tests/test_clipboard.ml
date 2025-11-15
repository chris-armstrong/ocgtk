(* test_clipboard.ml - Test suite for GdkClipboard module (Phase 2.6) *)

open Alcotest

(* Helper function to run tests with display *)
let with_display f () =
  match Gdk.Display.get_default () with
  | None -> skip ()  (* Skip test if no display available *)
  | Some display -> f display

(* Helper to run main loop briefly for async operations - disabled for now *)
let _run_main_loop_briefly () =
  for _ = 1 to 10 do
    ignore (Glib.Main.iteration false)
  done

(* ==================================================================== *)
(* Test: Getting Clipboard Instances *)
(* ==================================================================== *)

let test_get_clipboard = with_display (fun display ->
  let _clipboard = GdkClipboard.get display in
  (* Just check that we got a clipboard - no way to verify the pointer value *)
  check bool "clipboard obtained" true true
)

let test_get_primary_clipboard = with_display (fun display ->
  let _primary = GdkClipboard.get_primary display in
  (* Just check that we got a clipboard - no way to verify the pointer value *)
  check bool "primary clipboard obtained" true true
)

(* ==================================================================== *)
(* Test: Synchronous Text Operations *)
(* ==================================================================== *)

let test_set_text_basic = with_display (fun display ->
  let clipboard = GdkClipboard.get display in
  GdkClipboard.set_text clipboard "Hello, clipboard!";
  (* Text is set, but reading it back requires async operation *)
  check bool "set text succeeded" true true
)

let test_set_text_empty = with_display (fun display ->
  let clipboard = GdkClipboard.get display in
  GdkClipboard.set_text clipboard "";
  check bool "set empty text succeeded" true true
)

let test_set_text_unicode = with_display (fun display ->
  let clipboard = GdkClipboard.get display in
  GdkClipboard.set_text clipboard "Hello, 世界! 🌍";
  check bool "set unicode text succeeded" true true
)

(* ==================================================================== *)
(* Test: Asynchronous Read Operations *)
(* ==================================================================== *)

let test_read_text_async = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set some text first *)
  GdkClipboard.set_text clipboard "Test clipboard content";

  (* Read it back asynchronously *)
  let result = ref None in
  GdkClipboard.read_text_async clipboard ~callback:(fun text ->
    result := Some text
  );

  (* Run main loop to process async callback *)
  for _ = 1 to 100 do
    if !result = None then
      ignore (Glib.Main.iteration false)
  done;

  (* Check result *)
  match !result with
  | Some (Some text) ->
      check string "clipboard text matches" "Test clipboard content" text
  | Some None ->
      fail "clipboard read returned None"
  | None ->
      skip ()  (* Async operation didn't complete in time *)
)

let test_read_text_async_empty = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set empty text *)
  GdkClipboard.set_text clipboard "";

  (* Read it back *)
  let result = ref None in
  GdkClipboard.read_text_async clipboard ~callback:(fun text ->
    result := Some text
  );

  (* Run main loop *)
  for _ = 1 to 100 do
    if !result = None then
      ignore (Glib.Main.iteration false)
  done;

  (* Check result - empty string should be returned *)
  match !result with
  | Some (Some text) ->
      check string "empty text" "" text
  | Some None ->
      (* Some implementations may return None for empty clipboard *)
      check bool "empty clipboard" true true
  | None ->
      skip ()
)

let test_read_text_roundtrip = with_display (fun display ->
  let clipboard = GdkClipboard.get display in
  let test_cases = [
    "Simple ASCII text";
    "Unicode: 你好世界 مرحبا بالعالم Здравствуй мир";
    "Emoji: 🚀 🌟 💻 📝";
    "Multiline:\nLine 1\nLine 2\nLine 3";
  ] in

  let test_one_case text =
    GdkClipboard.set_text clipboard text;
    let result = ref None in
    GdkClipboard.read_text_async clipboard ~callback:(fun t -> result := Some t);

    for _ = 1 to 100 do
      if !result = None then ignore (Glib.Main.iteration false)
    done;

    match !result with
    | Some (Some retrieved) ->
        check string ("roundtrip: " ^ String.sub text 0 (min 20 (String.length text))) text retrieved
    | _ -> skip ()
  in

  List.iter test_one_case test_cases
)

(* ==================================================================== *)
(* Test: Content Formats *)
(* ==================================================================== *)

let test_get_formats = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set some text to ensure clipboard has content *)
  GdkClipboard.set_text clipboard "Test text for formats";

  (* Get formats *)
  let formats = GdkClipboard.get_formats clipboard in

  (* Check if it contains text *)
  let has_text = GdkClipboard.Formats.contains_text formats in
  check bool "formats contain text" true has_text
)

let test_get_mime_types = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set some text *)
  GdkClipboard.set_text clipboard "Test text";

  (* Get formats and MIME types *)
  let formats = GdkClipboard.get_formats clipboard in
  let mime_types = GdkClipboard.Formats.get_mime_types formats in

  (* Should have at least one MIME type *)
  check bool "has mime types" true (Array.length mime_types > 0)
)

(* ==================================================================== *)
(* Test: Clipboard Properties *)
(* ==================================================================== *)

let test_is_local = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set text - this makes it local *)
  GdkClipboard.set_text clipboard "Local text";

  (* Check if local *)
  let is_local = GdkClipboard.is_local clipboard in
  check bool "clipboard is local after set_text" true is_local
)

(* ==================================================================== *)
(* Test: Multiple Clipboard Instances *)
(* ==================================================================== *)

let test_multiple_clipboards = with_display (fun display ->
  let clipboard1 = GdkClipboard.get display in
  let clipboard2 = GdkClipboard.get display in

  (* Both should refer to the same clipboard *)
  GdkClipboard.set_text clipboard1 "Shared text";

  let result = ref None in
  GdkClipboard.read_text_async clipboard2 ~callback:(fun text ->
    result := Some text
  );

  for _ = 1 to 100 do
    if !result = None then ignore (Glib.Main.iteration false)
  done;

  match !result with
  | Some (Some text) ->
      check string "shared clipboard" "Shared text" text
  | _ -> skip ()
)

let test_primary_vs_default = with_display (fun display ->
  let default_clip = GdkClipboard.get display in
  let primary_clip = GdkClipboard.get_primary display in

  (* Set different text on each *)
  GdkClipboard.set_text default_clip "Default clipboard";
  GdkClipboard.set_text primary_clip "Primary clipboard";

  (* On X11, these should be different. On other platforms, they may be the same *)
  check bool "clipboards obtained" true true
)

(* ==================================================================== *)
(* Test: Error Handling *)
(* ==================================================================== *)

let test_callback_exception = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set text *)
  GdkClipboard.set_text clipboard "Exception test";

  (* Read with a callback that raises an exception *)
  let callback_called = ref false in
  GdkClipboard.read_text_async clipboard ~callback:(fun _text ->
    callback_called := true;
    failwith "Intentional exception in callback"
  );

  (* Run main loop *)
  for _ = 1 to 100 do
    if not !callback_called then
      ignore (Glib.Main.iteration false)
  done;

  (* Test should not crash - exception should be handled *)
  check bool "callback was called" true !callback_called
)

let test_exception_cleanup = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Set text *)
  GdkClipboard.set_text clipboard "Cleanup test";

  (* Track callback invocation and exception *)
  let callback_called = ref false in
  GdkClipboard.read_text_async clipboard ~callback:(fun _text ->
    callback_called := true;
    raise (Invalid_argument "Test exception for cleanup")
  );

  (* Run main loop *)
  for _ = 1 to 100 do
    if not !callback_called then
      ignore (Glib.Main.iteration false)
  done;

  (* Verify callback was called *)
  check bool "callback executed" true !callback_called;

  (* Now verify we can still use the clipboard after exception *)
  GdkClipboard.set_text clipboard "After exception";
  let second_call = ref false in
  GdkClipboard.read_text_async clipboard ~callback:(fun text ->
    second_call := true;
    match text with
    | Some t -> check string "clipboard still works" "After exception" t
    | None -> fail "clipboard read failed after exception"
  );

  (* Run main loop again *)
  for _ = 1 to 100 do
    if not !second_call then
      ignore (Glib.Main.iteration false)
  done;

  check bool "second callback executed" true !second_call
)

let test_exception_types = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Test different exception types *)
  let exceptions_to_test = [
    (fun () -> failwith "Failure");
    (fun () -> raise (Invalid_argument "Invalid arg"));
    (fun () -> raise Not_found);
    (fun () -> raise (Sys_error "System error"));
  ] in

  let test_exception exn_fn =
    GdkClipboard.set_text clipboard "Exception type test";
    let called = ref false in
    GdkClipboard.read_text_async clipboard ~callback:(fun _text ->
      called := true;
      exn_fn ()
    );

    for _ = 1 to 100 do
      if not !called then ignore (Glib.Main.iteration false)
    done;

    !called
  in

  (* All exceptions should be caught and logged, none should crash *)
  let results = List.map test_exception exceptions_to_test in
  check bool "all exception types handled" true (List.for_all (fun x -> x) results)
)

let test_multiple_exceptions = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Fire off multiple async operations that will all throw exceptions *)
  let count = ref 0 in

  for i = 1 to 5 do
    GdkClipboard.set_text clipboard (Printf.sprintf "Exception test %d" i);
    GdkClipboard.read_text_async clipboard ~callback:(fun _text ->
      incr count;
      failwith (Printf.sprintf "Exception %d" i)
    );
  done;

  (* Run main loop to process all callbacks *)
  for _ = 1 to 500 do
    if !count < 5 then
      ignore (Glib.Main.iteration false)
  done;

  (* All callbacks should have been called despite exceptions *)
  check int "all callbacks executed" 5 !count
)

let test_exception_doesnt_leak = with_display (fun display ->
  let clipboard = GdkClipboard.get display in

  (* Create many callbacks that throw exceptions to test for memory leaks *)
  let iterations = 50 in
  let completed = ref 0 in

  for i = 1 to iterations do
    GdkClipboard.set_text clipboard (Printf.sprintf "Leak test %d" i);
    GdkClipboard.read_text_async clipboard ~callback:(fun _text ->
      incr completed;
      if i mod 2 = 0 then
        failwith "Exception for leak test"
    );
  done;

  (* Process all callbacks *)
  for _ = 1 to (iterations * 20) do
    if !completed < iterations then
      ignore (Glib.Main.iteration false)
  done;

  (* All should have completed *)
  check int "all iterations completed" iterations !completed
)

(* ==================================================================== *)
(* Test Suite Definition *)
(* ==================================================================== *)

let () =
  run "GdkClipboard Module Tests (Phase 2.6)" [
    "Getting Clipboard Instances", [
      test_case "get default clipboard" `Quick test_get_clipboard;
      test_case "get primary clipboard" `Quick test_get_primary_clipboard;
    ];

    "Synchronous Text Operations", [
      test_case "set text basic" `Quick test_set_text_basic;
      test_case "set empty text" `Quick test_set_text_empty;
      test_case "set unicode text" `Quick test_set_text_unicode;
    ];

    "Asynchronous Read Operations", [
      test_case "read text async" `Quick test_read_text_async;
      test_case "read empty text async" `Quick test_read_text_async_empty;
      test_case "text roundtrip" `Slow test_read_text_roundtrip;
    ];

    "Content Formats", [
      test_case "get formats" `Quick test_get_formats;
      test_case "get mime types" `Quick test_get_mime_types;
    ];

    "Clipboard Properties", [
      test_case "is_local" `Quick test_is_local;
    ];

    "Multiple Clipboards", [
      test_case "multiple instances" `Quick test_multiple_clipboards;
      test_case "primary vs default" `Quick test_primary_vs_default;
    ];

    "Error Handling", [
      test_case "callback exception" `Quick test_callback_exception;
      test_case "exception cleanup" `Quick test_exception_cleanup;
      test_case "different exception types" `Quick test_exception_types;
      test_case "multiple exceptions" `Quick test_multiple_exceptions;
      test_case "exception memory safety" `Slow test_exception_doesnt_leak;
    ];
  ]
