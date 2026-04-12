class type tree_store_t = object
    inherit GBuildable.buildable_t
    inherit GTree_drag_dest.tree_drag_dest_t
    inherit GTree_drag_source.tree_drag_source_t
    inherit GTree_model.tree_model_t
    inherit GTree_sortable.tree_sortable_t
    method clear : unit -> unit
    method is_ancestor : Tree_iter.t -> Tree_iter.t -> bool
    method iter_depth : Tree_iter.t -> int
    method iter_is_valid : Tree_iter.t -> bool
    method move_after : Tree_iter.t -> Tree_iter.t option -> unit
    method move_before : Tree_iter.t -> Tree_iter.t option -> unit
    method remove : Tree_iter.t -> bool
    method swap : Tree_iter.t -> Tree_iter.t -> unit
    method as_tree_store : Tree_store.t
end

(* High-level class for TreeStore *)
class tree_store (obj : Tree_store.t) : tree_store_t = object (self)
  inherit GBuildable.buildable (Buildable.from_gobject obj)
  inherit GTree_drag_dest.tree_drag_dest (Tree_drag_dest.from_gobject obj)
  inherit GTree_drag_source.tree_drag_source (Tree_drag_source.from_gobject obj)
  inherit GTree_model.tree_model (Tree_model.from_gobject obj)
  inherit GTree_sortable.tree_sortable (Tree_sortable.from_gobject obj)

  method clear : unit -> unit =
    fun () ->
      (Tree_store.clear obj)

  method is_ancestor : Tree_iter.t -> Tree_iter.t -> bool =
    fun iter descendant ->
      (Tree_store.is_ancestor obj iter descendant)

  method iter_depth : Tree_iter.t -> int =
    fun iter ->
      (Tree_store.iter_depth obj iter)

  method iter_is_valid : Tree_iter.t -> bool =
    fun iter ->
      (Tree_store.iter_is_valid obj iter)

  method move_after : Tree_iter.t -> Tree_iter.t option -> unit =
    fun iter position ->
      (Tree_store.move_after obj iter position)

  method move_before : Tree_iter.t -> Tree_iter.t option -> unit =
    fun iter position ->
      (Tree_store.move_before obj iter position)

  method remove : Tree_iter.t -> bool =
    fun iter ->
      (Tree_store.remove obj iter)

  method swap : Tree_iter.t -> Tree_iter.t -> unit =
    fun a b ->
      (Tree_store.swap obj a b)

    method as_tree_store = obj
end

