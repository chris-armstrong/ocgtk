class type tree_store_t = object
  inherit Buildable.buildable_t
  inherit Tree_drag_dest.tree_drag_dest_t
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t
  method clear : unit -> unit
  method is_ancestor : Raw.Tree_iter.t -> Raw.Tree_iter.t -> bool
  method iter_depth : Raw.Tree_iter.t -> int
  method iter_is_valid : Raw.Tree_iter.t -> bool
  method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  method remove : Raw.Tree_iter.t -> bool
  method set_column_types : int -> Gobject.Type.t array -> unit
  method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit

  method set_valuesv :
    Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit

  method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit
  method as_tree_store : Raw.Tree_store.t
end

(* High-level class for TreeStore *)
class tree_store (obj : Raw.Tree_store.t) : tree_store_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)
    inherit Tree_drag_dest.tree_drag_dest (Raw.Tree_drag_dest.from_gobject obj)

    inherit
      Tree_drag_source.tree_drag_source (Raw.Tree_drag_source.from_gobject obj)

    inherit Tree_model.tree_model (Raw.Tree_model.from_gobject obj)
    inherit Tree_sortable.tree_sortable (Raw.Tree_sortable.from_gobject obj)
    method clear : unit -> unit = fun () -> Raw.Tree_store.clear obj

    method is_ancestor : Raw.Tree_iter.t -> Raw.Tree_iter.t -> bool =
      fun iter descendant -> Raw.Tree_store.is_ancestor obj iter descendant

    method iter_depth : Raw.Tree_iter.t -> int =
      fun iter -> Raw.Tree_store.iter_depth obj iter

    method iter_is_valid : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_store.iter_is_valid obj iter

    method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit =
      fun iter position -> Raw.Tree_store.move_after obj iter position

    method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit =
      fun iter position -> Raw.Tree_store.move_before obj iter position

    method remove : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_store.remove obj iter

    method set_column_types : int -> Gobject.Type.t array -> unit =
      fun n_columns types -> Raw.Tree_store.set_column_types obj n_columns types

    method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit =
      fun iter column value -> Raw.Tree_store.set_value obj iter column value

    method set_valuesv :
        Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit =
      fun iter columns values n_values ->
        Raw.Tree_store.set_valuesv obj iter columns values n_values

    method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit =
      fun a b -> Raw.Tree_store.swap obj a b

    method as_tree_store = obj
  end

let newv (n_columns : int) (types : Gobject.Type.t array) : tree_store_t =
  let obj_ = Raw.Tree_store.newv n_columns types in
  new tree_store obj_
