(* GENERATED CODE - DO NOT EDIT *)
(* Widget: PopoverMenu *)

type t = [`popover_menu | `popover | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new PopoverMenu *)
external new_from_model : unit -> t = "ml_gtk_popover_menu_new_from_model"

(** Create a new PopoverMenu *)
external new_from_model_full : unit -> Gtk_enums.popovermenuflags -> t = "ml_gtk_popover_menu_new_from_model_full"

(* Properties *)

(** Sets the flags that @popover uses to create/display a menu from its model.

If a model is set and the flags change, contents are rebuilt, so if setting
properties individually, set flags before model to avoid a redundant rebuild. *)
external set_flags : t -> Gtk_enums.popovermenuflags -> unit = "ml_gtk_popover_menu_set_flags"

(** Removes a widget that has previously been added with
[method@Gtk.PopoverMenu.add_child()] *)
external remove_child : t -> Gtk.widget -> bool = "ml_gtk_popover_menu_remove_child"

(** Returns the flags that @popover uses to create/display a menu from its model. *)
external get_flags : t -> Gtk_enums.popovermenuflags = "ml_gtk_popover_menu_get_flags"

(** Adds a custom widget to a generated menu.

For this to work, the menu model of @popover must have
an item with a `custom` attribute that matches @id. *)
external add_child : t -> Gtk.widget -> string -> bool = "ml_gtk_popover_menu_add_child"

