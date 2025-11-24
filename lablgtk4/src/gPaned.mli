(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** High-level GtkPaned wrapper for GTK4 *)

(** {1 GtkPaned Container} *)

(** Base paned skeleton with two-child operations *)
class paned_skel : Paned.t ->
  object
    inherit GObj.widget_impl

    (** Set the start child widget *)
    method set_start_child : GObj.widget option -> unit

    (** Get the start child widget *)
    method start_child : GObj.widget option

    (** Set the end child widget *)
    method set_end_child : GObj.widget option -> unit

    (** Get the end child widget *)
    method end_child : GObj.widget option

    (** Get position of divider *)
    method position : int

    (** Set position of divider *)
    method set_position : int -> unit

    (** Get wide handle mode *)
    method wide_handle : bool

    (** Set wide handle mode *)
    method set_wide_handle : bool -> unit

    (** Get whether start child can resize *)
    method resize_start_child : bool

    (** Set whether start child can resize *)
    method set_resize_start_child : bool -> unit

    (** Get whether end child can resize *)
    method resize_end_child : bool

    (** Set whether end child can resize *)
    method set_resize_end_child : bool -> unit

    (** Get whether start child can shrink *)
    method shrink_start_child : bool

    (** Set whether start child can shrink *)
    method set_shrink_start_child : bool -> unit

    (** Get whether end child can shrink *)
    method shrink_end_child : bool

    (** Set whether end child can shrink *)
    method set_shrink_end_child : bool -> unit

    (** Add child to start pane (convenience wrapper) *)
    method add1 : GObj.widget -> unit

    (** Add child to end pane (convenience wrapper) *)
    method add2 : GObj.widget -> unit
  end

(** Paned widget with full functionality *)
class paned : Paned.t ->
  object
    inherit paned_skel
  end

(** Create a horizontal paned container *)
val hpaned : unit -> paned

(** Create a vertical paned container *)
val vpaned : unit -> paned
