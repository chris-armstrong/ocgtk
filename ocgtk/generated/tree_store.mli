class type tree_store_t = object
  inherit Buildable.buildable_t
  inherit Tree_drag_dest.tree_drag_dest_t
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t
  method clear : unit -> unit
  method is_ancestor : Raw.Tree_iter.t -> Raw.Tree_iter.t -> bool
  method iter_depth : Raw.Tree_iter.t -> int
  method iter_is_valid : Raw.Tree_iter.t -> bool
  method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  method remove : Raw.Tree_iter.t -> bool
  method set_column_types : int -> Gobject.Type.t array -> unit
  method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit

  method set_valuesv :
    Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit

  method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit
  method as_tree_store : Raw.Tree_store.t
end

class tree_store : Raw.Tree_store.t -> tree_store_t

val newv : int -> Gobject.Type.t array -> tree_store_t
