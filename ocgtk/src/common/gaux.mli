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

(** Option-handling utility functions. *)

val may : f:('a -> 'b) -> 'a option -> unit
(** [may ~f x] applies [f] to the value contained in [x] when [x] is
    [Some _]; does nothing when [x] is [None]. *)

val may_map : f:('a -> 'b) -> 'a option -> 'b option
(** [may_map ~f x] is [Some (f v)] when [x = Some v]; [None] when [x] is
    [None]. *)

val default : 'a -> opt:'a option -> 'a
(** [default x ~opt] is [y] when [opt = Some y]; [x] when [opt = None]. *)

val may_default : ('a -> 'b) -> 'a -> opt:'b option -> 'b
(** [may_default f x ~opt] is [y] when [opt = Some y]; [f x] when
    [opt = None]. *)