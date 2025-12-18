(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LevelBar *)

type t = [`level_bar | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new LevelBar *)
external new_ : unit -> t = "ml_gtk_level_bar_new"

(** Create a new LevelBar *)
external new_for_interval : float -> float -> t = "ml_gtk_level_bar_new_for_interval"

(* Properties *)

(** Get property: inverted *)
external get_inverted : t -> bool = "ml_gtk_level_bar_get_inverted"

(** Set property: inverted *)
external set_inverted : t -> bool -> unit = "ml_gtk_level_bar_set_inverted"

(** Get property: max-value *)
external get_max_value : t -> float = "ml_gtk_level_bar_get_max_value"

(** Set property: max-value *)
external set_max_value : t -> float -> unit = "ml_gtk_level_bar_set_max_value"

(** Get property: min-value *)
external get_min_value : t -> float = "ml_gtk_level_bar_get_min_value"

(** Set property: min-value *)
external set_min_value : t -> float -> unit = "ml_gtk_level_bar_set_min_value"

(** Get property: value *)
external get_value : t -> float = "ml_gtk_level_bar_get_value"

(** Set property: value *)
external set_value : t -> float -> unit = "ml_gtk_level_bar_set_value"

(** Sets the `mode` of the `GtkLevelBar`. *)
external set_mode : t -> Gtk_enums.levelbarmode -> unit = "ml_gtk_level_bar_set_mode"

(** Removes an offset marker from a `GtkLevelBar`.

The marker must have been previously added with
[method@Gtk.LevelBar.add_offset_value]. *)
external remove_offset_value : t -> string option -> unit = "ml_gtk_level_bar_remove_offset_value"

(** Returns the `mode` of the `GtkLevelBar`. *)
external get_mode : t -> Gtk_enums.levelbarmode = "ml_gtk_level_bar_get_mode"

(** Adds a new offset marker on @self at the position specified by @value.

When the bar value is in the interval topped by @value (or between @value
and [property@Gtk.LevelBar:max-value] in case the offset is the last one
on the bar) a style class named `level-`@name will be applied
when rendering the level bar fill.

If another offset marker named @name exists, its value will be
replaced by @value. *)
external add_offset_value : t -> string -> float -> unit = "ml_gtk_level_bar_add_offset_value"

