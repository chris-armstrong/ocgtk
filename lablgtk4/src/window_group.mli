(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowGroup *)

type t = Gtk.widget

(** Create a new WindowGroup *)
external new_ : unit -> t = "ml_gtk_window_group_new"

(** Removes a window from a `GtkWindowGroup`. *)
external remove_window : t -> Gtk.widget -> unit = "ml_gtk_window_group_remove_window"

(** Adds a window to a `GtkWindowGroup`. *)
external add_window : t -> Gtk.widget -> unit = "ml_gtk_window_group_add_window"

