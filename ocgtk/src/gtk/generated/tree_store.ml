(* GENERATED CODE - DO NOT EDIT *)
(* TreeStore: TreeStore *)

type t = [`tree_store | `object_] Gobject.obj

(** Create a new TreeStore *)
external new_ : int -> unit -> t = "ml_gtk_tree_store_new"

(** Create a new TreeStore *)
external newv : int -> unit -> t = "ml_gtk_tree_store_newv"

(* Methods *)
(** Swaps @a and @b in the same level of @tree_store.

Note that this function only works with unsorted stores. *)
external swap : t -> Tree_iter.t -> Tree_iter.t -> unit = "ml_gtk_tree_store_swap"

(** Reorders the children of @parent in @tree_store to follow the order
indicated by @new_order.

Note that this function only works with unsorted stores. *)
external reorder : t -> Tree_iter.t option -> int array -> unit = "ml_gtk_tree_store_reorder"

(** Removes @iter from @tree_store.

After being removed, @iter is set to the next valid row at that level, or
invalidated if it previously pointed to the last one. *)
external remove : t -> Tree_iter.t -> bool = "ml_gtk_tree_store_remove"

(** Prepends a new row to @tree_store.

If @parent is non-%NULL, then it will prepend the new row before the first
child of @parent, otherwise it will prepend a row to the top level. The
`iter` parameter will be changed to point to this new row.  The row will
be empty after this function is called. To fill in values, you need to
call gtk_tree_store_set() or gtk_tree_store_set_value(). *)
external prepend : t -> Tree_iter.t option -> Tree_iter.t = "ml_gtk_tree_store_prepend"

(** Moves @iter in @tree_store to the position before @position.

@iter and @position should be in the same level.

Note that this function only works with unsorted stores.

If @position is %NULL, @iter will be moved to the end of the level. *)
external move_before : t -> Tree_iter.t -> Tree_iter.t option -> unit = "ml_gtk_tree_store_move_before"

(** Moves @iter in @tree_store to the position after @position.

@iter and @position should be in the same level.

Note that this function only works with unsorted stores.

If @position is %NULL, @iter will be moved to the start of the level. *)
external move_after : t -> Tree_iter.t -> Tree_iter.t option -> unit = "ml_gtk_tree_store_move_after"

(** Checks if the given iter is a valid iter for this `GtkTreeStore`.

This function is slow. Only use it for debugging and/or testing
purposes. *)
external iter_is_valid : t -> Tree_iter.t -> bool = "ml_gtk_tree_store_iter_is_valid"

(** Returns the depth of the position pointed by the iterator

The depth will be 0 for anything on the root level, 1 for anything down
a level, etc. *)
external iter_depth : t -> Tree_iter.t -> int = "ml_gtk_tree_store_iter_depth"

(** Checks if @iter is an ancestor of @descendant. *)
external is_ancestor : t -> Tree_iter.t -> Tree_iter.t -> bool = "ml_gtk_tree_store_is_ancestor"

(** Inserts a new row before @sibling.

If @sibling is %NULL, then the row will be appended to @parent’s children.

If @parent and @sibling are %NULL, then the row will be appended to the
toplevel.

If both @sibling and @parent are set, then @parent must be the parent
of @sibling. When @sibling is set, @parent is optional.

The @iter parameter will be changed to point to this new row. The row will
be empty after this function is called. To fill in values, you need to call
gtk_tree_store_set() or gtk_tree_store_set_value(). *)
external insert_before : t -> Tree_iter.t option -> Tree_iter.t option -> Tree_iter.t = "ml_gtk_tree_store_insert_before"

(** Inserts a new row after @sibling.

If @sibling is %NULL, then the row will be prepended to @parent’s children.

If @parent and @sibling are %NULL, then the row will be prepended to the
toplevel.

If both @sibling and @parent are set, then @parent must be the parent
of @sibling. When @sibling is set, @parent is optional.

The @iter parameter will be changed to point to this new row. The row will
be empty after this function is called. To fill in values, you need to call
gtk_tree_store_set() or gtk_tree_store_set_value(). *)
external insert_after : t -> Tree_iter.t option -> Tree_iter.t option -> Tree_iter.t = "ml_gtk_tree_store_insert_after"

(** Creates a new row at @position.

If parent is non-%NULL, then the row will be made a child of @parent.
Otherwise, the row will be created at the toplevel.

If @position is `-1` or is larger than the number of rows at that level,
then the new row will be inserted to the end of the list.

The @iter parameter will be changed to point to this new row. The row
will be empty after this function is called. To fill in values, you
need to call gtk_tree_store_set() or gtk_tree_store_set_value(). *)
external insert : t -> Tree_iter.t option -> int -> Tree_iter.t = "ml_gtk_tree_store_insert"

(** Removes all rows from @tree_store *)
external clear : t -> unit = "ml_gtk_tree_store_clear"

(** Appends a new row to @tree_store.

If @parent is non-%NULL, then it will append the new row after the last
child of @parent, otherwise it will append a row to the top level.

The @iter parameter will be changed to point to this new row. The row will
be empty after this function is called. To fill in values, you need to call
gtk_tree_store_set() or gtk_tree_store_set_value(). *)
external append : t -> Tree_iter.t option -> Tree_iter.t = "ml_gtk_tree_store_append"

