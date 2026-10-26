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

(* High-level class for TreeModelFilter *)
class tree_model_filter (obj : Raw.Tree_model_filter.t) : tree_model_filter_t =
  object (self)
    inherit
      Tree_drag_source.tree_drag_source (Raw.Tree_drag_source.from_gobject obj)

    inherit Tree_model.tree_model (Raw.Tree_model.from_gobject obj)

    method clear_cache : unit -> unit =
      fun () -> Raw.Tree_model_filter.clear_cache obj

    method convert_child_path_to_path :
        Raw.Tree_path.t -> Raw.Tree_path.t option =
      fun child_path ->
        Raw.Tree_model_filter.convert_child_path_to_path obj child_path

    method convert_path_to_child_path :
        Raw.Tree_path.t -> Raw.Tree_path.t option =
      fun filter_path ->
        Raw.Tree_model_filter.convert_path_to_child_path obj filter_path

    method get_model : unit -> Tree_model.tree_model_t =
      fun () -> new Tree_model.tree_model (Raw.Tree_model_filter.get_model obj)

    method refilter : unit -> unit =
      fun () -> Raw.Tree_model_filter.refilter obj

    method set_visible_column : int -> unit =
      fun column -> Raw.Tree_model_filter.set_visible_column obj column

    method child_model =
      new Tree_model.tree_model (Raw.Tree_model_filter.get_child_model obj)

    method virtual_root = Raw.Tree_model_filter.get_virtual_root obj
    method as_tree_model_filter = obj
  end
