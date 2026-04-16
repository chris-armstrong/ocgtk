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

(** Signed 8-bit integer ([gint8]).

    Backed by [private int] — no heap allocation. Range: [-128, 127]. *)

type t = private int

val of_int : int -> t
(** [of_int n] converts [n] to an [Int8.t].
    @raise Invalid_argument if [n < -128 || n > 127]. *)

val to_int : t -> int
(** [to_int v] returns the underlying integer value. *)

val min_int : t
(** The minimum value: [-128]. *)

val max_int : t
(** The maximum value: [127]. *)

val minus_one : t
(** The value [-1]. *)

val min_value : int
(** The minimum value representable as an [int], equal to [to_int min_int]. *)

val max_value : int
(** The maximum value representable as an [int], equal to [to_int max_int]. *)
