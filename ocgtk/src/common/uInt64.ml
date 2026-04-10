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

(* Thin alias over Unsigned.UInt64 from the integers library.
 * Exposed as a flat top-level module (UInt64) for consistency with the
 * other bounded integer modules (UInt8, UInt16, UInt32, Int16, Int32, …).
 * The underlying representation is a custom OCaml block — unlike the
 * smaller types, 64-bit unsigned values cannot fit in a 63-bit OCaml int. *)

include Unsigned.UInt64
