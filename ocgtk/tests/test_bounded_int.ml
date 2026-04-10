(**************************************************************************)
(*                ocgtk - OCaml bindings for GTK4                         *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License version 2, as published by the                       *)
(*    Free Software Foundation with the exception described in file       *)
(*    COPYING which comes with the library.                               *)
(*                                                                        *)
(*    Based on lablgtk3 (https://github.com/garrigue/lablgtk)             *)
(*                                                                        *)
(**************************************************************************)

(** Tests for bounded integer wrapper types: UInt8, Int8, UInt16, Int16,
    UInt32, Int32. *)

(** {2 UInt8 tests} *)

let test_uint8_min_value_accepted () =
  let _ = UInt8.of_int UInt8.min_value in
  Alcotest.(check pass) "UInt8 min_value accepted" () ()

let test_uint8_max_value_accepted () =
  let _ = UInt8.of_int UInt8.max_value in
  Alcotest.(check pass) "UInt8 max_value accepted" () ()

let test_uint8_below_min_rejected () =
  Alcotest.check_raises "UInt8 below min raises"
    (Invalid_argument "UInt8.of_int: -1 is out of range [0, 255]")
    (fun () -> ignore (UInt8.of_int (UInt8.min_value - 1)))

let test_uint8_above_max_rejected () =
  Alcotest.check_raises "UInt8 above max raises"
    (Invalid_argument "UInt8.of_int: 256 is out of range [0, 255]")
    (fun () -> ignore (UInt8.of_int (UInt8.max_value + 1)))

let test_uint8_negative_rejected () =
  Alcotest.check_raises "UInt8 negative rejected"
    (Invalid_argument "UInt8.of_int: -1 is out of range [0, 255]")
    (fun () -> ignore (UInt8.of_int (-1)))

let test_uint8_roundtrip () =
  List.iter
    (fun n ->
      Alcotest.(check int)
        (Printf.sprintf "UInt8 roundtrip %d" n)
        n
        (UInt8.to_int (UInt8.of_int n)))
    [ 0; 1; 127; 128; 254; 255 ]

let test_uint8_constants () =
  Alcotest.(check int) "UInt8 zero = 0" 0 (UInt8.to_int UInt8.zero);
  Alcotest.(check int) "UInt8 min_int = 0" 0 (UInt8.to_int UInt8.min_int);
  Alcotest.(check int) "UInt8 max_int = 255" 255 (UInt8.to_int UInt8.max_int);
  Alcotest.(check int) "UInt8 min_value = 0" 0 UInt8.min_value;
  Alcotest.(check int) "UInt8 max_value = 255" 255 UInt8.max_value

(** {2 Int8 tests} *)

let test_int8_min_value_accepted () =
  let _ = Int8.of_int Int8.min_value in
  Alcotest.(check pass) "Int8 min_value accepted" () ()

let test_int8_max_value_accepted () =
  let _ = Int8.of_int Int8.max_value in
  Alcotest.(check pass) "Int8 max_value accepted" () ()

let test_int8_below_min_rejected () =
  Alcotest.check_raises "Int8 below min raises"
    (Invalid_argument "Int8.of_int: -129 is out of range [-128, 127]")
    (fun () -> ignore (Int8.of_int (Int8.min_value - 1)))

let test_int8_above_max_rejected () =
  Alcotest.check_raises "Int8 above max raises"
    (Invalid_argument "Int8.of_int: 128 is out of range [-128, 127]")
    (fun () -> ignore (Int8.of_int (Int8.max_value + 1)))

let test_int8_roundtrip () =
  List.iter
    (fun n ->
      Alcotest.(check int)
        (Printf.sprintf "Int8 roundtrip %d" n)
        n
        (Int8.to_int (Int8.of_int n)))
    [ -128; -1; 0; 1; 127 ]

let test_int8_constants () =
  Alcotest.(check int) "Int8 minus_one = -1" (-1) (Int8.to_int Int8.minus_one);
  Alcotest.(check int) "Int8 min_int = -128" (-128) (Int8.to_int Int8.min_int);
  Alcotest.(check int) "Int8 max_int = 127" 127 (Int8.to_int Int8.max_int);
  Alcotest.(check int) "Int8 min_value = -128" (-128) Int8.min_value;
  Alcotest.(check int) "Int8 max_value = 127" 127 Int8.max_value

(** {2 UInt16 tests} *)

let test_uint16_min_value_accepted () =
  let _ = UInt16.of_int UInt16.min_value in
  Alcotest.(check pass) "UInt16 min_value accepted" () ()

let test_uint16_max_value_accepted () =
  let _ = UInt16.of_int UInt16.max_value in
  Alcotest.(check pass) "UInt16 max_value accepted" () ()

let test_uint16_below_min_rejected () =
  Alcotest.check_raises "UInt16 below min raises"
    (Invalid_argument "UInt16.of_int: -1 is out of range [0, 65535]")
    (fun () -> ignore (UInt16.of_int (UInt16.min_value - 1)))

let test_uint16_above_max_rejected () =
  Alcotest.check_raises "UInt16 above max raises"
    (Invalid_argument "UInt16.of_int: 65536 is out of range [0, 65535]")
    (fun () -> ignore (UInt16.of_int (UInt16.max_value + 1)))

let test_uint16_negative_rejected () =
  Alcotest.check_raises "UInt16 negative rejected"
    (Invalid_argument "UInt16.of_int: -1 is out of range [0, 65535]")
    (fun () -> ignore (UInt16.of_int (-1)))

let test_uint16_roundtrip () =
  List.iter
    (fun n ->
      Alcotest.(check int)
        (Printf.sprintf "UInt16 roundtrip %d" n)
        n
        (UInt16.to_int (UInt16.of_int n)))
    [ 0; 1; 255; 256; 65534; 65535 ]

let test_uint16_constants () =
  Alcotest.(check int) "UInt16 zero = 0" 0 (UInt16.to_int UInt16.zero);
  Alcotest.(check int) "UInt16 min_int = 0" 0 (UInt16.to_int UInt16.min_int);
  Alcotest.(check int) "UInt16 max_int = 65535" 65535
    (UInt16.to_int UInt16.max_int);
  Alcotest.(check int) "UInt16 min_value = 0" 0 UInt16.min_value;
  Alcotest.(check int) "UInt16 max_value = 65535" 65535 UInt16.max_value

(** {2 Int16 tests} *)

let test_int16_min_value_accepted () =
  let _ = Int16.of_int Int16.min_value in
  Alcotest.(check pass) "Int16 min_value accepted" () ()

let test_int16_max_value_accepted () =
  let _ = Int16.of_int Int16.max_value in
  Alcotest.(check pass) "Int16 max_value accepted" () ()

let test_int16_below_min_rejected () =
  Alcotest.check_raises "Int16 below min raises"
    (Invalid_argument "Int16.of_int: -32769 is out of range [-32768, 32767]")
    (fun () -> ignore (Int16.of_int (Int16.min_value - 1)))

let test_int16_above_max_rejected () =
  Alcotest.check_raises "Int16 above max raises"
    (Invalid_argument "Int16.of_int: 32768 is out of range [-32768, 32767]")
    (fun () -> ignore (Int16.of_int (Int16.max_value + 1)))

let test_int16_roundtrip () =
  List.iter
    (fun n ->
      Alcotest.(check int)
        (Printf.sprintf "Int16 roundtrip %d" n)
        n
        (Int16.to_int (Int16.of_int n)))
    [ -32768; -1; 0; 1; 32767 ]

let test_int16_constants () =
  Alcotest.(check int) "Int16 minus_one = -1" (-1)
    (Int16.to_int Int16.minus_one);
  Alcotest.(check int) "Int16 min_int = -32768" (-32768)
    (Int16.to_int Int16.min_int);
  Alcotest.(check int) "Int16 max_int = 32767" 32767
    (Int16.to_int Int16.max_int);
  Alcotest.(check int) "Int16 min_value = -32768" (-32768) Int16.min_value;
  Alcotest.(check int) "Int16 max_value = 32767" 32767 Int16.max_value

(** {2 UInt32 tests} *)

let test_uint32_min_value_accepted () =
  let _ = UInt32.of_int UInt32.min_value in
  Alcotest.(check pass) "UInt32 min_value accepted" () ()

let test_uint32_max_value_accepted () =
  let _ = UInt32.of_int UInt32.max_value in
  Alcotest.(check pass) "UInt32 max_value accepted" () ()

let test_uint32_below_min_rejected () =
  Alcotest.check_raises "UInt32 below min raises"
    (Invalid_argument
       "UInt32.of_int: -1 is out of range [0, 4294967295]")
    (fun () -> ignore (UInt32.of_int (UInt32.min_value - 1)))

let test_uint32_above_max_rejected () =
  Alcotest.check_raises "UInt32 above max raises"
    (Invalid_argument
       "UInt32.of_int: 4294967296 is out of range [0, 4294967295]")
    (fun () -> ignore (UInt32.of_int (UInt32.max_value + 1)))

let test_uint32_negative_rejected () =
  Alcotest.check_raises "UInt32 negative rejected"
    (Invalid_argument
       "UInt32.of_int: -1 is out of range [0, 4294967295]")
    (fun () -> ignore (UInt32.of_int (-1)))

let test_uint32_roundtrip () =
  List.iter
    (fun n ->
      Alcotest.(check int)
        (Printf.sprintf "UInt32 roundtrip %d" n)
        n
        (UInt32.to_int (UInt32.of_int n)))
    [ 0; 1; 255; 65535; 2147483647; 4294967295 ]

let test_uint32_constants () =
  Alcotest.(check int) "UInt32 zero = 0" 0 (UInt32.to_int UInt32.zero);
  Alcotest.(check int) "UInt32 min_int = 0" 0 (UInt32.to_int UInt32.min_int);
  Alcotest.(check int) "UInt32 max_int = 4294967295" 4294967295
    (UInt32.to_int UInt32.max_int);
  Alcotest.(check int) "UInt32 min_value = 0" 0 UInt32.min_value;
  Alcotest.(check int) "UInt32 max_value = 4294967295" 4294967295
    UInt32.max_value

(** {2 Int32 tests} *)

let test_int32_min_value_accepted () =
  let _ = Int32.of_int Int32.min_value in
  Alcotest.(check pass) "Int32 min_value accepted" () ()

let test_int32_max_value_accepted () =
  let _ = Int32.of_int Int32.max_value in
  Alcotest.(check pass) "Int32 max_value accepted" () ()

let test_int32_below_min_rejected () =
  Alcotest.check_raises "Int32 below min raises"
    (Invalid_argument
       "Int32.of_int: -2147483649 is out of range [-2147483648, 2147483647]")
    (fun () -> ignore (Int32.of_int (Int32.min_value - 1)))

let test_int32_above_max_rejected () =
  Alcotest.check_raises "Int32 above max raises"
    (Invalid_argument
       "Int32.of_int: 2147483648 is out of range [-2147483648, 2147483647]")
    (fun () -> ignore (Int32.of_int (Int32.max_value + 1)))

let test_int32_roundtrip () =
  List.iter
    (fun n ->
      Alcotest.(check int)
        (Printf.sprintf "Int32 roundtrip %d" n)
        n
        (Int32.to_int (Int32.of_int n)))
    [ -2147483648; -1; 0; 1; 2147483647 ]

let test_int32_constants () =
  Alcotest.(check int) "Int32 minus_one = -1" (-1)
    (Int32.to_int Int32.minus_one);
  Alcotest.(check int) "Int32 min_int = -2147483648" (-2147483648)
    (Int32.to_int Int32.min_int);
  Alcotest.(check int) "Int32 max_int = 2147483647" 2147483647
    (Int32.to_int Int32.max_int);
  Alcotest.(check int) "Int32 min_value = -2147483648" (-2147483648)
    Int32.min_value;
  Alcotest.(check int) "Int32 max_value = 2147483647" 2147483647
    Int32.max_value

(** {2 Test Suite} *)

let () =
  Alcotest.run "Bounded Integer Types"
    [
      ( "UInt8",
        [
          Alcotest.test_case "min_value accepted" `Quick
            test_uint8_min_value_accepted;
          Alcotest.test_case "max_value accepted" `Quick
            test_uint8_max_value_accepted;
          Alcotest.test_case "below min rejected" `Quick
            test_uint8_below_min_rejected;
          Alcotest.test_case "above max rejected" `Quick
            test_uint8_above_max_rejected;
          Alcotest.test_case "negative rejected" `Quick
            test_uint8_negative_rejected;
          Alcotest.test_case "roundtrip" `Quick test_uint8_roundtrip;
          Alcotest.test_case "constants" `Quick test_uint8_constants;
        ] );
      ( "Int8",
        [
          Alcotest.test_case "min_value accepted" `Quick
            test_int8_min_value_accepted;
          Alcotest.test_case "max_value accepted" `Quick
            test_int8_max_value_accepted;
          Alcotest.test_case "below min rejected" `Quick
            test_int8_below_min_rejected;
          Alcotest.test_case "above max rejected" `Quick
            test_int8_above_max_rejected;
          Alcotest.test_case "roundtrip" `Quick test_int8_roundtrip;
          Alcotest.test_case "constants" `Quick test_int8_constants;
        ] );
      ( "UInt16",
        [
          Alcotest.test_case "min_value accepted" `Quick
            test_uint16_min_value_accepted;
          Alcotest.test_case "max_value accepted" `Quick
            test_uint16_max_value_accepted;
          Alcotest.test_case "below min rejected" `Quick
            test_uint16_below_min_rejected;
          Alcotest.test_case "above max rejected" `Quick
            test_uint16_above_max_rejected;
          Alcotest.test_case "negative rejected" `Quick
            test_uint16_negative_rejected;
          Alcotest.test_case "roundtrip" `Quick test_uint16_roundtrip;
          Alcotest.test_case "constants" `Quick test_uint16_constants;
        ] );
      ( "Int16",
        [
          Alcotest.test_case "min_value accepted" `Quick
            test_int16_min_value_accepted;
          Alcotest.test_case "max_value accepted" `Quick
            test_int16_max_value_accepted;
          Alcotest.test_case "below min rejected" `Quick
            test_int16_below_min_rejected;
          Alcotest.test_case "above max rejected" `Quick
            test_int16_above_max_rejected;
          Alcotest.test_case "roundtrip" `Quick test_int16_roundtrip;
          Alcotest.test_case "constants" `Quick test_int16_constants;
        ] );
      ( "UInt32",
        [
          Alcotest.test_case "min_value accepted" `Quick
            test_uint32_min_value_accepted;
          Alcotest.test_case "max_value accepted" `Quick
            test_uint32_max_value_accepted;
          Alcotest.test_case "below min rejected" `Quick
            test_uint32_below_min_rejected;
          Alcotest.test_case "above max rejected" `Quick
            test_uint32_above_max_rejected;
          Alcotest.test_case "negative rejected" `Quick
            test_uint32_negative_rejected;
          Alcotest.test_case "roundtrip" `Quick test_uint32_roundtrip;
          Alcotest.test_case "constants" `Quick test_uint32_constants;
        ] );
      ( "Int32",
        [
          Alcotest.test_case "min_value accepted" `Quick
            test_int32_min_value_accepted;
          Alcotest.test_case "max_value accepted" `Quick
            test_int32_max_value_accepted;
          Alcotest.test_case "below min rejected" `Quick
            test_int32_below_min_rejected;
          Alcotest.test_case "above max rejected" `Quick
            test_int32_above_max_rejected;
          Alcotest.test_case "roundtrip" `Quick test_int32_roundtrip;
          Alcotest.test_case "constants" `Quick test_int32_constants;
        ] );
    ]
