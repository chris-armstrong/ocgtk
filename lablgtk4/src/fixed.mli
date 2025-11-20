(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Fixed *)

type t = Gtk.Widget.t

(** Create a new Fixed *)
external new_ : unit -> t = "ml_gtk_fixed_new"

external set_child_transform : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_fixed_set_child_transform"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_fixed_remove"

external put : t -> Gtk.Widget.t -> float -> float -> unit = "ml_gtk_fixed_put"

external move : t -> Gtk.Widget.t -> float -> float -> unit = "ml_gtk_fixed_move"

external get_child_transform : t -> Gtk.Widget.t -> unit = "ml_gtk_fixed_get_child_transform"

external get_child_position : t -> Gtk.Widget.t -> float -> float -> unit = "ml_gtk_fixed_get_child_position"

