(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeModel *)

type t = Gtk.widget

external unref_node : t -> Gtk.widget -> unit = "ml_gtk_tree_model_unref_node"

external row_inserted : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_model_row_inserted"

external row_has_child_toggled : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_model_row_has_child_toggled"

external row_deleted : t -> Gtk.widget -> unit = "ml_gtk_tree_model_row_deleted"

external row_changed : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_tree_model_row_changed"

external ref_node : t -> Gtk.widget -> unit = "ml_gtk_tree_model_ref_node"

external iter_previous : t -> Gtk.widget -> bool = "ml_gtk_tree_model_iter_previous"

external iter_parent : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_tree_model_iter_parent"

external iter_nth_child : t -> Gtk.widget -> Gtk.widget option -> int -> bool = "ml_gtk_tree_model_iter_nth_child"

external iter_next : t -> Gtk.widget -> bool = "ml_gtk_tree_model_iter_next"

external iter_n_children : t -> Gtk.widget option -> int = "ml_gtk_tree_model_iter_n_children"

external iter_has_child : t -> Gtk.widget -> bool = "ml_gtk_tree_model_iter_has_child"

external iter_children : t -> Gtk.widget -> Gtk.widget option -> bool = "ml_gtk_tree_model_iter_children"

external get_path : t -> Gtk.widget -> Gtk.widget = "ml_gtk_tree_model_get_path"

external get_n_columns : t -> int = "ml_gtk_tree_model_get_n_columns"

external get_iter_from_string : t -> Gtk.widget -> string -> bool = "ml_gtk_tree_model_get_iter_from_string"

external get_iter_first : t -> Gtk.widget -> bool = "ml_gtk_tree_model_get_iter_first"

external get_iter : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_tree_model_get_iter"

external get_flags : t -> Gtk_enums.treemodelflags = "ml_gtk_tree_model_get_flags"

external filter_new : t -> Gtk.widget option -> Gtk.widget = "ml_gtk_tree_model_filter_new"

