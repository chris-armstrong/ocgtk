class type tree_list_model_t = object
    method get_autoexpand : unit -> bool
    method get_child_row : int -> GTree_list_row.tree_list_row_t option
    method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t
    method get_passthrough : unit -> bool
    method get_row : int -> GTree_list_row.tree_list_row_t option
    method set_autoexpand : bool -> unit
    method item_type : int
    method n_items : int
    method as_tree_list_model : Tree_list_model.t
end

(* High-level class for TreeListModel *)
class tree_list_model (obj : Tree_list_model.t) : tree_list_model_t = object (self)

  method get_autoexpand : unit -> bool =
    fun () ->
      (Tree_list_model.get_autoexpand obj)

  method get_child_row : int -> GTree_list_row.tree_list_row_t option =
    fun position ->
      Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_list_model.get_child_row obj position)

  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t =
    fun () ->
      new  Ocgtk_gio.Gio.List_model.list_model(Tree_list_model.get_model obj)

  method get_passthrough : unit -> bool =
    fun () ->
      (Tree_list_model.get_passthrough obj)

  method get_row : int -> GTree_list_row.tree_list_row_t option =
    fun position ->
      Option.map (fun ret -> new GTree_list_row.tree_list_row ret) (Tree_list_model.get_row obj position)

  method set_autoexpand : bool -> unit =
    fun autoexpand ->
      (Tree_list_model.set_autoexpand obj autoexpand)

  method item_type = Tree_list_model.get_item_type obj

  method n_items = Tree_list_model.get_n_items obj

    method as_tree_list_model = obj
end

