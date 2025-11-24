(* GENERATED CODE - DO NOT EDIT *)
(* Widget: GraphicsOffload *)

type t = Gtk.Widget.t

(** Create a new GraphicsOffload *)
external new_ : Gtk.Widget.t option -> t = "ml_gtk_graphics_offload_new"

(* Properties *)

external set_enabled : t -> Gtk_enums.graphicsoffloadenabled -> unit = "ml_gtk_graphics_offload_set_enabled"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_graphics_offload_set_child"

external get_enabled : t -> Gtk_enums.graphicsoffloadenabled = "ml_gtk_graphics_offload_get_enabled"

external get_child : t -> Gtk.Widget.t = "ml_gtk_graphics_offload_get_child"

