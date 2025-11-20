(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeModelFilter *)

type t = Gtk.Widget.t

(* Properties *)

external set_visible_func : t -> unit -> unit -> unit -> unit = "ml_gtk_tree_model_filter_set_visible_func"

external set_visible_column : t -> int -> unit = "ml_gtk_tree_model_filter_set_visible_column"

external set_modify_func : t -> int -> unit -> unit -> unit -> unit -> unit = "ml_gtk_tree_model_filter_set_modify_func_bytecode" "ml_gtk_tree_model_filter_set_modify_func_native"

external refilter : t -> unit = "ml_gtk_tree_model_filter_refilter"

external get_model : t -> Gtk.Widget.t = "ml_gtk_tree_model_filter_get_model"

external convert_path_to_child_path : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_tree_model_filter_convert_path_to_child_path"

external convert_iter_to_child_iter : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_filter_convert_iter_to_child_iter"

external convert_child_path_to_path : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_tree_model_filter_convert_child_path_to_path"

external convert_child_iter_to_iter : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_filter_convert_child_iter_to_iter"

external clear_cache : t -> unit = "ml_gtk_tree_model_filter_clear_cache"

