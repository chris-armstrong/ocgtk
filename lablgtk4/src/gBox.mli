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

(** High-level GtkBox wrapper for GTK4 *)

(** {1 GtkBox Container} *)

(** Base box skeleton with basic container operations *)
class box_skel : Box.t ->
  object
    inherit GObj.widget_impl

    (** Append a child widget at the end *)
    method append : GObj.widget -> unit

    (** Prepend a child widget at the start *)
    method prepend : GObj.widget -> unit

    (** Insert child after sibling (None = at start) *)
    method insert_child_after : child:GObj.widget -> sibling:GObj.widget option -> unit

    (** Remove a child widget *)
    method remove : GObj.widget -> unit

    (** Reorder child after sibling (None = move to start) *)
    method reorder_child_after : child:GObj.widget -> sibling:GObj.widget option -> unit

    (** Get spacing between children *)
    method spacing : int

    (** Set spacing between children *)
    method set_spacing : int -> unit

    (** Get homogeneous sizing mode *)
    method homogeneous : bool

    (** Set homogeneous sizing mode *)
    method set_homogeneous : bool -> unit

    (** Get baseline position *)
    method baseline_position : Gtk.baseline_position

    (** Set baseline position *)
    method set_baseline_position : Gtk.baseline_position -> unit
  end

(** Box widget with full functionality *)
class box : Box.t ->
  object
    inherit box_skel
  end

(** Create a horizontal box
    @param spacing spacing between children in pixels (default: 0)
    @param homogeneous whether all children should have the same size (default: false) *)
val hbox : ?spacing:int -> ?homogeneous:bool -> unit -> box

(** Create a vertical box
    @param spacing spacing between children in pixels (default: 0)
    @param homogeneous whether all children should have the same size (default: false) *)
val vbox : ?spacing:int -> ?homogeneous:bool -> unit -> box

(** {2 Migration Helpers} *)

(** Box with GTK3-compatible pack methods for easier migration.
    Note: These methods internally set widget properties (hexpand, halign, margins)
    which is different from GTK3's packing parameters. *)
class box_pack : Box.t ->
  object
    inherit box

    (** Pack a widget with GTK3-style parameters.
        In GTK4, expand and fill are widget properties, not packing parameters.
        @param expand sets hexpand and vexpand properties (default: true)
        @param fill sets halign and valign to FILL (default: true)
        @param padding sets margin_start and margin_end (default: 0) *)
    method pack : ?expand:bool -> ?fill:bool -> ?padding:int -> GObj.widget -> unit

    (** Alias for pack (for GTK3 compatibility) *)
    method pack_start : ?expand:bool -> ?fill:bool -> ?padding:int -> GObj.widget -> unit

    (** Pack at end (appends then reorders to end)
        @param expand sets hexpand and vexpand properties (default: true)
        @param fill sets halign and valign to FILL (default: true)
        @param padding sets margin_start and margin_end (default: 0) *)
    method pack_end : ?expand:bool -> ?fill:bool -> ?padding:int -> GObj.widget -> unit
  end

(** Create a horizontal box with GTK3-compatible pack methods *)
val hbox_pack : ?spacing:int -> ?homogeneous:bool -> unit -> box_pack

(** Create a vertical box with GTK3-compatible pack methods *)
val vbox_pack : ?spacing:int -> ?homogeneous:bool -> unit -> box_pack
