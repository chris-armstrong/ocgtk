(* GENERATED CODE - DO NOT EDIT *)
(* Widget: LevelBar *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_level_bar_new"

external new_for_interval : float -> float -> t = "ml_gtk_level_bar_new_for_interval"

(* Properties *)

external get_inverted : t -> bool = "ml_gtk_level_bar_get_inverted"

external set_inverted : t -> bool -> unit = "ml_gtk_level_bar_set_inverted"

external get_max_value : t -> float = "ml_gtk_level_bar_get_max_value"

external set_max_value : t -> float -> unit = "ml_gtk_level_bar_set_max_value"

external get_min_value : t -> float = "ml_gtk_level_bar_get_min_value"

external set_min_value : t -> float -> unit = "ml_gtk_level_bar_set_min_value"

external get_value : t -> float = "ml_gtk_level_bar_get_value"

external set_value : t -> float -> unit = "ml_gtk_level_bar_set_value"

external set_mode : t -> Gtk_enums.levelbarmode -> unit = "ml_gtk_level_bar_set_mode"

external remove_offset_value : t -> string option -> unit = "ml_gtk_level_bar_remove_offset_value"

external get_mode : t -> Gtk_enums.levelbarmode = "ml_gtk_level_bar_get_mode"

external add_offset_value : t -> string -> float -> unit = "ml_gtk_level_bar_add_offset_value"

