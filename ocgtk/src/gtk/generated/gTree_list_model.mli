class type tree_list_model_t = object
  inherit Ocgtk_gio.Gio.List_model.list_model_t
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

class tree_list_model : Tree_list_model.t -> tree_list_model_t
