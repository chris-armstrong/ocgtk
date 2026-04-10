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

(* Convenience re-export of the individual bounded integer modules.
 * The canonical implementations live in uInt8.ml, int8.ml, uInt16.ml,
 * int16.ml, uInt32.ml and int32.ml; they are exposed as flat top-level
 * modules (UInt8, Int8, …) because ocgtk_common is (wrapped false).
 * This module lets callers write Bounded_int.UInt16 if they prefer
 * an explicit namespace. *)

module UInt8 = UInt8
module Int8 = Int8
module UInt16 = UInt16
module Int16 = Int16
module UInt32 = UInt32
module Int32 = Int32
