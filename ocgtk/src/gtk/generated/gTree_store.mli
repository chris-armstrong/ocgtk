class tree_store : Tree_store.t ->
  object
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

