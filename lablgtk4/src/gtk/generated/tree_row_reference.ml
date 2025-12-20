(* GENERATED CODE - DO NOT EDIT *)
(* TreeRowReference: TreeRowReference *)

(** A GtkTreeRowReference tracks model changes so that it always refers to the
same row (a `GtkTreePath` refers to a position, not a fixed row). Create a
new GtkTreeRowReference with gtk_tree_row_reference_new(). *)
type t = [`tree_row_reference] Gobject.obj

(** Create a new TreeRowReference *)
external new_ : unit -> Tree_path.t -> t = "ml_gtk_tree_row_reference_new"

(** Create a new TreeRowReference *)
external new_proxy : unit -> unit -> Tree_path.t -> t = "ml_gtk_tree_row_reference_new_proxy"

(* Methods *)
(** Returns %TRUE if the @reference is non-%NULL and refers to
a current valid path. *)
external valid : t -> bool = "ml_gtk_tree_row_reference_valid"

(** Returns a path that the row reference currently points to,
or %NULL if the path pointed to is no longer valid. *)
external get_path : t -> Tree_path.t option = "ml_gtk_tree_row_reference_get_path"

(** Free’s @reference. @reference may be %NULL *)
external free : t -> unit = "ml_gtk_tree_row_reference_free"

(** Copies a `GtkTreeRowReference`. *)
external copy : t -> t = "ml_gtk_tree_row_reference_copy"

