(* GENERATED CODE - DO NOT EDIT *)
(* DragIcon: DragIcon *)

type t = [`drag_icon | `widget | `initially_unowned] Gobject.obj

(* Methods *)
(** Sets the widget to display as the drag icon. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_drag_icon_set_child"

(** Gets the widget currently used as drag icon. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_drag_icon_get_child"

(* Properties *)

