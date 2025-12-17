(* High-level class for TreeListModel *)
class tree_list_model (obj : Tree_list_model.t) = object (self)

  method get_autoexpand : unit -> bool = fun () -> (Tree_list_model.get_autoexpand obj )

  method get_child_row : int -> GTree_list_row.tree_list_row option = fun position -> Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_list_model.get_child_row obj position)

  method get_passthrough : unit -> bool = fun () -> (Tree_list_model.get_passthrough obj )

  method get_row : int -> GTree_list_row.tree_list_row option = fun position -> Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_list_model.get_row obj position)

  method set_autoexpand : bool -> unit = fun autoexpand -> (Tree_list_model.set_autoexpand obj autoexpand)

    method as_tree_list_model = obj
end

