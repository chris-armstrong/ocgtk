class tree_list_model : Tree_list_model.t ->
  object
    method get_autoexpand : unit -> bool
    method get_child_row : int -> GTree_list_row.tree_list_row option
    method get_model : unit -> Ocgtk_gio.Gio.list_model
    method get_passthrough : unit -> bool
    method get_row : int -> GTree_list_row.tree_list_row option
    method set_autoexpand : bool -> unit
    method n_items : int
    method as_tree_list_model : Tree_list_model.t
  end

