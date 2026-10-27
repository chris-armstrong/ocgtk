(* GENERATED CODE - DO NOT EDIT *)
(* TreeSelection, a member of the cyclic module Tree_selection_and__tree_view *)

(** The selection object for GtkTreeView

    The [GtkTreeSelection] object is a helper object to manage the selection for
    a [GtkTreeView] widget. The [GtkTreeSelection] object is automatically
    created when a new [GtkTreeView] widget is created, and cannot exist
    independently of this widget. The primary reason the [GtkTreeSelection]
    objects exists is for cleanliness of code and API. That is, there is no
    conceptual reason all these functions could not be methods on the
    [GtkTreeView] widget instead of a separate function.

    The [GtkTreeSelection] object is gotten from a [GtkTreeView] by calling
    gtk_tree_view_get_selection(). It can be manipulated to check the selection
    status of the tree, as well as select and deselect individual rows.
    Selection is done completely view side. As a result, multiple views of the
    same model can have completely different selections. Additionally, you
    cannot change the selection of a row on the model that is not currently
    displayed by the view without expanding its parents first.

    One of the important things to remember when monitoring the selection of a
    view is that the [GtkTreeSelection]::changed signal is mostly a hint. That
    is, it may only emit one signal when a range of rows is selected.
    Additionally, it may on occasion emit a [GtkTreeSelection]::changed signal
    when nothing has happened (mostly as a result of programmers calling
    select_row on an already selected row).

    The class built on this module is in {!Ocgtk.Tree_selection}. *)

include module type of struct
  include Tree_selection_and__tree_view.Tree_selection
end
