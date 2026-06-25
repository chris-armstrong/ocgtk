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

(* Unsigned 64-bit integer backed by OCaml int64.
 * Values > Int64.max_int are stored as negative int64 bit patterns.
 * All arithmetic is modular (wrapping), matching C uint64_t semantics. *)

type t = int64

let zero = 0L
let one = 1L
let max_int = -1L  (* 0xFFFFFFFFFFFFFFFF *)

let of_int = Int64.of_int
let to_int = Int64.to_int

let add = Int64.add
let sub = Int64.sub
let mul = Int64.mul

let to_string x = Printf.sprintf "%Lu" x

let digit_of_char base c =
  let d =
    if c >= '0' && c <= '9' then Char.code c - Char.code '0'
    else if c >= 'a' && c <= 'f' then Char.code c - Char.code 'a' + 10
    else if c >= 'A' && c <= 'F' then Char.code c - Char.code 'A' + 10
    else -1
  in
  if d >= 0 && d < base then d else -1

let of_string s =
  let n = String.length s in
  if n = 0 then invalid_arg "UInt64.of_string";
  let start, base =
    if n >= 2 && s.[0] = '0' then
      match s.[1] with
      | 'x' | 'X' -> (2, 16)
      | 'o' | 'O' -> (2, 8)
      | 'b' | 'B' -> (2, 2)
      | _ -> (0, 10)
    else (0, 10)
  in
  let base64 = Int64.of_int base in
  let result = ref 0L in
  for i = start to n - 1 do
    let d = digit_of_char base s.[i] in
    if d < 0 then invalid_arg ("UInt64.of_string: " ^ s);
    result := Int64.add (Int64.mul !result base64) (Int64.of_int d)
  done;
  !result
