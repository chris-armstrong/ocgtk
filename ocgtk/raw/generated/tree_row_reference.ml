(* GENERATED CODE - DO NOT EDIT *)
(* TreeRowReference: TreeRowReference *)

(** A GtkTreeRowReference tracks model changes so that it always refers to the
    same row (a [GtkTreePath] refers to a position, not a fixed row). Create a
    new GtkTreeRowReference with gtk_tree_row_reference_new().

    The class built on this module is in {!Ocgtk.Tree_row_reference}. *)

type t = [ `tree_row_reference ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_tree_row_reference_get_type"

external new_ : Tree_model.t -> Tree_path.t -> t
  = "ml_gtk_tree_row_reference_new"
(** Creates a row reference based on [path].

    This reference will keep pointing to the node pointed to by [path], so long
    as it exists. Any changes that occur on [model] are propagated, and the path
    is updated appropriately. If [path] isn’t a valid path in [model], then
    [NULL] is returned. *)

external new_proxy :
  [ `object_ ] Gobject.obj -> Tree_model.t -> Tree_path.t -> t
  = "ml_gtk_tree_row_reference_new_proxy"
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

(* Methods *)

external valid : t -> bool = "ml_gtk_tree_row_reference_valid"
(** Returns [TRUE] if the [reference] is non-[NULL] and refers to a current
    valid path. *)

external get_path : t -> Tree_path.t option
  = "ml_gtk_tree_row_reference_get_path"
(** Returns a path that the row reference currently points to, or [NULL] if the
    path pointed to is no longer valid. *)

external get_model : t -> Tree_model.t = "ml_gtk_tree_row_reference_get_model"
(** Returns the model that the row reference is monitoring. *)
