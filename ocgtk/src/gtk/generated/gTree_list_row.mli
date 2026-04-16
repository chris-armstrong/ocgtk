class type tree_list_row_t = object
  method get_child_row : int -> tree_list_row_t option
  method get_children : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
  method get_depth : unit -> int
  method get_expanded : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_parent : unit -> tree_list_row_t option
  method get_position : unit -> int
  method is_expandable : unit -> bool
  method set_expanded : bool -> unit
  method expandable : bool
  method as_tree_list_row : Tree_list_row.t
end

class tree_list_row : Tree_list_row.t -> tree_list_row_t
