(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeModel *)

type t = Gtk.Widget.t

external unref_node : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_unref_node"

external rows_reordered_with_length : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit -> int -> unit = "ml_gtk_tree_model_rows_reordered_with_length"

external rows_reordered : t -> Gtk.Widget.t -> Gtk.Widget.t -> int -> unit = "ml_gtk_tree_model_rows_reordered"

external row_inserted : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_row_inserted"

external row_has_child_toggled : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_row_has_child_toggled"

external row_deleted : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_row_deleted"

external row_changed : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_row_changed"

external ref_node : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_model_ref_node"

external iter_previous : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_iter_previous"

external iter_parent : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_iter_parent"

external iter_nth_child : t -> Gtk.Widget.t -> Gtk.Widget.t option -> int -> bool = "ml_gtk_tree_model_iter_nth_child"

external iter_next : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_iter_next"

external iter_n_children : t -> Gtk.Widget.t option -> int = "ml_gtk_tree_model_iter_n_children"

external iter_has_child : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_iter_has_child"

external iter_children : t -> Gtk.Widget.t -> Gtk.Widget.t option -> bool = "ml_gtk_tree_model_iter_children"

external get_value : t -> Gtk.Widget.t -> int -> unit -> unit = "ml_gtk_tree_model_get_value"

external get_valist : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_tree_model_get_valist"

external get_path : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_tree_model_get_path"

external get_n_columns : t -> int = "ml_gtk_tree_model_get_n_columns"

external get_iter_from_string : t -> Gtk.Widget.t -> string -> bool = "ml_gtk_tree_model_get_iter_from_string"

external get_iter_first : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_get_iter_first"

external get_iter : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_model_get_iter"

external get_flags : t -> Gtk_enums.treemodelflags = "ml_gtk_tree_model_get_flags"

external get : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_tree_model_get"

external foreach : t -> unit -> unit -> unit = "ml_gtk_tree_model_foreach"

external filter_new : t -> Gtk.Widget.t option -> Gtk.Widget.t = "ml_gtk_tree_model_filter_new"

