(* GENERATED CODE - DO NOT EDIT *)
(* ColumnViewCell: ColumnViewCell *)

type t = [`column_view_cell | `list_item | `object_] Gobject.obj

(* Properties *)

(** Get property: focusable *)
external get_focusable : t -> bool = "ml_gtk_column_view_cell_get_focusable"

(** Set property: focusable *)
external set_focusable : t -> bool -> unit = "ml_gtk_column_view_cell_set_focusable"

(** Get property: position *)
external get_position : t -> int = "ml_gtk_column_view_cell_get_position"

(** Get property: selected *)
external get_selected : t -> bool = "ml_gtk_column_view_cell_get_selected"

(** Sets the child to be used for this listitem.

This function is typically called by applications when
setting up a listitem so that the widget can be reused when
binding it multiple times. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_column_view_cell_set_child"

(** Gets the child previously set via gtk_column_view_cell_set_child() or
%NULL if none was set. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_column_view_cell_get_child"

