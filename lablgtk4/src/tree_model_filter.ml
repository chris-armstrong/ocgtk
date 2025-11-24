(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeModelFilter *)

type t = Gtk.widget

(* Properties *)

external set_visible_column : t -> int -> unit = "ml_gtk_tree_model_filter_set_visible_column"

external refilter : t -> unit = "ml_gtk_tree_model_filter_refilter"

external get_model : t -> Gtk.widget = "ml_gtk_tree_model_filter_get_model"

external convert_path_to_child_path : t -> Gtk.widget -> Gtk.widget = "ml_gtk_tree_model_filter_convert_path_to_child_path"

external convert_iter_to_child_iter : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_model_filter_convert_iter_to_child_iter"

external convert_child_path_to_path : t -> Gtk.widget -> Gtk.widget = "ml_gtk_tree_model_filter_convert_child_path_to_path"

external convert_child_iter_to_iter : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_tree_model_filter_convert_child_iter_to_iter"

external clear_cache : t -> unit = "ml_gtk_tree_model_filter_clear_cache"

