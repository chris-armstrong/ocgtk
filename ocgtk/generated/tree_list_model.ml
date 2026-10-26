class type tree_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  method get_autoexpand : unit -> bool
  method get_child_row : int -> Tree_list_row.tree_list_row_t option
  method get_model : unit -> Ocgio.List_model.list_model_t
  method get_passthrough : unit -> bool
  method get_row : int -> Tree_list_row.tree_list_row_t option
  method set_autoexpand : bool -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_tree_list_model : Raw.Tree_list_model.t
end

(* High-level class for TreeListModel *)
class tree_list_model (obj : Raw.Tree_list_model.t) : tree_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_autoexpand : unit -> bool =
      fun () -> Raw.Tree_list_model.get_autoexpand obj

    method get_child_row : int -> Tree_list_row.tree_list_row_t option =
      fun position ->
        Option.map
          (fun ret -> new Tree_list_row.tree_list_row ret)
          (Raw.Tree_list_model.get_child_row obj position)

    method get_model : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model (Raw.Tree_list_model.get_model obj)

    method get_passthrough : unit -> bool =
      fun () -> Raw.Tree_list_model.get_passthrough obj

    method get_row : int -> Tree_list_row.tree_list_row_t option =
      fun position ->
        Option.map
          (fun ret -> new Tree_list_row.tree_list_row ret)
          (Raw.Tree_list_model.get_row obj position)

    method set_autoexpand : bool -> unit =
      fun autoexpand -> Raw.Tree_list_model.set_autoexpand obj autoexpand

    method item_type = Raw.Tree_list_model.get_item_type obj
    method n_items = Raw.Tree_list_model.get_n_items obj
    method as_tree_list_model = obj
  end
