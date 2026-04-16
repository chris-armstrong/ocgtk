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

(** A non-negative integer representing a GLib [gsize] (equivalent to C
    [size_t]). Values are guaranteed to be non-negative; use {!of_int} to
    construct. *)

type t = private int

val of_int : int -> t
(** [of_int n] is [n] as a [gsize].
    @raise Invalid_argument if [n < 0]. *)

val to_int : t -> int
(** [to_int v] returns the underlying integer value. *)

val zero : t
(** The value [0]. *)

val max_int : t
(** The maximum value: [Stdlib.max_int]. *)

val min_value : int
(** The minimum value representable as an [int]: [0]. *)

val max_value : int
(** The maximum value representable as an [int]: [Stdlib.max_int]. *)
