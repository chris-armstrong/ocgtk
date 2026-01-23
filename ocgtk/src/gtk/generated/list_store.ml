(* GENERATED CODE - DO NOT EDIT *)
(* ListStore: ListStore *)

type t = [`list_store | `object_] Gobject.obj

(** Create a new ListStore *)
external new_ : int -> unit -> t = "ml_gtk_list_store_new"

(** Create a new ListStore *)
external newv : int -> unit -> t = "ml_gtk_list_store_newv"

(* Methods *)
(** Swaps @a and @b in @store. Note that this function only works with
unsorted stores. *)
external swap : t -> Tree_iter.t -> Tree_iter.t -> unit = "ml_gtk_list_store_swap"

(** Reorders @store to follow the order indicated by @new_order. Note that
this function only works with unsorted stores. *)
external reorder : t -> int array -> unit = "ml_gtk_list_store_reorder"

(** Removes the given row from the list store.  After being removed,
@iter is set to be the next valid row, or invalidated if it pointed
to the last row in @list_store. *)
external remove : t -> Tree_iter.t -> bool = "ml_gtk_list_store_remove"

(** Prepends a new row to @list_store. @iter will be changed to point to this new
row. The row will be empty after this function is called. To fill in
values, you need to call gtk_list_store_set() or gtk_list_store_set_value(). *)
external prepend : t -> Tree_iter.t = "ml_gtk_list_store_prepend"

(** Moves @iter in @store to the position before @position. Note that this
function only works with unsorted stores. If @position is %NULL, @iter
will be moved to the end of the list. *)
external move_before : t -> Tree_iter.t -> Tree_iter.t option -> unit = "ml_gtk_list_store_move_before"

(** Moves @iter in @store to the position after @position. Note that this
function only works with unsorted stores. If @position is %NULL, @iter
will be moved to the start of the list. *)
external move_after : t -> Tree_iter.t -> Tree_iter.t option -> unit = "ml_gtk_list_store_move_after"

(** Checks if the given iter is a valid iter for this `GtkListStore`.

This function is slow. Only use it for debugging and/or testing
purposes. *)
external iter_is_valid : t -> Tree_iter.t -> bool = "ml_gtk_list_store_iter_is_valid"

(** Inserts a new row before @sibling. If @sibling is %NULL, then the row will
be appended to the end of the list. @iter will be changed to point to this
new row. The row will be empty after this function is called. To fill in
values, you need to call gtk_list_store_set() or gtk_list_store_set_value(). *)
external insert_before : t -> Tree_iter.t option -> Tree_iter.t = "ml_gtk_list_store_insert_before"

(** Inserts a new row after @sibling. If @sibling is %NULL, then the row will be
prepended to the beginning of the list. @iter will be changed to point to
this new row. The row will be empty after this function is called. To fill
in values, you need to call gtk_list_store_set() or gtk_list_store_set_value(). *)
external insert_after : t -> Tree_iter.t option -> Tree_iter.t = "ml_gtk_list_store_insert_after"

(** Creates a new row at @position.  @iter will be changed to point to this new
row.  If @position is -1 or is larger than the number of rows on the list,
then the new row will be appended to the list. The row will be empty after
this function is called.  To fill in values, you need to call
gtk_list_store_set() or gtk_list_store_set_value(). *)
external insert : t -> int -> Tree_iter.t = "ml_gtk_list_store_insert"

(** Removes all rows from the list store. *)
external clear : t -> unit = "ml_gtk_list_store_clear"

(** Appends a new row to @list_store.  @iter will be changed to point to this new
row.  The row will be empty after this function is called.  To fill in
values, you need to call gtk_list_store_set() or gtk_list_store_set_value(). *)
external append : t -> Tree_iter.t = "ml_gtk_list_store_append"

