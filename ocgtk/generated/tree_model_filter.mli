class type tree_model_filter_t = object
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  method clear_cache : unit -> unit
  method convert_child_path_to_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  method convert_path_to_child_path : Raw.Tree_path.t -> Raw.Tree_path.t option
  method get_model : unit -> Tree_model.tree_model_t
  method refilter : unit -> unit
  method set_visible_column : int -> unit
  method child_model : Tree_model.tree_model_t
  method virtual_root : Raw.Tree_path.t
  method as_tree_model_filter : Raw.Tree_model_filter.t
end

class tree_model_filter : Raw.Tree_model_filter.t -> tree_model_filter_t
