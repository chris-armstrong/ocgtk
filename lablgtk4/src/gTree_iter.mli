class tree_iter : Tree_iter.t ->
  object
    method copy : unit -> Tree_iter.t
    method free : unit -> unit
    method as_tree_iter : Tree_iter.t
  end

