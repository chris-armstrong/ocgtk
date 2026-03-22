class type tree_list_row_t = object
    method get_child_row : int -> tree_list_row_t option
    method get_children : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
    method get_depth : unit -> int
    method get_expanded : unit -> bool
    method get_parent : unit -> tree_list_row_t option
    method get_position : unit -> int
    method is_expandable : unit -> bool
    method set_expanded : bool -> unit
    method expandable : bool
    method as_tree_list_row : Tree_list_row.t
end

(* High-level class for TreeListRow *)
class tree_list_row (obj : Tree_list_row.t) : tree_list_row_t = object (self)

  method get_child_row : int -> tree_list_row_t option =
    fun position ->
      Option.map (fun ret -> new tree_list_row ret) (Tree_list_row.get_child_row obj position)

  method get_children : unit -> Ocgtk_gio.Gio.List_model.list_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.List_model.list_model ret) (Tree_list_row.get_children obj)

  method get_depth : unit -> int =
    fun () ->
      (Tree_list_row.get_depth obj)

  method get_expanded : unit -> bool =
    fun () ->
      (Tree_list_row.get_expanded obj)

  method get_parent : unit -> tree_list_row_t option =
    fun () ->
      Option.map (fun ret -> new tree_list_row ret) (Tree_list_row.get_parent obj)

  method get_position : unit -> int =
    fun () ->
      (Tree_list_row.get_position obj)

  method is_expandable : unit -> bool =
    fun () ->
      (Tree_list_row.is_expandable obj)

  method set_expanded : bool -> unit =
    fun expanded ->
      (Tree_list_row.set_expanded obj expanded)

  method expandable = Tree_list_row.get_expandable obj

    method as_tree_list_row = obj
end

