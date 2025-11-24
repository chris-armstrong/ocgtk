(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Viewport *)

type t = Gtk.Widget.t

external new_ : Gtk.Widget.t option -> Gtk.Widget.t option -> t = "ml_gtk_viewport_new"

(* Properties *)

external get_scroll_to_focus : t -> bool = "ml_gtk_viewport_get_scroll_to_focus"

external set_scroll_to_focus : t -> bool -> unit = "ml_gtk_viewport_set_scroll_to_focus"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_viewport_set_child"

external scroll_to : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_viewport_scroll_to"

external get_child : t -> Gtk.Widget.t = "ml_gtk_viewport_get_child"

