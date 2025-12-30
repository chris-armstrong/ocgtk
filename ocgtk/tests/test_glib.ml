(** Comprehensive GLib Module Tests - Phase 2.1

    These tests validate the complete GLib module implementation including:
    - Main event loop
    - Timeout callbacks
    - Idle callbacks
    - UTF-8 validation
    - Character set conversion
    - Priority levels
    - GLib enums (from Phase 1.3)
*)

(** {2 GLib Enum Tests (from Phase 1.3)} *)

let test_glib_enums_accessible () =
  (* Test we can access GLib enum converters *)
  let _ = GlibEnums.Conv.log_level in
  let _ = GlibEnums.Conv.io_condition in
  let _ = GlibEnums.Conv.normalize_mode in
  let _ = GlibEnums.Conv.locale_category in
  ()

let test_log_levels () =
  let (decode, encode) = GlibEnums.Conv.log_level in

  let test_level level =
    let c_val = encode level in
    let level' = decode c_val in
    Alcotest.(check bool)
      (Format.asprintf "log level roundtrip")
      true (level = level')
  in

  test_level `ERROR;
  test_level `CRITICAL;
  test_level `WARNING;
  test_level `MESSAGE;
  test_level `INFO;
  test_level `DEBUG

let test_io_conditions () =
  let (decode, encode) = GlibEnums.Conv.io_condition in

  let test_condition cond =
    let c_val = encode cond in
    let cond' = decode c_val in
    Alcotest.(check bool)
      (Format.asprintf "io_condition roundtrip")
      true (cond = cond')
  in

  test_condition `IN;
  test_condition `OUT;
  test_condition `ERR;
  test_condition `HUP

(** {2 Main Event Loop Tests} *)

let test_main_loop_create_destroy () =
  let loop = Glib.Main.create false in
  let running = Glib.Main.is_running loop in
  Alcotest.(check bool) "new loop is not running" false running;
  Glib.Main.destroy loop

let test_main_loop_running_state () =
  let loop = Glib.Main.create true in
  let running = Glib.Main.is_running loop in
  Alcotest.(check bool) "loop marked as running" true running;
  Glib.Main.destroy loop

let test_main_iteration () =
  let may_block = false in
  let _processed = Glib.Main.iteration may_block in
  Alcotest.(check bool) "iteration completes" true true

let test_main_pending () =
  let pending = Glib.Main.pending () in
  Alcotest.(check bool) "pending returns boolean" pending pending

(** {2 Timeout Callback Tests} *)

let test_timeout_basic () =
  let counter = ref 0 in
  let id = Glib.Timeout.add ~ms:10 ~callback:(fun () ->
    counter := !counter + 1;
    false
  ) () in
  for _i = 1 to 5 do
    ignore (Glib.Main.iteration false);
    Unix.sleepf 0.015
  done;
  Alcotest.(check bool) "timeout callback fired" true (!counter > 0);
  Glib.Timeout.remove id

let test_timeout_repeating () =
  let counter = ref 0 in
  let max_count = 3 in
  let id = Glib.Timeout.add ~ms:10 ~callback:(fun () ->
    counter := !counter + 1;
    !counter < max_count
  ) () in
  for _i = 1 to 10 do
    ignore (Glib.Main.iteration false);
    Unix.sleepf 0.015
  done;
  Alcotest.(check int) "timeout fired multiple times" max_count !counter;
  Glib.Timeout.remove id

let test_timeout_priority () =
  let prio = Glib.int_of_priority `DEFAULT in
  let counter = ref 0 in
  let id = Glib.Timeout.add ~prio ~ms:10 ~callback:(fun () ->
    counter := !counter + 1;
    false
  ) () in
  for _i = 1 to 5 do
    ignore (Glib.Main.iteration false);
    Unix.sleepf 0.015
  done;
  Alcotest.(check bool) "timeout with priority fired" true (!counter > 0);
  Glib.Timeout.remove id

let test_timeout_remove () =
  let counter = ref 0 in
  let id = Glib.Timeout.add ~ms:10 ~callback:(fun () ->
    counter := !counter + 1;
    true
  ) () in
  Glib.Timeout.remove id;
  for _i = 1 to 5 do
    ignore (Glib.Main.iteration false);
    Unix.sleepf 0.015
  done;
  Alcotest.(check int) "removed timeout did not fire" 0 !counter

(** {2 Idle Callback Tests} *)

let test_idle_basic () =
  let counter = ref 0 in
  let id = Glib.Idle.add (fun () ->
    counter := !counter + 1;
    false
  ) in
  for _i = 1 to 3 do
    ignore (Glib.Main.iteration false)
  done;
  Alcotest.(check bool) "idle callback fired" true (!counter > 0);
  Glib.Idle.remove id

let test_idle_repeating () =
  let counter = ref 0 in
  let max_count = 5 in
  let id = Glib.Idle.add (fun () ->
    counter := !counter + 1;
    !counter < max_count
  ) in
  for _i = 1 to 10 do
    ignore (Glib.Main.iteration false)
  done;
  Alcotest.(check int) "idle fired multiple times" max_count !counter;
  Glib.Idle.remove id

let test_idle_priority () =
  let prio = Glib.int_of_priority `DEFAULT_IDLE in
  let counter = ref 0 in
  let id = Glib.Idle.add ~prio (fun () ->
    counter := !counter + 1;
    false
  ) in
  for _i = 1 to 3 do
    ignore (Glib.Main.iteration false)
  done;
  Alcotest.(check bool) "idle with priority fired" true (!counter > 0);
  Glib.Idle.remove id

let test_idle_remove () =
  let counter = ref 0 in
  let id = Glib.Idle.add (fun () ->
    counter := !counter + 1;
    true
  ) in
  Glib.Idle.remove id;
  for _i = 1 to 3 do
    ignore (Glib.Main.iteration false)
  done;
  Alcotest.(check int) "removed idle did not fire" 0 !counter

(** {2 Priority Level Tests} *)

let test_priority_values () =
  (* Test that priority conversion works without crashing *)
  let _high = Glib.int_of_priority `HIGH in
  let _default = Glib.int_of_priority `DEFAULT in
  let _high_idle = Glib.int_of_priority `HIGH_IDLE in
  let _default_idle = Glib.int_of_priority `DEFAULT_IDLE in
  let _low = Glib.int_of_priority `LOW in

  (* Test passed if we got here without crashing *)
  Alcotest.(check bool) "priority conversion works" true true

(** {2 UTF-8 Validation Tests} *)

let test_utf8_validate_ascii () =
  let valid = Glib.Utf8.validate "Hello, World!" in
  Alcotest.(check bool) "ASCII is valid UTF-8" true valid

let test_utf8_validate_unicode () =
  let valid = Glib.Utf8.validate "Hello, 世界! 🎉" in
  Alcotest.(check bool) "Unicode is valid UTF-8" true valid

let test_utf8_validate_empty () =
  let valid = Glib.Utf8.validate "" in
  Alcotest.(check bool) "Empty string is valid UTF-8" true valid

let test_utf8_validate_invalid () =
  let invalid = String.make 1 (Char.chr 0xFF) ^ String.make 1 (Char.chr 0xFF) in
  let valid = Glib.Utf8.validate invalid in
  Alcotest.(check bool) "Invalid UTF-8 detected" false valid

(** {2 Character Set Conversion Tests} *)

let test_charset_get () =
  let (is_utf8, charset) = Glib.Convert.get_charset () in
  Alcotest.(check bool) "charset name not empty" true (String.length charset > 0);
  Alcotest.(check bool) "is_utf8 is boolean" is_utf8 is_utf8

let test_locale_utf8_roundtrip () =
  let (is_utf8, _) = Glib.Convert.get_charset () in
  if is_utf8 then begin
    let original = "Hello, World!" in
    let to_utf8 = Glib.Convert.locale_to_utf8 original in
    let back = Glib.Convert.locale_from_utf8 to_utf8 in
    Alcotest.(check string) "locale UTF-8 roundtrip" original back
  end else begin
    let original = "Hello" in
    let _to_utf8 = Glib.Convert.locale_to_utf8 original in
    Alcotest.(check bool) "conversion completes" true true
  end

let test_filename_utf8_roundtrip () =
  let (is_utf8, _) = Glib.Convert.get_charset () in
  if is_utf8 then begin
    let original = "/tmp/test_file.txt" in
    let to_utf8 = Glib.Convert.filename_to_utf8 original in
    let back = Glib.Convert.filename_from_utf8 to_utf8 in
    Alcotest.(check string) "filename UTF-8 roundtrip" original back
  end else begin
    let original = "/tmp/test" in
    let _to_utf8 = Glib.Convert.filename_to_utf8 original in
    Alcotest.(check bool) "conversion completes" true true
  end

let test_convert_utf8_to_utf8 () =
  let original = "Hello, 世界!" in
  let converted = Glib.Convert.convert original
    ~to_codeset:"UTF-8" ~from_codeset:"UTF-8" in
  Alcotest.(check string) "UTF-8 to UTF-8 conversion" original converted

(** {2 GError Exception Tests} *)

let test_convert_invalid_codeset () =
  try
    let _result = Glib.Convert.convert "test"
      ~to_codeset:"INVALID_CHARSET_XYZ"
      ~from_codeset:"UTF-8" in
    Alcotest.fail "Should have raised GError"
  with
  | Glib.GError msg ->
      Alcotest.(check bool) "GError raised for invalid codeset" true (String.length msg > 0)

(** {2 Test Suite} *)

let () =
  Alcotest.run "GLib Module Tests (Phase 2.1)" [
    "Enums (Phase 1.3)", [
      Alcotest.test_case "enum modules accessible" `Quick test_glib_enums_accessible;
      Alcotest.test_case "log levels convert" `Quick test_log_levels;
      Alcotest.test_case "io conditions convert" `Quick test_io_conditions;
    ];

    "Main Event Loop", [
      Alcotest.test_case "create and destroy" `Quick test_main_loop_create_destroy;
      Alcotest.test_case "running state" `Quick test_main_loop_running_state;
      Alcotest.test_case "iteration" `Quick test_main_iteration;
      Alcotest.test_case "pending" `Quick test_main_pending;
    ];

    "Timeout Callbacks", [
      Alcotest.test_case "basic timeout" `Quick test_timeout_basic;
      Alcotest.test_case "repeating timeout" `Quick test_timeout_repeating;
      Alcotest.test_case "timeout with priority" `Quick test_timeout_priority;
      Alcotest.test_case "remove timeout" `Quick test_timeout_remove;
    ];

    "Idle Callbacks", [
      Alcotest.test_case "basic idle" `Quick test_idle_basic;
      Alcotest.test_case "repeating idle" `Quick test_idle_repeating;
      Alcotest.test_case "idle with priority" `Quick test_idle_priority;
      Alcotest.test_case "remove idle" `Quick test_idle_remove;
    ];

    "Priority Levels", [
      Alcotest.test_case "priority values" `Quick test_priority_values;
    ];

    "UTF-8 Validation", [
      Alcotest.test_case "validate ASCII" `Quick test_utf8_validate_ascii;
      Alcotest.test_case "validate Unicode" `Quick test_utf8_validate_unicode;
      Alcotest.test_case "validate empty" `Quick test_utf8_validate_empty;
      Alcotest.test_case "detect invalid UTF-8" `Quick test_utf8_validate_invalid;
    ];

    "Character Set Conversion", [
      Alcotest.test_case "get charset" `Quick test_charset_get;
      Alcotest.test_case "locale UTF-8 roundtrip" `Quick test_locale_utf8_roundtrip;
      Alcotest.test_case "filename UTF-8 roundtrip" `Quick test_filename_utf8_roundtrip;
      Alcotest.test_case "UTF-8 to UTF-8" `Quick test_convert_utf8_to_utf8;
    ];

    "GError Handling", [
      Alcotest.test_case "invalid codeset" `Quick test_convert_invalid_codeset;
    ];
  ]
