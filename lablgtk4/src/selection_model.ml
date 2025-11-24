(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SelectionModel *)

type t = Gtk.Widget.t

external unselect_range : t -> int -> int -> bool = "ml_gtk_selection_model_unselect_range"

external unselect_item : t -> int -> bool = "ml_gtk_selection_model_unselect_item"

external unselect_all : t -> bool = "ml_gtk_selection_model_unselect_all"

external set_selection : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_selection_model_set_selection"

external selection_changed : t -> int -> int -> unit = "ml_gtk_selection_model_selection_changed"

external select_range : t -> int -> int -> bool -> bool = "ml_gtk_selection_model_select_range"

external select_item : t -> int -> bool -> bool = "ml_gtk_selection_model_select_item"

external select_all : t -> bool = "ml_gtk_selection_model_select_all"

external is_selected : t -> int -> bool = "ml_gtk_selection_model_is_selected"

external get_selection_in_range : t -> int -> int -> Gtk.Widget.t = "ml_gtk_selection_model_get_selection_in_range"

external get_selection : t -> Gtk.Widget.t = "ml_gtk_selection_model_get_selection"

