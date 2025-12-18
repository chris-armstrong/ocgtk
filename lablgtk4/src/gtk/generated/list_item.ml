(* GENERATED CODE - DO NOT EDIT *)
(* ListItem: ListItem *)

type t = [`list_item | `object_] Gobject.obj

(* Properties *)

(** Get property: accessible-description *)
external get_accessible_description : t -> string = "ml_gtk_list_item_get_accessible_description"

(** Set property: accessible-description *)
external set_accessible_description : t -> string -> unit = "ml_gtk_list_item_set_accessible_description"

(** Get property: accessible-label *)
external get_accessible_label : t -> string = "ml_gtk_list_item_get_accessible_label"

(** Set property: accessible-label *)
external set_accessible_label : t -> string -> unit = "ml_gtk_list_item_set_accessible_label"

(** Get property: activatable *)
external get_activatable : t -> bool = "ml_gtk_list_item_get_activatable"

(** Set property: activatable *)
external set_activatable : t -> bool -> unit = "ml_gtk_list_item_set_activatable"

(** Get property: focusable *)
external get_focusable : t -> bool = "ml_gtk_list_item_get_focusable"

(** Set property: focusable *)
external set_focusable : t -> bool -> unit = "ml_gtk_list_item_set_focusable"

(** Get property: position *)
external get_position : t -> int = "ml_gtk_list_item_get_position"

(** Get property: selectable *)
external get_selectable : t -> bool = "ml_gtk_list_item_get_selectable"

(** Set property: selectable *)
external set_selectable : t -> bool -> unit = "ml_gtk_list_item_set_selectable"

(** Get property: selected *)
external get_selected : t -> bool = "ml_gtk_list_item_get_selected"

(** Sets the child to be used for this listitem.

This function is typically called by applications when
setting up a listitem so that the widget can be reused when
binding it multiple times. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_list_item_set_child"

(** Gets the child previously set via gtk_list_item_set_child() or
%NULL if none was set. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_list_item_get_child"

