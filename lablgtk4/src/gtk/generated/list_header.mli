(* GENERATED CODE - DO NOT EDIT *)
(* ListHeader: ListHeader *)

type t = [`list_header | `object_] Gobject.obj

(* Properties *)

(** Get property: end *)
external get_end : t -> int = "ml_gtk_list_header_get_end"

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_list_header_get_n_items"

(** Get property: start *)
external get_start : t -> int = "ml_gtk_list_header_get_start"

(** Sets the child to be used for this listitem.

This function is typically called by applications when
setting up a header so that the widget can be reused when
binding it multiple times. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_list_header_set_child"

(** Gets the child previously set via gtk_list_header_set_child() or
%NULL if none was set. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_list_header_get_child"

