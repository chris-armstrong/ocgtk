(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowGroup *)

type t = Gtk.Widget.t

(** Create a new WindowGroup *)
external new_ : unit -> t = "ml_gtk_window_group_new"

external remove_window : t -> Gtk.Widget.t -> unit = "ml_gtk_window_group_remove_window"

external add_window : t -> Gtk.Widget.t -> unit = "ml_gtk_window_group_add_window"

