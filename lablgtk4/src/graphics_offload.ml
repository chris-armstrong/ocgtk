(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GraphicsOffload *)

type t = [`graphics_offload | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new GraphicsOffload *)
external new_ : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> t = "ml_gtk_graphics_offload_new"

(* Properties *)

(** Sets whether this GtkGraphicsOffload widget will attempt
to offload the content of its child widget. *)
external set_enabled : t -> Gtk_enums.graphicsoffloadenabled -> unit = "ml_gtk_graphics_offload_set_enabled"

(** Sets the child of @self. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_graphics_offload_set_child"

(** Returns whether offload is enabled for @self. *)
external get_enabled : t -> Gtk_enums.graphicsoffloadenabled = "ml_gtk_graphics_offload_get_enabled"

(** Gets the child of @self. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_graphics_offload_get_child"

