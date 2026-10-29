class type tree_store_t = object
  inherit Buildable.buildable_t
  inherit Tree_drag_dest.tree_drag_dest_t
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t

  (** {2:methods Methods} *)

  method clear : unit -> unit
  (** Removes all rows from [tree_store] *)

  method is_ancestor : Raw.Tree_iter.t -> Raw.Tree_iter.t -> bool
  (** Checks if [iter] is an ancestor of [descendant]. *)

  method iter_depth : Raw.Tree_iter.t -> int
  (** Returns the depth of the position pointed by the iterator

      The depth will be 0 for anything on the root level, 1 for anything down a
      level, etc. *)

  method iter_is_valid : Raw.Tree_iter.t -> bool
  (** Checks if the given iter is a valid iter for this [GtkTreeStore].

      This function is slow. Only use it for debugging and/or testing purposes.
  *)

  method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  (** Moves [iter] in [tree_store] to the position after [position].

      [iter] and [position] should be in the same level.

      Note that this function only works with unsorted stores.

      If [position] is [None], [iter] will be moved to the start of the level.
  *)

  method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  (** Moves [iter] in [tree_store] to the position before [position].

      [iter] and [position] should be in the same level.

      Note that this function only works with unsorted stores.

      If [position] is [None], [iter] will be moved to the end of the level. *)

  method remove : Raw.Tree_iter.t -> bool
  (** Removes [iter] from [tree_store].

      After being removed, [iter] is set to the next valid row at that level, or
      invalidated if it previously pointed to the last one. *)

  method set_column_types : int -> Gobject.Type.t array -> unit
  (** Sets the type of the columns in a tree store.

      This function is meant primarily for types that inherit from
      [GtkTreeStore], and should only be used when constructing a new
      [GtkTreeStore].

      This functions cannot be called after a row has been added, or a method on
      the [GtkTreeModel] interface is called on the tree store. *)

  method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit
  (** Sets the data in the cell specified by [iter] and [column].

      The type of [value] must be convertible to the type of the column. *)

  method set_valuesv :
    Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit
  (** A variant of [gtk_tree_store_set_valist ()] which takes the columns and
      values as two arrays, instead of using variadic arguments.

      This function is mainly intended for language bindings or in case the
      number of columns to change is not known until run-time. *)

  method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit
  (** Swaps [a] and [b] in the same level of [tree_store].

      Note that this function only works with unsorted stores. *)

  (** {2:conversions Conversions} *)

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
