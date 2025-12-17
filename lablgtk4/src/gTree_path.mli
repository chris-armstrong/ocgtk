class tree_path : Tree_path.t ->
  object
    method append_index : int -> unit
    method compare : Tree_path.t -> int
    method copy : unit -> Tree_path.t
    method down : unit -> unit
    method free : unit -> unit
    method get_depth : unit -> int
    method is_ancestor : Tree_path.t -> bool
    method is_descendant : Tree_path.t -> bool
    method next : unit -> unit
    method prepend_index : int -> unit
    method prev : unit -> bool
    method up : unit -> bool
    method as_tree_path : Tree_path.t
  end

