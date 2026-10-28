(** The interface for sortable models used by GtkTreeView

    Its methods, signals and properties are on {!class-type-tree_sortable_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Tree_sortable}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeSortable].}

    The interface for sortable models used by GtkTreeView

    [GtkTreeSortable] is an interface to be implemented by tree models which
    support sorting. The [GtkTreeView] uses the methods provided by this
    interface to sort the model. *)
class type tree_sortable_t = object
  method on_sort_column_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The ::sort-column-changed signal is emitted when the sort column or sort
      order of [sortable] is changed. The signal is emitted before the contents
      of [sortable] are resorted. *)

  method has_default_sort_func : unit -> bool
  (** Returns [TRUE] if the model has a default sort function. This is used
      primarily by GtkTreeViewColumns in order to determine if a model can go
      back to the default state, or not. *)

  method set_sort_column_id : int -> Enums.sorttype -> unit
  (** Sets the current sort column to be [sort_column_id]. The [sortable] will
      resort itself to reflect this change, after emitting a
      [GtkTreeSortable::sort-column-changed] signal. [sort_column_id] may either
      be a regular column id, or one of the following special values:

      - [GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID]: the default sort function
        will be used, if it is set

      - [GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]: no sorting will occur *)

  method sort_column_changed : unit -> unit
  (** Emits a [GtkTreeSortable::sort-column-changed] signal on [sortable]. *)

  method as_tree_sortable : Raw.Tree_sortable.t
end

class tree_sortable : Raw.Tree_sortable.t -> tree_sortable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_sortable.t}. *)

(** {1:description Description}

    The interface for sortable models used by GtkTreeView

    [GtkTreeSortable] is an interface to be implemented by tree models which
    support sorting. The [GtkTreeView] uses the methods provided by this
    interface to sort the model. *)
