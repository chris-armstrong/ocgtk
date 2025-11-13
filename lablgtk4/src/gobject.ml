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
  (* For now, we just need the enum converter for testing *)
  let enum tbl =
    (Gpointer.decode_variant tbl, Gpointer.encode_variant tbl)
end
