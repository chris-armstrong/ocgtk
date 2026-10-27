class type tree_sortable_t = object
  method on_sort_column_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

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

(* High-level class for TreeSortable *)
class tree_sortable (obj : Raw.Tree_sortable.t) : tree_sortable_t =
  object (self)
    method on_sort_column_changed ?(after = false) ~callback () =
      Raw.Tree_sortable.on_sort_column_changed ~after self#as_tree_sortable
        ~callback

    method has_default_sort_func : unit -> bool =
      fun () -> Raw.Tree_sortable.has_default_sort_func obj

    method set_sort_column_id : int -> Enums.sorttype -> unit =
      fun sort_column_id order ->
        Raw.Tree_sortable.set_sort_column_id obj sort_column_id order

    method sort_column_changed : unit -> unit =
      fun () -> Raw.Tree_sortable.sort_column_changed obj

    method as_tree_sortable = obj
  end
