(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowHandle *)

type t = [`window_handle | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new WindowHandle *)
external new_ : unit -> t = "ml_gtk_window_handle_new"

(* Properties *)

(** Sets the child widget of @self. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_window_handle_set_child"

(** Gets the child widget of @self. *)
external get_child : t -> Gtk.widget option = "ml_gtk_window_handle_get_child"

