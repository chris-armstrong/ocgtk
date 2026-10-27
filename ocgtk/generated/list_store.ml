class type list_store_t = object
  inherit Buildable.buildable_t
  inherit Tree_drag_dest.tree_drag_dest_t
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t

  method clear : unit -> unit
  (** Removes all rows from the list store. *)

  method iter_is_valid : Raw.Tree_iter.t -> bool
  (** Checks if the given iter is a valid iter for this [GtkListStore].

      This function is slow. Only use it for debugging and/or testing purposes.
  *)

  method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  (** Moves [iter] in [store] to the position after [position]. Note that this
      function only works with unsorted stores. If [position] is [NULL], [iter]
      will be moved to the start of the list. *)

  method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  (** Moves [iter] in [store] to the position before [position]. Note that this
      function only works with unsorted stores. If [position] is [NULL], [iter]
      will be moved to the end of the list. *)

  method remove : Raw.Tree_iter.t -> bool
  (** Removes the given row from the list store. After being removed, [iter] is
      set to be the next valid row, or invalidated if it pointed to the last row
      in [list_store]. *)

  method set_column_types : int -> Gobject.Type.t array -> unit
  (** Sets the types of the columns of a list store.

      This function is meant primarily for objects that inherit from
      [GtkListStore], and should only be used when constructing a new instance.

      This function cannot be called after a row has been added, or a method on
      the [GtkTreeModel] interface is called. *)

  method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit
  (** Sets the data in the cell specified by [iter] and [column]. The type of
      [value] must be convertible to the type of the column. *)

  method set_valuesv :
    Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit
  (** A variant of gtk_list_store_set_valist() which takes the columns and
      values as two arrays, instead of varargs. This function is mainly intended
      for language-bindings and in case the number of columns to change is not
      known until run-time. *)

  method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit
  (** Swaps [a] and [b] in [store]. Note that this function only works with
      unsorted stores. *)

  method as_list_store : Raw.List_store.t
end

(* High-level class for ListStore *)
class list_store (obj : Raw.List_store.t) : list_store_t =
  object (self)
    inherit Buildable.buildable (Raw.Buildable.from_gobject obj)
    inherit Tree_drag_dest.tree_drag_dest (Raw.Tree_drag_dest.from_gobject obj)

    inherit
      Tree_drag_source.tree_drag_source (Raw.Tree_drag_source.from_gobject obj)

    inherit Tree_model.tree_model (Raw.Tree_model.from_gobject obj)
    inherit Tree_sortable.tree_sortable (Raw.Tree_sortable.from_gobject obj)
    method clear : unit -> unit = fun () -> Raw.List_store.clear obj

    method iter_is_valid : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.List_store.iter_is_valid obj iter

    method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit =
      fun iter position -> Raw.List_store.move_after obj iter position

    method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit =
      fun iter position -> Raw.List_store.move_before obj iter position

    method remove : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.List_store.remove obj iter

    method set_column_types : int -> Gobject.Type.t array -> unit =
      fun n_columns types -> Raw.List_store.set_column_types obj n_columns types

    method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit =
      fun iter column value -> Raw.List_store.set_value obj iter column value

    method set_valuesv :
        Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit =
      fun iter columns values n_values ->
        Raw.List_store.set_valuesv obj iter columns values n_values

    method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit =
      fun a b -> Raw.List_store.swap obj a b

    method as_list_store = obj
  end

let newv (n_columns : int) (types : Gobject.Type.t array) : list_store_t =
  let obj_ = Raw.List_store.newv n_columns types in
  new list_store obj_
