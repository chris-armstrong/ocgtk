(* High-level class for TreeListRow *)
class tree_list_row (obj : Tree_list_row.t) = object (self)

  method depth = Tree_list_row.get_depth obj

  method expandable = Tree_list_row.get_expandable obj

  method expanded = Tree_list_row.get_expanded obj
  method set_expanded v = Tree_list_row.set_expanded obj v

  method get_child_row : int -> tree_list_row option = fun position -> Option.map (fun ret -> new tree_list_row ret) (Tree_list_row.get_child_row obj position)

  method get_parent : unit -> tree_list_row option = fun () -> Option.map (fun ret -> new tree_list_row ret) (Tree_list_row.get_parent obj )

  method get_position : unit -> int = fun () -> (Tree_list_row.get_position obj )

  method is_expandable : unit -> bool = fun () -> (Tree_list_row.is_expandable obj )

    method as_tree_list_row = obj
end

