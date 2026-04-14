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

(** Unsigned 16-bit integer ([guint16]).

    Backed by [private int] — no heap allocation.
    Range: [0, 65535]. *)

type t = private int

val of_int : int -> t
(** [of_int n] converts [n] to a [UInt16.t].
    @raise Invalid_argument if [n < 0 || n > 65535]. *)

val to_int : t -> int
(** [to_int v] returns the underlying integer value. *)

val min_int : t
(** The minimum value: [0]. *)

val max_int : t
(** The maximum value: [65535]. *)

val zero : t
(** Alias for [min_int]: [0]. *)

val min_value : int
(** The minimum value representable as an [int], equal to [to_int min_int]. *)

val max_value : int
(** The maximum value representable as an [int], equal to [to_int max_int]. *)
