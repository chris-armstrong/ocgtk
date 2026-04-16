class type list_store_t = object
  inherit GBuildable.buildable_t
  inherit GTree_drag_dest.tree_drag_dest_t
  inherit GTree_drag_source.tree_drag_source_t
  inherit GTree_model.tree_model_t
  inherit GTree_sortable.tree_sortable_t
  method clear : unit -> unit
  method iter_is_valid : Tree_iter.t -> bool
  method move_after : Tree_iter.t -> Tree_iter.t option -> unit
  method move_before : Tree_iter.t -> Tree_iter.t option -> unit
  method remove : Tree_iter.t -> bool
  method set_column_types : int -> int array -> unit
  method swap : Tree_iter.t -> Tree_iter.t -> unit
  method as_list_store : List_store.t
end

class list_store : List_store.t -> list_store_t

val newv : int -> int array -> list_store_t
