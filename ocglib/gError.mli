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

type t
(** GError type representing errors from GTK/GLib functions.

    GError values are constructed by the C FFI layer and used exclusively as the
    error component of [(_, GError.t) result] return types. *)

external message : t -> string = "ml_gerror_message"
external code : t -> int = "ml_gerror_code"
external domain : t -> int = "ml_gerror_domain"
