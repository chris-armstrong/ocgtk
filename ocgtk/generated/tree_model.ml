class type tree_model_t = object
  method filter_new : Raw.Tree_path.t option -> tree_model_t
  (** Creates a new [GtkTreeModel], with [child_model] as the child_model and
      [root] as the virtual root. *)

  method get_column_type : int -> Gobject.Type.t
  (** Returns the type of the column. *)

  method get_flags : unit -> Enums.treemodelflags
  (** Returns a set of flags supported by this interface.

      The flags are a bitwise combination of [GtkTreeModel]Flags. The flags
      supported should not change during the lifetime of the [tree_model]. *)

  method get_n_columns : unit -> int
  (** Returns the number of columns supported by [tree_model]. *)

  method get_path : Raw.Tree_iter.t -> Raw.Tree_path.t
  (** Returns a newly-created [GtkTreePath] referenced by [iter].

      This path should be freed with gtk_tree_path_free(). *)

  method get_string_from_iter : Raw.Tree_iter.t -> string option
  (** Generates a string representation of the iter.

      This string is a “:” separated list of numbers. For example, “4:10:0:3”
      would be an acceptable return value for this string. *)

  method iter_has_child : Raw.Tree_iter.t -> bool
  (** Returns [TRUE] if [iter] has children, [FALSE] otherwise. *)

  method iter_n_children : Raw.Tree_iter.t option -> int
  (** Returns the number of children that [iter] has.

      As a special case, if [iter] is [NULL], then the number of toplevel nodes
      is returned. *)

  method iter_next : Raw.Tree_iter.t -> bool
  (** Sets [iter] to point to the node following it at the current level.

      If there is no next [iter], [FALSE] is returned and [iter] is set to be
      invalid. *)

  method iter_previous : Raw.Tree_iter.t -> bool
  (** Sets [iter] to point to the previous node at the current level.

      If there is no previous [iter], [FALSE] is returned and [iter] is set to
      be invalid. *)

  method ref_node : Raw.Tree_iter.t -> unit
  (** Lets the tree ref the node.

      This is an optional method for models to implement. To be more specific,
      models may ignore this call as it exists primarily for performance
      reasons.

      This function is primarily meant as a way for views to let caching models
      know when nodes are being displayed (and hence, whether or not to cache
      that node). Being displayed means a node is in an expanded branch,
      regardless of whether the node is currently visible in the viewport. For
      example, a file-system based model would not want to keep the entire
      file-hierarchy in memory, just the sections that are currently being
      displayed by every current view.

      A model should be expected to be able to get an iter independent of its
      reffed state. *)

  method row_changed : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit
  (** Emits the ::row-changed signal on [tree_model].

      See [Gtk.TreeModel::row-changed]. *)

  method row_deleted : Raw.Tree_path.t -> unit
  (** Emits the ::row-deleted signal on [tree_model].

      See [Gtk.TreeModel::row-deleted].

      This should be called by models after a row has been removed. The location
      pointed to by [path] should be the location that the row previously was
      at. It may not be a valid location anymore.

      Nodes that are deleted are not unreffed, this means that any outstanding
      references on the deleted node should not be released. *)

  method row_has_child_toggled : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit
  (** Emits the ::row-has-child-toggled signal on [tree_model].

      See [Gtk.TreeModel::row-has-child-toggled].

      This should be called by models after the child state of a node changes.
  *)

  method row_inserted : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit
  (** Emits the ::row-inserted signal on [tree_model].

      See [Gtk.TreeModel::row-inserted]. *)

  method rows_reordered_with_length :
    Raw.Tree_path.t -> Raw.Tree_iter.t option -> int array -> int -> unit
  (** Emits the ::rows-reordered signal on [tree_model].

      See [Gtk.TreeModel::rows-reordered].

      This should be called by models when their rows have been reordered. *)

  method unref_node : Raw.Tree_iter.t -> unit
  (** Lets the tree unref the node.

      This is an optional method for models to implement. To be more specific,
      models may ignore this call as it exists primarily for performance
      reasons. For more information on what this means, see
      gtk_tree_model_ref_node().

      Please note that nodes that are deleted are not unreffed. *)

  method as_tree_model : Raw.Tree_model.t
end

(* High-level class for TreeModel *)
class tree_model (obj : Raw.Tree_model.t) : tree_model_t =
  object (self)
    method filter_new : Raw.Tree_path.t option -> tree_model_t =
      fun root -> new tree_model (Raw.Tree_model.filter_new obj root)

    method get_column_type : int -> Gobject.Type.t =
      fun index_ -> Raw.Tree_model.get_column_type obj index_

    method get_flags : unit -> Enums.treemodelflags =
      fun () -> Raw.Tree_model.get_flags obj

    method get_n_columns : unit -> int =
      fun () -> Raw.Tree_model.get_n_columns obj

    method get_path : Raw.Tree_iter.t -> Raw.Tree_path.t =
      fun iter -> Raw.Tree_model.get_path obj iter

    method get_string_from_iter : Raw.Tree_iter.t -> string option =
      fun iter -> Raw.Tree_model.get_string_from_iter obj iter

    method iter_has_child : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model.iter_has_child obj iter

    method iter_n_children : Raw.Tree_iter.t option -> int =
      fun iter -> Raw.Tree_model.iter_n_children obj iter

    method iter_next : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model.iter_next obj iter

    method iter_previous : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_model.iter_previous obj iter

    method ref_node : Raw.Tree_iter.t -> unit =
      fun iter -> Raw.Tree_model.ref_node obj iter

    method row_changed : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit =
      fun path iter -> Raw.Tree_model.row_changed obj path iter

    method row_deleted : Raw.Tree_path.t -> unit =
      fun path -> Raw.Tree_model.row_deleted obj path

    method row_has_child_toggled : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit =
      fun path iter -> Raw.Tree_model.row_has_child_toggled obj path iter

    method row_inserted : Raw.Tree_path.t -> Raw.Tree_iter.t -> unit =
      fun path iter -> Raw.Tree_model.row_inserted obj path iter

    method rows_reordered_with_length :
        Raw.Tree_path.t -> Raw.Tree_iter.t option -> int array -> int -> unit =
      fun path iter new_order length ->
        Raw.Tree_model.rows_reordered_with_length obj path iter new_order length

    method unref_node : Raw.Tree_iter.t -> unit =
      fun iter -> Raw.Tree_model.unref_node obj iter

    method as_tree_model = obj
  end
