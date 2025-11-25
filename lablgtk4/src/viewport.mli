(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Viewport *)

type t = [`viewport | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Viewport *)
external new_ : Gtk.widget option -> Gtk.widget option -> t = "ml_gtk_viewport_new"

(* Properties *)

(** Sets whether the viewport should automatically scroll
to keep the focused child in view. *)
external set_scroll_to_focus : t -> bool -> unit = "ml_gtk_viewport_set_scroll_to_focus"

(** Sets the child widget of @viewport. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_viewport_set_child"

(** Scrolls a descendant of the viewport into view.

The viewport and the descendant must be visible and mapped for
this function to work, otherwise no scrolling will be performed. *)
external scroll_to : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_viewport_scroll_to"

(** Gets whether the viewport is scrolling to keep the focused
child in view. *)
external get_scroll_to_focus : t -> bool = "ml_gtk_viewport_get_scroll_to_focus"

(** Gets the child widget of @viewport. *)
external get_child : t -> Gtk.widget option = "ml_gtk_viewport_get_child"

