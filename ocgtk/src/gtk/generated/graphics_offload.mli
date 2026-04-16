(* GENERATED CODE - DO NOT EDIT *)
(* GraphicsOffload: GraphicsOffload *)

type t =
  [ `graphics_offload | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ :
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t
  option ->
  t = "ml_gtk_graphics_offload_new"
(** Create a new GraphicsOffload *)

(* Methods *)

external set_enabled : t -> Gtk_enums.graphicsoffloadenabled -> unit
  = "ml_gtk_graphics_offload_set_enabled"
(** Sets whether this GtkGraphicsOffload widget will attempt to offload the
    content of its child widget. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_graphics_offload_set_child"
(** Sets the child of @self. *)

external get_enabled : t -> Gtk_enums.graphicsoffloadenabled
  = "ml_gtk_graphics_offload_get_enabled"
(** Returns whether offload is enabled for @self. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
  .Widget
  .t
  option = "ml_gtk_graphics_offload_get_child"
(** Gets the child of @self. *)

(* Properties *)
