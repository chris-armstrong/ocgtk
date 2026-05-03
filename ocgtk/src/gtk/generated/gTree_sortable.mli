class type tree_sortable_t = object
  method on_sort_column_changed :
    callback:(unit -> unit) -> Gobject.Signal.handler_id

  method has_default_sort_func : unit -> bool
  method set_sort_column_id : int -> Gtk_enums.sorttype -> unit
  method sort_column_changed : unit -> unit
  method as_tree_sortable : Tree_sortable.t
end

class tree_sortable : Tree_sortable.t -> tree_sortable_t
