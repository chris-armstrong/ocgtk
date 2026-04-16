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

(** Unsigned 64-bit integer type for GLib [guint64] values. This is an alias for
    [Unsigned.UInt64] from the [integers] library, exposed under the consistent
    [UInt64] name used by ocgtk's bounded integer module family. *)

include module type of Unsigned.UInt64
