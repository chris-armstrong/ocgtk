(** A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [GtkTreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with gtk_tree_row_reference_new().

    Its methods, signals and properties are on
    {!class-type-tree_row_reference_t}. The functions it is built on are in
    {!Ocgtk.Raw.Tree_row_reference}. *)

(** The methods, signals and properties of a [GtkTreeRowReference]. *)
class type tree_row_reference_t = object
  method get_model : unit -> Tree_model.tree_model_t
  (** Returns the model that the row reference is monitoring. *)

  method get_path : unit -> Raw.Tree_path.t option
  (** Returns a path that the row reference currently points to, or [NULL] if
      the path pointed to is no longer valid. *)

  method valid : unit -> bool
  (** Returns [TRUE] if the [reference] is non-[NULL] and refers to a current
      valid path. *)

  method as_tree_row_reference : Raw.Tree_row_reference.t
end

class tree_row_reference : Raw.Tree_row_reference.t -> tree_row_reference_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_row_reference.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeRowReference], give one already wrapped. *)

val new_ : Tree_model.tree_model_t -> Raw.Tree_path.t -> tree_row_reference_t

val new_proxy :
  [ `object_ ] Gobject.obj ->
  Tree_model.tree_model_t ->
  Raw.Tree_path.t ->
  tree_row_reference_t
