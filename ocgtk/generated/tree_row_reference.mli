(** A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [GtkTreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with gtk_tree_row_reference_new().

    Its methods, signals and properties are on
    {!class-type-tree_row_reference_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Tree_row_reference}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeRowReference].}

    A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [GtkTreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with gtk_tree_row_reference_new(). *)
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
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_row_reference.t}. *)

(** {1:constructors Constructors} *)

val new_ : Tree_model.tree_model_t -> Raw.Tree_path.t -> tree_row_reference_t
(** Creates a row reference based on [path].

    This reference will keep pointing to the node pointed to by [path], so long
    as it exists. Any changes that occur on [model] are propagated, and the path
    is updated appropriately. If [path] isn’t a valid path in [model], then
    [NULL] is returned. *)

val new_proxy :
  [ `object_ ] Gobject.obj ->
  Tree_model.tree_model_t ->
  Raw.Tree_path.t ->
  tree_row_reference_t
(** You do not need to use this function.

    Creates a row reference based on [path].

    This reference will keep pointing to the node pointed to by [path], so long
    as it exists. If [path] isn’t a valid path in [model], then [NULL] is
    returned. However, unlike references created with
    gtk_tree_row_reference_new(), it does not listen to the model for changes.
    The creator of the row reference must do this explicitly using
    gtk_tree_row_reference_inserted(), gtk_tree_row_reference_deleted(),
    gtk_tree_row_reference_reordered().

    These functions must be called exactly once per proxy when the corresponding
    signal on the model is emitted. This single call updates all row references
    for that proxy. Since built-in GTK objects like [GtkTreeView] already use
    this mechanism internally, using them as the proxy object will produce
    unpredictable results. Further more, passing the same object as [model] and
    [proxy] doesn’t work for reasons of internal implementation.

    This type of row reference is primarily meant by structures that need to
    carefully monitor exactly when a row reference updates itself, and is not
    generally needed by most applications. *)
