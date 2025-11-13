(** GLib Binding Tests

    Tests for GLib functionality. Currently minimal as we only have
    enum bindings. Will be expanded as more GLib bindings are added.

    Future tests will cover:
    - Main loop initialization
    - Timeout/idle callbacks
    - File monitoring (GFileMonitor)
    - String utilities
    - Error handling (GError)
*)

(** Test that GLib enum modules are accessible *)
let test_glib_enums_accessible () =
  (* Test we can access GLib enum converters *)
  let _ = GlibEnums.Conv.log_level in
  let _ = GlibEnums.Conv.io_condition in
  let _ = GlibEnums.Conv.normalize_mode in
  let _ = GlibEnums.Conv.locale_category in
  ()

(** Test GLib log levels map correctly *)
let test_log_levels () =
  let (decode, encode) = GlibEnums.Conv.log_level in

  (* Test critical log levels exist and convert *)
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

(** Test GLib I/O condition flags *)
let test_io_conditions () =
  let (decode, encode) = GlibEnums.Conv.io_condition in

  (* Test that common I/O conditions work *)
  let test_condition cond =
    let c_val = encode cond in
    let cond' = decode c_val in
    Alcotest.(check bool)
      (Format.asprintf "io_condition roundtrip")
      true (cond = cond')
  in

  test_condition `IN;   (* Data available for reading *)
  test_condition `OUT;  (* Data can be written *)
  test_condition `ERR;  (* Error condition *)
  test_condition `HUP   (* Hang up *)

let () =
  Alcotest.run "GLib Bindings" [
    "Enums", [
      Alcotest.test_case "enum modules accessible" `Quick test_glib_enums_accessible;
      Alcotest.test_case "log levels convert" `Quick test_log_levels;
      Alcotest.test_case "io conditions convert" `Quick test_io_conditions;
    ];
  ]
