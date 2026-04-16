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

(** Unsigned 32-bit integer ([guint32]).

    Backed by [private int] — no heap allocation. Range: [0, 4294967295].

    Requires a 64-bit OCaml runtime. ocgtk does not support 32-bit targets. *)

type t = private int

val of_int : int -> t
(** [of_int n] converts [n] to a [UInt32.t].
    @raise Invalid_argument if [n < 0 || n > 4294967295]. *)

val to_int : t -> int
(** [to_int v] returns the underlying integer value. *)

val min_int : t
(** The minimum value: [0]. *)

val max_int : t
(** The maximum value: [4294967295]. *)

val zero : t
(** Alias for [min_int]: [0]. *)

val min_value : int
(** The minimum value representable as an [int], equal to [to_int min_int]. *)

val max_value : int
(** The maximum value representable as an [int], equal to [to_int max_int]. *)
