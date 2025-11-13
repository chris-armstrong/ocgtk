(**************************************************************************)
(*                LablGTK4 - OCaml bindings for GTK4                      *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(* Minimal Gobject module for enum conversions *)

module Data = struct
  (* enum: creates encoder/decoder pair for simple enumerations *)
  let enum tbl =
    (Gpointer.decode_variant tbl, Gpointer.encode_variant tbl)

  (* flags: creates encoder/decoder pair for flag-type enumerations
     Flags can be combined with bitwise OR, so we need to handle lists *)
  let flags tbl =
    let decode flags =
      (* For now, just decode as a single value - full flag support would
         require decoding each bit and returning a list *)
      Gpointer.decode_variant tbl flags
    in
    let encode flag =
      (* For now, just encode as a single value - full flag support would
         require encoding a list and combining with bitwise OR *)
      Gpointer.encode_variant tbl flag
    in
    (decode, encode)
end
