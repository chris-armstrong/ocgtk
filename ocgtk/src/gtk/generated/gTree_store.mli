class type tree_store_t = object
    inherit GBuildable.buildable_t
    inherit GTree_drag_dest.tree_drag_dest_t
    inherit GTree_drag_source.tree_drag_source_t
    inherit GTree_model.tree_model_t
    inherit GTree_sortable.tree_sortable_t
    method clear : unit -> unit
    method is_ancestor : Tree_iter.t -> Tree_iter.t -> bool
    method iter_depth : Tree_iter.t -> int
    method iter_is_valid : Tree_iter.t -> bool
    method move_after : Tree_iter.t -> Tree_iter.t option -> unit
    method move_before : Tree_iter.t -> Tree_iter.t option -> unit
    method remove : Tree_iter.t -> bool
    method swap : Tree_iter.t -> Tree_iter.t -> unit
    method as_tree_store : Tree_store.t
end

class tree_store : Tree_store.t -> tree_store_t

