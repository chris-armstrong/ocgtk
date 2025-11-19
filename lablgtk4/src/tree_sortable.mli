(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeSortable *)

type t = Gtk.Widget.t

external sort_column_changed : t -> unit = "ml_gtk_tree_sortable_sort_column_changed"

external set_sort_func : t -> int -> unit -> unit -> unit -> unit = "ml_gtk_tree_sortable_set_sort_func"

external set_sort_column_id : t -> int -> sorttype -> unit = "ml_gtk_tree_sortable_set_sort_column_id"

external set_default_sort_func : t -> unit -> unit -> unit -> unit = "ml_gtk_tree_sortable_set_default_sort_func"

external has_default_sort_func : t -> bool = "ml_gtk_tree_sortable_has_default_sort_func"

external get_sort_column_id : t -> int -> Gtk.Widget.t -> bool = "ml_gtk_tree_sortable_get_sort_column_id"

