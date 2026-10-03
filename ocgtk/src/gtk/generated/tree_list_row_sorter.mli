(* GENERATED CODE - DO NOT EDIT *)
(* TreeListRowSorter: TreeListRowSorter *)

type t = [ `tree_list_row_sorter | `sorter | `object_ ] Gobject.obj
(** Applies a gives sorter to the levels in a tree.

    Here is an example for setting up a column view with a tree model and a
    [GtkTreeListSorter]:

    {[
    column_sorter = gtk_column_view_get_sorter view;
    sorter = gtk_tree_list_row_sorter_new (g_object_ref column_sorter);
    sort_model = gtk_sort_list_model_new (tree_model, sorter);
    selection = gtk_single_selection_new sort_model;
    gtk_column_view_set_model (view, G_LIST_MODEL selection)
    ]} *)

external new_ : Sorter.t option -> t = "ml_gtk_tree_list_row_sorter_new"
(** Create a new TreeListRowSorter *)

(* Methods *)

external set_sorter : t -> Sorter.t option -> unit
  = "ml_gtk_tree_list_row_sorter_set_sorter"
(** Sets the sorter to use for items with the same parent.

    This sorter will be passed the [Gtk.TreeListRow:item] of the tree list rows
    passed to [self]. *)

external get_sorter : t -> Sorter.t option
  = "ml_gtk_tree_list_row_sorter_get_sorter"
(** Returns the sorter used by [self]. *)

(* Properties *)
