(* Signal class defined in gtree_sortable_signals.ml *)

(* High-level class for TreeSortable *)
class tree_sortable (obj : Tree_sortable.t) = object (self)
  inherit Gtree_sortable_signals.tree_sortable_signals obj

  method has_default_sort_func : unit -> bool =
    fun () ->
      (Tree_sortable.has_default_sort_func obj)

  method set_sort_column_id : int -> Gtk_enums.sorttype -> unit =
    fun sort_column_id order ->
      (Tree_sortable.set_sort_column_id obj sort_column_id order)

  method sort_column_changed : unit -> unit =
    fun () ->
      (Tree_sortable.sort_column_changed obj)

    method as_tree_sortable = obj
end

