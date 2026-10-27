class type tree_sortable_t = object
  method on_sort_column_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method has_default_sort_func : unit -> bool
  method set_sort_column_id : int -> Enums.sorttype -> unit
  method sort_column_changed : unit -> unit
  method as_tree_sortable : Raw.Tree_sortable.t
end

class tree_sortable : Raw.Tree_sortable.t -> tree_sortable_t
