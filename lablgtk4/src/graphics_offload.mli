(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GraphicsOffload *)

type t = [`graphics_offload | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new GraphicsOffload *)
external new_ : Gtk.widget option -> t = "ml_gtk_graphics_offload_new"

(* Properties *)

(** Sets whether this GtkGraphicsOffload widget will attempt
to offload the content of its child widget. *)
external set_enabled : t -> Gtk_enums.graphicsoffloadenabled -> unit = "ml_gtk_graphics_offload_set_enabled"

(** Sets the child of @self. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_graphics_offload_set_child"

(** Returns whether offload is enabled for @self. *)
external get_enabled : t -> Gtk_enums.graphicsoffloadenabled = "ml_gtk_graphics_offload_get_enabled"

(** Gets the child of @self. *)
external get_child : t -> Gtk.widget option = "ml_gtk_graphics_offload_get_child"

