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

(** High-level GtkGrid wrapper for GTK4 *)

(** {1 GtkGrid Container} *)

(** Base grid skeleton with basic container operations *)
class grid_skel : Gtk.Grid.t ->
  object
    inherit GObj.widget_impl

    (** Attach child at position *)
    method attach : left:int -> top:int -> width:int -> height:int -> GObj.widget -> unit

    (** Attach child next to sibling *)
    method attach_next_to : child:GObj.widget -> sibling:GObj.widget option -> side:Gtk.position_type -> width:int -> height:int -> unit

    (** Remove a child widget *)
    method remove : GObj.widget -> unit

    (** Get child at position *)
    method get_child_at : column:int -> row:int -> GObj.widget option

    (** Insert row at position *)
    method insert_row : int -> unit

    (** Insert column at position *)
    method insert_column : int -> unit

    (** Insert next to sibling *)
    method insert_next_to : sibling:GObj.widget -> side:Gtk.position_type -> unit

    (** Remove row at position *)
    method remove_row : int -> unit

    (** Remove column at position *)
    method remove_column : int -> unit

    (** Get row spacing *)
    method row_spacing : int

    (** Set row spacing *)
    method set_row_spacing : int -> unit

    (** Get column spacing *)
    method column_spacing : int

    (** Set column spacing *)
    method set_column_spacing : int -> unit

    (** Get row homogeneous mode *)
    method row_homogeneous : bool

    (** Set row homogeneous mode *)
    method set_row_homogeneous : bool -> unit

    (** Get column homogeneous mode *)
    method column_homogeneous : bool

    (** Set column homogeneous mode *)
    method set_column_homogeneous : bool -> unit

    (** Get baseline row *)
    method baseline_row : int

    (** Set baseline row *)
    method set_baseline_row : int -> unit
  end

(** Grid widget with full functionality *)
class grid : Gtk.Grid.t ->
  object
    inherit grid_skel
  end

(** Create a new grid
    @param row_spacing spacing between rows in pixels (default: 0)
    @param column_spacing spacing between columns in pixels (default: 0)
    @param row_homogeneous whether all rows should have the same height (default: false)
    @param column_homogeneous whether all columns should have the same width (default: false) *)
val create : ?row_spacing:int -> ?column_spacing:int -> ?row_homogeneous:bool -> ?column_homogeneous:bool -> unit -> grid
