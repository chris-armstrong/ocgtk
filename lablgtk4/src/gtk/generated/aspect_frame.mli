(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AspectFrame *)

type t = [`aspect_frame | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new AspectFrame *)
external new_ : float -> float -> float -> bool -> t = "ml_gtk_aspect_frame_new"

(* Properties *)

(** Get property: obey-child *)
external get_obey_child : t -> bool = "ml_gtk_aspect_frame_get_obey_child"

(** Set property: obey-child *)
external set_obey_child : t -> bool -> unit = "ml_gtk_aspect_frame_set_obey_child"

(** Get property: ratio *)
external get_ratio : t -> float = "ml_gtk_aspect_frame_get_ratio"

(** Set property: ratio *)
external set_ratio : t -> float -> unit = "ml_gtk_aspect_frame_set_ratio"

(** Get property: xalign *)
external get_xalign : t -> float = "ml_gtk_aspect_frame_get_xalign"

(** Set property: xalign *)
external set_xalign : t -> float -> unit = "ml_gtk_aspect_frame_set_xalign"

(** Get property: yalign *)
external get_yalign : t -> float = "ml_gtk_aspect_frame_get_yalign"

(** Set property: yalign *)
external set_yalign : t -> float -> unit = "ml_gtk_aspect_frame_set_yalign"

(** Sets the child widget of @self. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_aspect_frame_set_child"

(** Gets the child widget of @self. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_aspect_frame_get_child"

