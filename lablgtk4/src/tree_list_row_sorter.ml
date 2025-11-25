(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeListRowSorter *)

type t = Gtk.widget

(** Create a new TreeListRowSorter *)
external new_ : Gtk.widget option -> t = "ml_gtk_tree_list_row_sorter_new"

(* Properties *)

(** Sets the sorter to use for items with the same parent.

This sorter will be passed the [property@Gtk.TreeListRow:item] of
the tree list rows passed to @self. *)
external set_sorter : t -> Gtk.widget option -> unit = "ml_gtk_tree_list_row_sorter_set_sorter"

(** Returns the sorter used by @self. *)
external get_sorter : t -> Gtk.widget = "ml_gtk_tree_list_row_sorter_get_sorter"

