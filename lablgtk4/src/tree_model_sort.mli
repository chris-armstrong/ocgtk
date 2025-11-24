(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeModelSort *)

type t = Gtk.widget

(** Create a new TreeModelSort *)
external new_with_model : Gtk.widget -> t = "ml_gtk_tree_model_sort_new_with_model"

(* Properties *)

external reset_default_sort_func : t -> unit = "ml_gtk_tree_model_sort_reset_default_sort_func"

external iter_is_valid : t -> Gtk.widget -> bool = "ml_gtk_tree_model_sort_iter_is_valid"

external get_model : t -> Gtk.widget = "ml_gtk_tree_model_sort_get_model"

external convert_path_to_child_path : t -> Gtk.widget -> Gtk.widget = "ml_gtk_tree_model_sort_convert_path_to_child_path"

external convert_iter_to_child_iter : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_model_sort_convert_iter_to_child_iter"

external convert_child_path_to_path : t -> Gtk.widget -> Gtk.widget = "ml_gtk_tree_model_sort_convert_child_path_to_path"

external convert_child_iter_to_iter : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_tree_model_sort_convert_child_iter_to_iter"

external clear_cache : t -> unit = "ml_gtk_tree_model_sort_clear_cache"

