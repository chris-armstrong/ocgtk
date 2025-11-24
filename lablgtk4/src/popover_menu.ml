(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PopoverMenu *)

type t = Gtk.widget

external new_from_model : unit -> t = "ml_gtk_popover_menu_new_from_model"

external new_from_model_full : unit -> Gtk_enums.popovermenuflags -> t = "ml_gtk_popover_menu_new_from_model_full"

(* Properties *)

external get_visible_submenu : t -> string = "ml_gtk_popover_menu_get_visible_submenu"

external set_visible_submenu : t -> string -> unit = "ml_gtk_popover_menu_set_visible_submenu"

external set_flags : t -> Gtk_enums.popovermenuflags -> unit = "ml_gtk_popover_menu_set_flags"

external remove_child : t -> Gtk.widget -> bool = "ml_gtk_popover_menu_remove_child"

external get_flags : t -> Gtk_enums.popovermenuflags = "ml_gtk_popover_menu_get_flags"

external add_child : t -> Gtk.widget -> string -> bool = "ml_gtk_popover_menu_add_child"

