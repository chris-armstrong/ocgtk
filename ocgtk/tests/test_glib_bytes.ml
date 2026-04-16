(** Glib_bytes Module Tests

    These tests validate the Glib_bytes implementation including:
    - Roundtrip (create from string, convert back to string)
    - Empty byte buffers
    - Size reporting
    - Binary data with null bytes
    - Large buffers
    - GC stress testing
    - Unicode data
*)

(** {2 Basic Roundtrip Tests} *)

let test_empty_roundtrip () =
  let b = Glib_bytes.create "" in
  let result = Glib_bytes.to_string b in
  Alcotest.(check string) "empty bytes roundtrip" "" result

let test_simple_string_roundtrip () =
  let b = Glib_bytes.create "hello, world" in
  let result = Glib_bytes.to_string b in
  Alcotest.(check string) "simple string roundtrip" "hello, world" result

(** {2 Size Tests} *)

let test_size_empty () =
  let b = Glib_bytes.create "" in
  Alcotest.(check int) "empty bytes size is 0" 0 (Glib_bytes.size b)

let test_size_nonempty () =
  let b = Glib_bytes.create "hello" in
  Alcotest.(check int) "5-char string size is 5" 5 (Glib_bytes.size b)

let test_size_matches_string_length () =
  let s = "the quick brown fox" in
  let b = Glib_bytes.create s in
  Alcotest.(check int)
    "size matches string length"
    (String.length s)
    (Glib_bytes.size b)

(** {2 Binary Data Tests} *)

let test_binary_null_bytes () =
  let s = "\x00\x01\x02\x03" in
  let b = Glib_bytes.create s in
  let result = Glib_bytes.to_string b in
  Alcotest.(check string) "binary data with null bytes roundtrip" s result

let test_binary_null_bytes_size () =
  let s = "\x00\x01\x02\x03" in
  let b = Glib_bytes.create s in
  Alcotest.(check int) "binary data size" 4 (Glib_bytes.size b)

let test_binary_all_byte_values () =
  (* Create a string with all byte values 0..255 *)
  let buf = Bytes.create 256 in
  for i = 0 to 255 do
    Bytes.set buf i (Char.chr i)
  done;
  let s = Bytes.to_string buf in
  let b = Glib_bytes.create s in
  let result = Glib_bytes.to_string b in
  Alcotest.(check string) "all byte values roundtrip" s result

(** {2 Large Buffer Test} *)

let test_large_buffer () =
  let size = 1024 * 1024 in (* 1 MB *)
  let s = String.make size 'x' in
  let b = Glib_bytes.create s in
  Alcotest.(check int) "large buffer size" size (Glib_bytes.size b);
  let result = Glib_bytes.to_string b in
  Alcotest.(check string) "large buffer roundtrip" s result

(** {2 GC Stress Test} *)

let test_gc_stress () =
  let last = ref (Glib_bytes.create "init") in
  for i = 0 to 9999 do
    last := Glib_bytes.create (string_of_int i)
  done;
  Gc.full_major ();
  let result = Glib_bytes.to_string !last in
  Alcotest.(check string) "gc stress: last value survives" "9999" result

(** {2 Unicode Data Test} *)

let test_unicode_roundtrip () =
  (* UTF-8 encoded string with multi-byte characters *)
  let s = "Hello, \xc3\xa9\xc3\xa0\xc3\xbc\xc3\xb6!" in (* é à ü ö *)
  let b = Glib_bytes.create s in
  let result = Glib_bytes.to_string b in
  Alcotest.(check string) "unicode data roundtrip" s result

(** {2 Multiple References Test} *)

let test_multiple_references () =
  let s = "shared data" in
  let b1 = Glib_bytes.create s in
  (* to_string copies data into a new OCaml string each time *)
  let r1 = Glib_bytes.to_string b1 in
  let r2 = Glib_bytes.to_string b1 in
  Alcotest.(check string) "first reference matches" s r1;
  Alcotest.(check string) "second reference matches" s r2;
  Alcotest.(check bool) "results are equal" true (String.equal r1 r2)

(** {2 Size After GC Test} *)

let test_size_after_gc () =
  let b = Glib_bytes.create "stable size" in
  Gc.compact ();
  Alcotest.(check int) "size stable after GC" 11 (Glib_bytes.size b)

(** {2 Test Suite} *)

let () =
  Alcotest.run "Glib_bytes"
    [
      ( "roundtrip",
        [
          Alcotest.test_case "empty bytes roundtrip" `Quick test_empty_roundtrip;
          Alcotest.test_case "simple string roundtrip" `Quick
            test_simple_string_roundtrip;
          Alcotest.test_case "unicode roundtrip" `Quick test_unicode_roundtrip;
          Alcotest.test_case "multiple references" `Quick
            test_multiple_references;
        ] );
      ( "size",
        [
          Alcotest.test_case "empty size" `Quick test_size_empty;
          Alcotest.test_case "nonempty size" `Quick test_size_nonempty;
          Alcotest.test_case "size matches string length" `Quick
            test_size_matches_string_length;
          Alcotest.test_case "size after GC" `Quick test_size_after_gc;
        ] );
      ( "binary",
        [
          Alcotest.test_case "null bytes roundtrip" `Quick
            test_binary_null_bytes;
          Alcotest.test_case "null bytes size" `Quick test_binary_null_bytes_size;
          Alcotest.test_case "all byte values roundtrip" `Quick
            test_binary_all_byte_values;
        ] );
      ( "large",
        [
          Alcotest.test_case "1MB buffer" `Slow test_large_buffer;
        ] );
      ( "gc",
        [
          Alcotest.test_case "gc stress 10000 objects" `Slow test_gc_stress;
        ] );
    ]
