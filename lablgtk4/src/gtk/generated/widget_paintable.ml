(* GENERATED CODE - DO NOT EDIT *)
(* WidgetPaintable: WidgetPaintable *)

type t = [`widget_paintable | `object_] Gobject.obj

(** Create a new WidgetPaintable *)
external new_ : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> t = "ml_gtk_widget_paintable_new"

(* Properties *)

(** Sets the widget that should be observed. *)
external set_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_widget_paintable_set_widget"

(** Returns the widget that is observed or %NULL if none. *)
external get_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_widget_paintable_get_widget"

