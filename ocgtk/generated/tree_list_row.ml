class type tree_list_row_t = object
  method get_child_row : int -> tree_list_row_t option
  method get_children : unit -> Ocgio.List_model.list_model_t option
  method get_depth : unit -> int
  method get_expanded : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_parent : unit -> tree_list_row_t option
  method get_position : unit -> int
  method is_expandable : unit -> bool
  method set_expanded : bool -> unit
  method as_tree_list_row : Raw.Tree_list_row.t
end

(* High-level class for TreeListRow *)
class tree_list_row (obj : Raw.Tree_list_row.t) : tree_list_row_t =
  object (self)
    method get_child_row : int -> tree_list_row_t option =
      fun position ->
        Option.map
          (fun ret -> new tree_list_row ret)
          (Raw.Tree_list_row.get_child_row obj position)

    method get_children : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Tree_list_row.get_children obj)

    method get_depth : unit -> int = fun () -> Raw.Tree_list_row.get_depth obj

    method get_expanded : unit -> bool =
      fun () -> Raw.Tree_list_row.get_expanded obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Tree_list_row.get_item obj

    method get_parent : unit -> tree_list_row_t option =
      fun () ->
        Option.map
          (fun ret -> new tree_list_row ret)
          (Raw.Tree_list_row.get_parent obj)

    method get_position : unit -> int =
      fun () -> Raw.Tree_list_row.get_position obj

    method is_expandable : unit -> bool =
      fun () -> Raw.Tree_list_row.is_expandable obj

    method set_expanded : bool -> unit =
      fun expanded -> Raw.Tree_list_row.set_expanded obj expanded

    method as_tree_list_row = obj
  end
