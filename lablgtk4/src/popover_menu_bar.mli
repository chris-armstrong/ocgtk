(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PopoverMenuBar *)

type t = Gtk.Widget.t

(** Create a new PopoverMenuBar *)
external new_from_model : unit -> t = "ml_gtk_popover_menu_bar_new_from_model"

(* Properties *)

external set_menu_model : t -> unit -> unit = "ml_gtk_popover_menu_bar_set_menu_model"

external remove_child : t -> Gtk.Widget.t -> bool = "ml_gtk_popover_menu_bar_remove_child"

external add_child : t -> Gtk.Widget.t -> string -> bool = "ml_gtk_popover_menu_bar_add_child"

