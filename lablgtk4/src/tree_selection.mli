(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeSelection *)

type t = Gtk.Widget.t

(* Properties *)

external unselect_range : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_selection_unselect_range"

external unselect_path : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_selection_unselect_path"

external unselect_iter : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_selection_unselect_iter"

external unselect_all : t -> unit = "ml_gtk_tree_selection_unselect_all"

external set_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_tree_selection_set_mode"

external select_range : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_selection_select_range"

external select_path : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_selection_select_path"

external select_iter : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_selection_select_iter"

external select_all : t -> unit = "ml_gtk_tree_selection_select_all"

external path_is_selected : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_selection_path_is_selected"

external iter_is_selected : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_selection_iter_is_selected"

external get_tree_view : t -> Gtk.Widget.t = "ml_gtk_tree_selection_get_tree_view"

external get_selected : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_selection_get_selected"

external get_mode : t -> Gtk_enums.selectionmode = "ml_gtk_tree_selection_get_mode"

external count_selected_rows : t -> int = "ml_gtk_tree_selection_count_selected_rows"

