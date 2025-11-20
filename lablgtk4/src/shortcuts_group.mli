(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsGroup *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: height *)
external get_height : t -> int = "ml_gtk_shortcuts_group_get_height"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_shortcuts_group_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_shortcuts_group_set_title"

(** Get property: view *)
external get_view : t -> string = "ml_gtk_shortcuts_group_get_view"

(** Set property: view *)
external set_view : t -> string -> unit = "ml_gtk_shortcuts_group_set_view"

external add_shortcut : t -> Gtk.Widget.t -> unit = "ml_gtk_shortcuts_group_add_shortcut"

