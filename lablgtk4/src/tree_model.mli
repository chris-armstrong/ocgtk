(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeModel *)

type t = Gtk.widget

(** Lets the tree unref the node.

This is an optional method for models to implement.
To be more specific, models may ignore this call as it exists
primarily for performance reasons. For more information on what
this means, see gtk_tree_model_ref_node().

Please note that nodes that are deleted are not unreffed. *)
external unref_node : t -> Obj.t -> unit = "ml_gtk_tree_model_unref_node"

(** Emits the ::row-inserted signal on @tree_model.

See [signal@Gtk.TreeModel::row-inserted]. *)
external row_inserted : t -> Obj.t -> Obj.t -> unit = "ml_gtk_tree_model_row_inserted"

(** Emits the ::row-has-child-toggled signal on @tree_model.

See [signal@Gtk.TreeModel::row-has-child-toggled].

This should be called by models after the child
state of a node changes. *)
external row_has_child_toggled : t -> Obj.t -> Obj.t -> unit = "ml_gtk_tree_model_row_has_child_toggled"

(** Emits the ::row-deleted signal on @tree_model.

See [signal@Gtk.TreeModel::row-deleted].

This should be called by models after a row has been removed.
The location pointed to by @path should be the location that
the row previously was at. It may not be a valid location anymore.

Nodes that are deleted are not unreffed, this means that any
outstanding references on the deleted node should not be released. *)
external row_deleted : t -> Obj.t -> unit = "ml_gtk_tree_model_row_deleted"

(** Emits the ::row-changed signal on @tree_model.

See [signal@Gtk.TreeModel::row-changed]. *)
external row_changed : t -> Obj.t -> Obj.t -> unit = "ml_gtk_tree_model_row_changed"

(** Lets the tree ref the node.

This is an optional method for models to implement.
To be more specific, models may ignore this call as it exists
primarily for performance reasons.

This function is primarily meant as a way for views to let
caching models know when nodes are being displayed (and hence,
whether or not to cache that node). Being displayed means a node
is in an expanded branch, regardless of whether the node is currently
visible in the viewport. For example, a file-system based model
would not want to keep the entire file-hierarchy in memory,
just the sections that are currently being displayed by
every current view.

A model should be expected to be able to get an iter independent
of its reffed state. *)
external ref_node : t -> Obj.t -> unit = "ml_gtk_tree_model_ref_node"

(** Sets @iter to point to the previous node at the current level.

If there is no previous @iter, %FALSE is returned and @iter is
set to be invalid. *)
external iter_previous : t -> Obj.t -> bool = "ml_gtk_tree_model_iter_previous"

(** Sets @iter to be the parent of @child.

If @child is at the toplevel, and doesn’t have a parent, then
@iter is set to an invalid iterator and %FALSE is returned.
@child will remain a valid node after this function has been
called.

@iter will be initialized before the lookup is performed, so @child
and @iter cannot point to the same memory location. *)
external iter_parent : t -> Obj.t -> bool * Obj.t = "ml_gtk_tree_model_iter_parent"

(** Sets @iter to be the child of @parent, using the given index.

The first index is 0. If @n is too big, or @parent has no children,
@iter is set to an invalid iterator and %FALSE is returned. @parent
will remain a valid node after this function has been called. As a
special case, if @parent is %NULL, then the @n-th root node
is set. *)
external iter_nth_child : t -> Obj.t option -> int -> bool * Obj.t = "ml_gtk_tree_model_iter_nth_child"

(** Sets @iter to point to the node following it at the current level.

If there is no next @iter, %FALSE is returned and @iter is set
to be invalid. *)
external iter_next : t -> Obj.t -> bool = "ml_gtk_tree_model_iter_next"

(** Returns the number of children that @iter has.

As a special case, if @iter is %NULL, then the number
of toplevel nodes is returned. *)
external iter_n_children : t -> Obj.t option -> int = "ml_gtk_tree_model_iter_n_children"

(** Returns %TRUE if @iter has children, %FALSE otherwise. *)
external iter_has_child : t -> Obj.t -> bool = "ml_gtk_tree_model_iter_has_child"

(** Sets @iter to point to the first child of @parent.

If @parent has no children, %FALSE is returned and @iter is
set to be invalid. @parent will remain a valid node after this
function has been called.

If @parent is %NULL returns the first node, equivalent to
`gtk_tree_model_get_iter_first (tree_model, iter);` *)
external iter_children : t -> Obj.t option -> bool * Obj.t = "ml_gtk_tree_model_iter_children"

(** Returns a newly-created `GtkTreePath` referenced by @iter.

This path should be freed with gtk_tree_path_free(). *)
external get_path : t -> Obj.t -> Obj.t = "ml_gtk_tree_model_get_path"

(** Returns the number of columns supported by @tree_model. *)
external get_n_columns : t -> int = "ml_gtk_tree_model_get_n_columns"

(** Sets @iter to a valid iterator pointing to @path_string, if it
exists.

Otherwise, @iter is left invalid and %FALSE is returned. *)
external get_iter_from_string : t -> string -> bool * Obj.t = "ml_gtk_tree_model_get_iter_from_string"

(** Initializes @iter with the first iterator in the tree
(the one at the path "0").

Returns %FALSE if the tree is empty, %TRUE otherwise. *)
external get_iter_first : t -> bool * Obj.t = "ml_gtk_tree_model_get_iter_first"

(** Sets @iter to a valid iterator pointing to @path.

If @path does not exist, @iter is set to an invalid
iterator and %FALSE is returned. *)
external get_iter : t -> Obj.t -> bool * Obj.t = "ml_gtk_tree_model_get_iter"

(** Returns a set of flags supported by this interface.

The flags are a bitwise combination of `GtkTreeModel`Flags.
The flags supported should not change during the lifetime
of the @tree_model. *)
external get_flags : t -> Gtk_enums.treemodelflags = "ml_gtk_tree_model_get_flags"

(** Creates a new `GtkTreeModel`, with @child_model as the child_model
and @root as the virtual root. *)
external filter_new : t -> Obj.t option -> Gtk.widget = "ml_gtk_tree_model_filter_new"

