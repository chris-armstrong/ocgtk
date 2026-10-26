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

class tree_list_model : Raw.Tree_list_model.t -> tree_list_model_t
