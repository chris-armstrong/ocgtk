(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsGroup *)

type t = [`shortcuts_group | `box | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(* Methods *)
(** Adds a shortcut to the shortcuts group.

This is the programmatic equivalent to using [class@Gtk.Builder] and a
`<child>` tag to add the child. Adding children with other API is not
appropriate as `GtkShortcutsGroup` manages its children internally. *)
external add_shortcut : t -> Shortcuts_shortcut.t -> unit = "ml_gtk_shortcuts_group_add_shortcut"

(* Properties *)

(** Get property: accel-size-group *)
external get_accel_size_group : t -> Size_group.t = "ml_gtk_shortcuts_group_get_accel_size_group"

(** Set property: accel-size-group *)
external set_accel_size_group : t -> Size_group.t -> unit = "ml_gtk_shortcuts_group_set_accel_size_group"

(** Get property: height *)
external get_height : t -> int = "ml_gtk_shortcuts_group_get_height"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_shortcuts_group_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_shortcuts_group_set_title"

(** Get property: title-size-group *)
external get_title_size_group : t -> Size_group.t = "ml_gtk_shortcuts_group_get_title_size_group"

(** Set property: title-size-group *)
external set_title_size_group : t -> Size_group.t -> unit = "ml_gtk_shortcuts_group_set_title_size_group"

(** Get property: view *)
external get_view : t -> string = "ml_gtk_shortcuts_group_get_view"

(** Set property: view *)
external set_view : t -> string -> unit = "ml_gtk_shortcuts_group_set_view"

