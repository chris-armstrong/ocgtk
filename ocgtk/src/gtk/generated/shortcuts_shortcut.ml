(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ShortcutsShortcut *)

type t = [`shortcuts_shortcut | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(* Methods *)
(* Properties *)

(** Get property: accel-size-group *)
external get_accel_size_group : t -> Size_group.t = "ml_gtk_shortcuts_shortcut_get_accel_size_group"

(** Set property: accel-size-group *)
external set_accel_size_group : t -> Size_group.t -> unit = "ml_gtk_shortcuts_shortcut_set_accel_size_group"

(** Get property: accelerator *)
external get_accelerator : t -> string = "ml_gtk_shortcuts_shortcut_get_accelerator"

(** Set property: accelerator *)
external set_accelerator : t -> string -> unit = "ml_gtk_shortcuts_shortcut_set_accelerator"

(** Get property: action-name *)
external get_action_name : t -> string = "ml_gtk_shortcuts_shortcut_get_action_name"

(** Set property: action-name *)
external set_action_name : t -> string -> unit = "ml_gtk_shortcuts_shortcut_set_action_name"

(** Get property: direction *)
external get_direction : t -> Gtk_enums.textdirection = "ml_gtk_shortcuts_shortcut_get_direction"

(** Set property: direction *)
external set_direction : t -> Gtk_enums.textdirection -> unit = "ml_gtk_shortcuts_shortcut_set_direction"

(** Get property: icon-set *)
external get_icon_set : t -> bool = "ml_gtk_shortcuts_shortcut_get_icon_set"

(** Set property: icon-set *)
external set_icon_set : t -> bool -> unit = "ml_gtk_shortcuts_shortcut_set_icon_set"

(** Get property: shortcut-type *)
external get_shortcut_type : t -> Gtk_enums.shortcuttype = "ml_gtk_shortcuts_shortcut_get_shortcut_type"

(** Set property: shortcut-type *)
external set_shortcut_type : t -> Gtk_enums.shortcuttype -> unit = "ml_gtk_shortcuts_shortcut_set_shortcut_type"

(** Get property: subtitle *)
external get_subtitle : t -> string = "ml_gtk_shortcuts_shortcut_get_subtitle"

(** Set property: subtitle *)
external set_subtitle : t -> string -> unit = "ml_gtk_shortcuts_shortcut_set_subtitle"

(** Get property: subtitle-set *)
external get_subtitle_set : t -> bool = "ml_gtk_shortcuts_shortcut_get_subtitle_set"

(** Set property: subtitle-set *)
external set_subtitle_set : t -> bool -> unit = "ml_gtk_shortcuts_shortcut_set_subtitle_set"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_shortcuts_shortcut_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_shortcuts_shortcut_set_title"

(** Get property: title-size-group *)
external get_title_size_group : t -> Size_group.t = "ml_gtk_shortcuts_shortcut_get_title_size_group"

(** Set property: title-size-group *)
external set_title_size_group : t -> Size_group.t -> unit = "ml_gtk_shortcuts_shortcut_set_title_size_group"

