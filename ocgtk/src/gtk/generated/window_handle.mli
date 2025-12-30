(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowHandle *)

type t = [`window_handle | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new WindowHandle *)
external new_ : unit -> t = "ml_gtk_window_handle_new"

(* Methods *)
(** Sets the child widget of @self. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_handle_set_child"

(** Gets the child widget of @self. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_handle_get_child"

(* Properties *)

