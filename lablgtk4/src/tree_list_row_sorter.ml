(* GENERATED CODE - DO NOT EDIT *)
(* TreeListRowSorter: TreeListRowSorter *)

type t = [`tree_list_row_sorter | `sorter | `object_] Gobject.obj

(** Create a new TreeListRowSorter *)
external new_ : Sorter.t option -> t = "ml_gtk_tree_list_row_sorter_new"

(* Properties *)

(** Sets the sorter to use for items with the same parent.

This sorter will be passed the [property@Gtk.TreeListRow:item] of
the tree list rows passed to @self. *)
external set_sorter : t -> Sorter.t option -> unit = "ml_gtk_tree_list_row_sorter_set_sorter"

(** Returns the sorter used by @self. *)
external get_sorter : t -> Sorter.t option = "ml_gtk_tree_list_row_sorter_get_sorter"

