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

(** Convenience namespace re-exporting all bounded integer modules.

    The individual modules ([UInt8], [Int8], [UInt16], [Int16], [UInt32],
    [Int32]) are also available as direct top-level modules within the
    [ocgtk.common] library.  This module lets callers write
    [Bounded_int.UInt16] when an explicit namespace is preferred. *)

module UInt8 = UInt8
module Int8 = Int8
module UInt16 = UInt16
module Int16 = Int16
module UInt32 = UInt32
module Int32 = Int32
