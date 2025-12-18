(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Paned *)

type t = [`paned | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new Paned *)
external new_ : Gtk_enums.orientation -> t = "ml_gtk_paned_new"

(* Properties *)

(** Get property: max-position *)
external get_max_position : t -> int = "ml_gtk_paned_get_max_position"

(** Get property: min-position *)
external get_min_position : t -> int = "ml_gtk_paned_get_min_position"

(** Get property: position *)
external get_position : t -> int = "ml_gtk_paned_get_position"

(** Set property: position *)
external set_position : t -> int -> unit = "ml_gtk_paned_set_position"

(** Get property: position-set *)
external get_position_set : t -> bool = "ml_gtk_paned_get_position_set"

(** Set property: position-set *)
external set_position_set : t -> bool -> unit = "ml_gtk_paned_set_position_set"

(** Get property: resize-end-child *)
external get_resize_end_child : t -> bool = "ml_gtk_paned_get_resize_end_child"

(** Set property: resize-end-child *)
external set_resize_end_child : t -> bool -> unit = "ml_gtk_paned_set_resize_end_child"

(** Get property: resize-start-child *)
external get_resize_start_child : t -> bool = "ml_gtk_paned_get_resize_start_child"

(** Set property: resize-start-child *)
external set_resize_start_child : t -> bool -> unit = "ml_gtk_paned_set_resize_start_child"

(** Get property: shrink-end-child *)
external get_shrink_end_child : t -> bool = "ml_gtk_paned_get_shrink_end_child"

(** Set property: shrink-end-child *)
external set_shrink_end_child : t -> bool -> unit = "ml_gtk_paned_set_shrink_end_child"

(** Get property: shrink-start-child *)
external get_shrink_start_child : t -> bool = "ml_gtk_paned_get_shrink_start_child"

(** Set property: shrink-start-child *)
external set_shrink_start_child : t -> bool -> unit = "ml_gtk_paned_set_shrink_start_child"

(** Get property: wide-handle *)
external get_wide_handle : t -> bool = "ml_gtk_paned_get_wide_handle"

(** Set property: wide-handle *)
external set_wide_handle : t -> bool -> unit = "ml_gtk_paned_set_wide_handle"

(** Sets the start child of @paned to @child.

If @child is `NULL`, the existing child will be removed. *)
external set_start_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_paned_set_start_child"

(** Sets the end child of @paned to @child.

If @child is `NULL`, the existing child will be removed. *)
external set_end_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_paned_set_end_child"

(** Retrieves the start child of the given `GtkPaned`. *)
external get_start_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_paned_get_start_child"

(** Retrieves the end child of the given `GtkPaned`. *)
external get_end_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_paned_get_end_child"

