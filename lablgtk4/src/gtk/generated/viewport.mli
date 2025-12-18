(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Viewport *)

type t = [`viewport | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Viewport *)
external new_ : Adjustment.t option -> Adjustment.t option -> t = "ml_gtk_viewport_new"

(* Properties *)

(** Sets whether the viewport should automatically scroll
to keep the focused child in view. *)
external set_scroll_to_focus : t -> bool -> unit = "ml_gtk_viewport_set_scroll_to_focus"

(** Sets the child widget of @viewport. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_viewport_set_child"

(** Scrolls a descendant of the viewport into view.

The viewport and the descendant must be visible and mapped for
this function to work, otherwise no scrolling will be performed. *)
external scroll_to : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t -> Scroll_info.t option -> unit = "ml_gtk_viewport_scroll_to"

(** Gets whether the viewport is scrolling to keep the focused
child in view. *)
external get_scroll_to_focus : t -> bool = "ml_gtk_viewport_get_scroll_to_focus"

(** Gets the child widget of @viewport. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_viewport_get_child"

