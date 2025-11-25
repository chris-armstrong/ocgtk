(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PopoverMenuBar *)

type t = [`popover_menu_bar | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new PopoverMenuBar *)
external new_from_model : unit -> t = "ml_gtk_popover_menu_bar_new_from_model"

(* Properties *)

(** Removes a widget that has previously been added with
gtk_popover_menu_bar_add_child(). *)
external remove_child : t -> Gtk.widget -> bool = "ml_gtk_popover_menu_bar_remove_child"

(** Adds a custom widget to a generated menubar.

For this to work, the menu model of @bar must have an
item with a `custom` attribute that matches @id. *)
external add_child : t -> Gtk.widget -> string -> bool = "ml_gtk_popover_menu_bar_add_child"

