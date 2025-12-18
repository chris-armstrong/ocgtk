(* High-level class for TreeListModel *)
class tree_list_model (obj : Tree_list_model.t) = object (self)

  method autoexpand = Tree_list_model.get_autoexpand obj
  method set_autoexpand v = Tree_list_model.set_autoexpand obj v

  method n_items = Tree_list_model.get_n_items obj

  method passthrough = Tree_list_model.get_passthrough obj

  method get_child_row : int -> GTree_list_row.tree_list_row option = fun position -> Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_list_model.get_child_row obj position)

  method get_row : int -> GTree_list_row.tree_list_row option = fun position -> Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_list_model.get_row obj position)

    method as_tree_list_model = obj
end

