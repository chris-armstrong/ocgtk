class type list_store_t = object
  inherit GBuildable.buildable_t
  inherit GTree_drag_dest.tree_drag_dest_t
  inherit GTree_drag_source.tree_drag_source_t
  inherit GTree_model.tree_model_t
  inherit GTree_sortable.tree_sortable_t
  method clear : unit -> unit
  method iter_is_valid : Tree_iter.t -> bool
  method move_after : Tree_iter.t -> Tree_iter.t option -> unit
  method move_before : Tree_iter.t -> Tree_iter.t option -> unit
  method remove : Tree_iter.t -> bool
  method set_column_types : int -> Gobject.Type.t array -> unit
  method set_value : Tree_iter.t -> int -> Gobject.Value.t -> unit

  method set_valuesv :
    Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit

  method swap : Tree_iter.t -> Tree_iter.t -> unit
  method as_list_store : List_store.t
end

(* High-level class for ListStore *)
class list_store (obj : List_store.t) : list_store_t =
  object (self)
    inherit GBuildable.buildable (Buildable.from_gobject obj)
    inherit GTree_drag_dest.tree_drag_dest (Tree_drag_dest.from_gobject obj)

    inherit
      GTree_drag_source.tree_drag_source (Tree_drag_source.from_gobject obj)

    inherit GTree_model.tree_model (Tree_model.from_gobject obj)
    inherit GTree_sortable.tree_sortable (Tree_sortable.from_gobject obj)
    method clear : unit -> unit = fun () -> List_store.clear obj

    method iter_is_valid : Tree_iter.t -> bool =
      fun iter -> List_store.iter_is_valid obj iter

    method move_after : Tree_iter.t -> Tree_iter.t option -> unit =
      fun iter position -> List_store.move_after obj iter position

    method move_before : Tree_iter.t -> Tree_iter.t option -> unit =
      fun iter position -> List_store.move_before obj iter position

    method remove : Tree_iter.t -> bool = fun iter -> List_store.remove obj iter

    method set_column_types : int -> Gobject.Type.t array -> unit =
      fun n_columns types -> List_store.set_column_types obj n_columns types

    method set_value : Tree_iter.t -> int -> Gobject.Value.t -> unit =
      fun iter column value -> List_store.set_value obj iter column value

    method set_valuesv :
        Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit =
      fun iter columns values n_values ->
        List_store.set_valuesv obj iter columns values n_values

    method swap : Tree_iter.t -> Tree_iter.t -> unit =
      fun a b -> List_store.swap obj a b

    method as_list_store = obj
  end

let newv (n_columns : int) (types : Gobject.Type.t array) : list_store_t =
  let obj_ = List_store.newv n_columns types in
  new list_store obj_
