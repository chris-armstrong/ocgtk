(* GENERATED CODE - DO NOT EDIT *)
(* TreeIter: TreeIter *)

type t = [ `tree_iter ] Gobject.obj
(** The `GtkTreeIter` is the primary structure
for accessing a `GtkTreeModel`. Models are expected to put a unique
integer in the @stamp member, and put
model-specific data in the three @user_data
members. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_stamp : t -> int = "ml_gtk_tree_iter_get_stamp"

(* Setters *)
external set_stamp : t -> int -> unit = "ml_gtk_tree_iter_set_stamp"
external make : int -> t = "ml_gtk_tree_iter_make"
external get_type : unit -> Gobject.Type.t = "ml_gtk_tree_iter_get_type"
