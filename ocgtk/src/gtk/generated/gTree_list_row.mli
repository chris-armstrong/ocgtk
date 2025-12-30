class tree_list_row : Tree_list_row.t ->
  object
    method get_child_row : int -> tree_list_row option
    method get_depth : unit -> int
    method get_expanded : unit -> bool
    method get_parent : unit -> tree_list_row option
    method get_position : unit -> int
    method is_expandable : unit -> bool
    method set_expanded : bool -> unit
    method expandable : bool
    method as_tree_list_row : Tree_list_row.t
  end

