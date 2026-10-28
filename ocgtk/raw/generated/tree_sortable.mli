(* GENERATED CODE - DO NOT EDIT *)
(* TreeSortable: TreeSortable *)

(** The interface for sortable models used by GtkTreeView

    [GtkTreeSortable] is an interface to be implemented by tree models which
    support sorting. The [GtkTreeView] uses the methods provided by this
    interface to sort the model.

    The class built on this module is in {!Ocgtk.Tree_sortable}. *)

type t = [ `tree_sortable ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_tree_sortable_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_tree_sortable_from_gobject"

(* Methods *)

external sort_column_changed : t -> unit
  = "ml_gtk_tree_sortable_sort_column_changed"
(** Emits a [GtkTreeSortable::sort-column-changed] signal on [sortable]. *)

external set_sort_column_id : t -> int -> Ocgtk_enums.sorttype -> unit
  = "ml_gtk_tree_sortable_set_sort_column_id"
(** Sets the current sort column to be [sort_column_id]. The [sortable] will
    resort itself to reflect this change, after emitting a
    [GtkTreeSortable::sort-column-changed] signal. [sort_column_id] may either
    be a regular column id, or one of the following special values:

    - [GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID]: the default sort function will
      be used, if it is set

    - [GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]: no sorting will occur *)

external has_default_sort_func : t -> bool
  = "ml_gtk_tree_sortable_has_default_sort_func"
(** Returns [true] if the model has a default sort function. This is used
    primarily by GtkTreeViewColumns in order to determine if a model can go back
    to the default state, or not. *)

external get_sort_column_id : t -> bool * int * Ocgtk_enums.sorttype
  = "ml_gtk_tree_sortable_get_sort_column_id"
(** Fills in [sort_column_id] and [order] with the current sort column and the
    order. It returns [true] unless the [sort_column_id] is
    [GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID] or
    [GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]. *)

val on_sort_column_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** The ::sort-column-changed signal is emitted when the sort column or sort
    order of [sortable] is changed. The signal is emitted before the contents of
    [sortable] are resorted. *)
