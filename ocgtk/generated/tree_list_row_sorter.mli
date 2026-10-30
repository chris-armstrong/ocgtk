(** Applies a gives sorter to the levels in a tree.

    Its methods, signals and properties are on
    {!class-type-tree_list_row_sorter_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_list_row_sorter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeListRowSorter].}

    Inherits from: {{!Ocgtk.Sorter.class-type-sorter_t}Ocgtk.Sorter}

    Applies a gives sorter to the levels in a tree.

    Here is an example for setting up a column view with a tree model and a
    [GtkTreeListSorter]:

    {[
    column_sorter = gtk_column_view_get_sorter view;
    sorter = gtk_tree_list_row_sorter_new (g_object_ref column_sorter);
    sort_model = gtk_sort_list_model_new (tree_model, sorter);
    selection = gtk_single_selection_new sort_model;
    gtk_column_view_set_model (view, G_LIST_MODEL selection)
    ]} *)
class type tree_list_row_sorter_t = object
  inherit Sorter.sorter_t

  (** {2:methods Methods} *)

  method get_sorter : unit -> Sorter.sorter_t option
  (** Returns the sorter used by [self]. *)

  method set_sorter : Sorter.sorter_t option -> unit
  (** Sets the sorter to use for items with the same parent.

      This sorter will be passed the [Gtk.TreeListRow:item] of the tree list
      rows passed to [self]. *)

  (** {2:conversions Conversions} *)

  method as_tree_list_row_sorter : Raw.Tree_list_row_sorter.t
end

class tree_list_row_sorter :
  Raw.Tree_list_row_sorter.t ->
  tree_list_row_sorter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_list_row_sorter.t}. *)

(** {1:description Description}

    Applies a gives sorter to the levels in a tree.

    Here is an example for setting up a column view with a tree model and a
    [GtkTreeListSorter]:

    {[
    column_sorter = gtk_column_view_get_sorter view;
    sorter = gtk_tree_list_row_sorter_new (g_object_ref column_sorter);
    sort_model = gtk_sort_list_model_new (tree_model, sorter);
    selection = gtk_single_selection_new sort_model;
    gtk_column_view_set_model (view, G_LIST_MODEL selection)
    ]} *)

(** {1:constructors Constructors} *)

val new_ : Sorter.sorter_t option -> tree_list_row_sorter_t
(** Create a special-purpose sorter that applies the sorting of [sorter] to the
    levels of a [GtkTreeListModel].

    Note that this sorter relies on
    {{!Ocgtk.Tree_list_model.class-type-tree_list_model_t.method-get_passthrough}
     [Gtk.TreeListModel:passthrough]} being [false] as it can only sort
    {{!Ocgtk.Tree_list_row.class-type-tree_list_row_t}[Gtk.TreeListRow]}s. *)
