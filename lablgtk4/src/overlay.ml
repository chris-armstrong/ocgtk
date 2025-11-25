(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Overlay *)

type t = [`overlay | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new Overlay *)
external new_ : unit -> t = "ml_gtk_overlay_new"

(* Properties *)

(** Sets whether @widget is included in the measured size of @overlay.

The overlay will request the size of the largest child that has
this property set to %TRUE. Children who are not included may
be drawn outside of @overlay's allocation if they are too large. *)
external set_measure_overlay : t -> Gtk.widget -> bool -> unit = "ml_gtk_overlay_set_measure_overlay"

(** Sets whether @widget should be clipped within the parent. *)
external set_clip_overlay : t -> Gtk.widget -> bool -> unit = "ml_gtk_overlay_set_clip_overlay"

(** Sets the child widget of @overlay. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_overlay_set_child"

(** Removes an overlay that was added with gtk_overlay_add_overlay(). *)
external remove_overlay : t -> Gtk.widget -> unit = "ml_gtk_overlay_remove_overlay"

(** Gets whether @widget's size is included in the measurement of
@overlay. *)
external get_measure_overlay : t -> Gtk.widget -> bool = "ml_gtk_overlay_get_measure_overlay"

(** Gets whether @widget should be clipped within the parent. *)
external get_clip_overlay : t -> Gtk.widget -> bool = "ml_gtk_overlay_get_clip_overlay"

(** Gets the child widget of @overlay. *)
external get_child : t -> Gtk.widget option = "ml_gtk_overlay_get_child"

(** Adds @widget to @overlay.

The widget will be stacked on top of the main widget
added with [method@Gtk.Overlay.set_child].

The position at which @widget is placed is determined
from its [property@Gtk.Widget:halign] and
[property@Gtk.Widget:valign] properties. *)
external add_overlay : t -> Gtk.widget -> unit = "ml_gtk_overlay_add_overlay"

