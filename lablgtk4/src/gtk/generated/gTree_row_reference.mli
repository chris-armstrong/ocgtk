class tree_row_reference : Tree_row_reference.t ->
  object
    method copy : unit -> Tree_row_reference.t
    method free : unit -> unit
    method get_path : unit -> Tree_path.t option
    method valid : unit -> bool
    method as_tree_row_reference : Tree_row_reference.t
  end

