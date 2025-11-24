(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ActionBar *)

type t = Gtk.widget

(** Create a new ActionBar *)
external new_ : unit -> t = "ml_gtk_action_bar_new"

(* Properties *)

(** Get property: revealed *)
external get_revealed : t -> bool = "ml_gtk_action_bar_get_revealed"

(** Set property: revealed *)
external set_revealed : t -> bool -> unit = "ml_gtk_action_bar_set_revealed"

external set_center_widget : t -> Gtk.widget option -> unit = "ml_gtk_action_bar_set_center_widget"

external remove : t -> Gtk.widget -> unit = "ml_gtk_action_bar_remove"

external pack_start : t -> Gtk.widget -> unit = "ml_gtk_action_bar_pack_start"

external pack_end : t -> Gtk.widget -> unit = "ml_gtk_action_bar_pack_end"

external get_center_widget : t -> Gtk.widget = "ml_gtk_action_bar_get_center_widget"

