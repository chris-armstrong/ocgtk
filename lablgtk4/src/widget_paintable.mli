(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WidgetPaintable *)

type t = Gtk.widget

(** Create a new WidgetPaintable *)
external new_ : Gtk.widget option -> t = "ml_gtk_widget_paintable_new"

(* Properties *)

(** Sets the widget that should be observed. *)
external set_widget : t -> Gtk.widget option -> unit = "ml_gtk_widget_paintable_set_widget"

(** Returns the widget that is observed or %NULL if none. *)
external get_widget : t -> Gtk.widget option = "ml_gtk_widget_paintable_get_widget"

