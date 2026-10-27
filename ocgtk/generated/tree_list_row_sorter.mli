(** Applies a gives sorter to the levels in a tree.

    Here is an example for setting up a column view with a tree model and a
    [GtkTreeListSorter]:

    {[
    column_sorter = gtk_column_view_get_sorter view;
    sorter = gtk_tree_list_row_sorter_new (g_object_ref column_sorter);
    sort_model = gtk_sort_list_model_new (tree_model, sorter);
    selection = gtk_single_selection_new sort_model;
    gtk_column_view_set_model (view, G_LIST_MODEL selection)
    ]}

    Its methods, signals and properties are on
    {!class-type-tree_list_row_sorter_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Tree_list_row_sorter}. *)

(** The methods, signals and properties of a [GtkTreeListRowSorter]. *)
class type tree_list_row_sorter_t = object
  inherit Sorter.sorter_t

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns the sorter used by [self]. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Sets the sorter to use for items with the same parent.

      This sorter will be passed the [Gtk.TreeListRow:item] of the tree list
      rows passed to [self]. *)

  method as_tree_list_row_sorter : Raw.Tree_list_row_sorter.t
end

class tree_list_row_sorter :
  Raw.Tree_list_row_sorter.t ->
  tree_list_row_sorter_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_list_row_sorter.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkTreeListRowSorter], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Sorter.sorter_t option -> tree_list_row_sorter_t
(** Create a special-purpose sorter that applies the sorting of [sorter] to the
    levels of a [GtkTreeListModel].

    Note that this sorter relies on [Gtk.TreeListModel:passthrough] being
    [FALSE] as it can only sort [Gtk.TreeListRow]s. *)
