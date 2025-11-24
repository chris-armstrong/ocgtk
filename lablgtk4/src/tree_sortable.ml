(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeSortable *)

type t = Gtk.Widget.t

external sort_column_changed : t -> unit = "ml_gtk_tree_sortable_sort_column_changed"

external set_sort_column_id : t -> int -> Gtk_enums.sorttype -> unit = "ml_gtk_tree_sortable_set_sort_column_id"

external has_default_sort_func : t -> bool = "ml_gtk_tree_sortable_has_default_sort_func"

