(* GENERATED CODE - DO NOT EDIT *)
(* Widget: AspectFrame *)

type t = [`aspect_frame | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new AspectFrame *)
external new_ : float -> float -> float -> bool -> t = "ml_gtk_aspect_frame_new"

(* Properties *)

(** Sets the vertical alignment of the child within the allocation
of the `GtkAspectFrame`. *)
external set_yalign : t -> float -> unit = "ml_gtk_aspect_frame_set_yalign"

(** Sets the horizontal alignment of the child within the allocation
of the `GtkAspectFrame`. *)
external set_xalign : t -> float -> unit = "ml_gtk_aspect_frame_set_xalign"

(** Sets the desired aspect ratio of the child. *)
external set_ratio : t -> float -> unit = "ml_gtk_aspect_frame_set_ratio"

(** Sets whether the aspect ratio of the child's size
request should override the set aspect ratio of
the `GtkAspectFrame`. *)
external set_obey_child : t -> bool -> unit = "ml_gtk_aspect_frame_set_obey_child"

(** Sets the child widget of @self. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_aspect_frame_set_child"

(** Returns the vertical alignment of the child within the
allocation of the `GtkAspectFrame`. *)
external get_yalign : t -> float = "ml_gtk_aspect_frame_get_yalign"

(** Returns the horizontal alignment of the child within the
allocation of the `GtkAspectFrame`. *)
external get_xalign : t -> float = "ml_gtk_aspect_frame_get_xalign"

(** Returns the desired aspect ratio of the child. *)
external get_ratio : t -> float = "ml_gtk_aspect_frame_get_ratio"

(** Returns whether the child's size request should override
the set aspect ratio of the `GtkAspectFrame`. *)
external get_obey_child : t -> bool = "ml_gtk_aspect_frame_get_obey_child"

(** Gets the child widget of @self. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_aspect_frame_get_child"

