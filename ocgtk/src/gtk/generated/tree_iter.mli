(* GENERATED CODE - DO NOT EDIT *)
(* TreeIter: TreeIter *)

(** The `GtkTreeIter` is the primary structure
for accessing a `GtkTreeModel`. Models are expected to put a unique
integer in the @stamp member, and put
model-specific data in the three @user_data
members. *)
type t = [`tree_iter] Gobject.obj

(* Methods *)

external get_type : unit -> Gobject.Type.t = "ml_gtk_tree_iter_get_type"
