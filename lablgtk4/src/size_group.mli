(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SizeGroup *)

type t = Gtk.Widget.t

(** Create a new SizeGroup *)
external new_ : Gtk_enums.sizegroupmode -> t = "ml_gtk_size_group_new"

(* Properties *)

external set_mode : t -> Gtk_enums.sizegroupmode -> unit = "ml_gtk_size_group_set_mode"

external remove_widget : t -> Gtk.Widget.t -> unit = "ml_gtk_size_group_remove_widget"

external get_mode : t -> Gtk_enums.sizegroupmode = "ml_gtk_size_group_get_mode"

external add_widget : t -> Gtk.Widget.t -> unit = "ml_gtk_size_group_add_widget"

