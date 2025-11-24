(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Viewport *)

type t = Gtk.widget

(** Create a new Viewport *)
external new_ : Gtk.widget option -> Gtk.widget option -> t = "ml_gtk_viewport_new"

(* Properties *)

(** Get property: scroll-to-focus *)
external get_scroll_to_focus : t -> bool = "ml_gtk_viewport_get_scroll_to_focus"

(** Set property: scroll-to-focus *)
external set_scroll_to_focus : t -> bool -> unit = "ml_gtk_viewport_set_scroll_to_focus"

external set_child : t -> Gtk.widget option -> unit = "ml_gtk_viewport_set_child"

external scroll_to : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_viewport_scroll_to"

external get_child : t -> Gtk.widget = "ml_gtk_viewport_get_child"

