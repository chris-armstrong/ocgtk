(* GENERATED CODE - DO NOT EDIT *)
(* TreeIter: TreeIter *)

(** The `GtkTreeIter` is the primary structure
for accessing a `GtkTreeModel`. Models are expected to put a unique
integer in the @stamp member, and put
model-specific data in the three @user_data
members. *)
type t = [`tree_iter] Gobject.obj

(** Frees an iterator that has been allocated by gtk_tree_iter_copy().

This function is mainly used for language bindings. *)
external free : t -> unit = "ml_gtk_tree_iter_free"

(** Creates a dynamically allocated tree iterator as a copy of @iter.

This function is not intended for use in applications,
because you can just copy the structs by value
(`GtkTreeIter new_iter = iter;`).
You must free this iter with gtk_tree_iter_free(). *)
external copy : t -> t = "ml_gtk_tree_iter_copy"

