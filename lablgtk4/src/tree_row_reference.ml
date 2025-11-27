(* GENERATED CODE - DO NOT EDIT *)
(* Record: TreeRowReference *)

(** A GtkTreeRowReference tracks model changes so that it always refers to the
same row (a `GtkTreePath` refers to a position, not a fixed row). Create a
new GtkTreeRowReference with gtk_tree_row_reference_new(). *)
type t = Obj.t

(** Create a new TreeRowReference *)
external new_ : Gtk.widget -> Obj.t -> t = "ml_gtk_tree_row_reference_new"

(** Create a new TreeRowReference *)
external new_proxy : unit -> Gtk.widget -> Obj.t -> t = "ml_gtk_tree_row_reference_new_proxy"

(** Returns %TRUE if the @reference is non-%NULL and refers to
a current valid path. *)
external valid : t -> bool = "ml_gtk_tree_row_reference_valid"

(** Returns a path that the row reference currently points to,
or %NULL if the path pointed to is no longer valid. *)
external get_path : t -> Obj.t option = "ml_gtk_tree_row_reference_get_path"

(** Returns the model that the row reference is monitoring. *)
external get_model : t -> Gtk.widget = "ml_gtk_tree_row_reference_get_model"

