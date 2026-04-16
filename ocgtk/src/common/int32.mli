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

(** Signed 32-bit integer ([gint32]).

    Backed by [private int] — no heap allocation.
    Range: [-2147483648, 2147483647].

    This module intentionally shadows [Stdlib.Int32]. Use [Stdlib.Int32]
    when you need OCaml's boxed [int32] type. *)

type t = private int

val of_int : int -> t
(** [of_int n] converts [n] to an [Int32.t].
    @raise Invalid_argument if [n < -2147483648 || n > 2147483647]. *)

val to_int : t -> int
(** [to_int v] returns the underlying integer value. *)

val min_int : t
(** The minimum value: [-2147483648]. *)

val max_int : t
(** The maximum value: [2147483647]. *)

val minus_one : t
(** The value [-1]. *)

val min_value : int
(** The minimum value representable as an [int], equal to [to_int min_int]. *)

val max_value : int
(** The maximum value representable as an [int], equal to [to_int max_int]. *)
