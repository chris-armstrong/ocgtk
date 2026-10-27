class type tree_list_model_t = object
  inherit Ocgio.List_model.list_model_t

  method get_autoexpand : unit -> bool
  (** Gets whether the model is set to automatically expand new rows that get
      added.

      This can be either rows added by changes to the underlying models or via
      [Gtk.TreeListRow.set_expanded]. *)

  method get_child_row : int -> Tree_list_row.tree_list_row_t option
  (** Gets the row item corresponding to the child at index [position] for
      [self]'s root model.

      If [position] is greater than the number of children in the root model,
      [NULL] is returned.

      Do not confuse this function with [Gtk.TreeListModel.get_row]. *)

  method get_model : unit -> Ocgio.List_model.list_model_t
  (** Gets the root model that [self] was created with. *)

  method get_passthrough : unit -> bool
  (** Gets whether the model is passing through original row items.

      If this function returns [FALSE], the [GListModel] functions for [self]
      return custom [GtkTreeListRow] objects. You need to call
      [Gtk.TreeListRow.get_item] on these objects to get the original item.

      If [TRUE], the values of the child models are passed through in their
      original state. You then need to call [Gtk.TreeListModel.get_row] to get
      the custom [GtkTreeListRow]s. *)

  method get_row : int -> Tree_list_row.tree_list_row_t option
  (** Gets the row object for the given row.

      If [position] is greater than the number of items in [self], [NULL] is
      returned.

      The row object can be used to expand and collapse rows as well as to
      inspect its position in the tree. See its documentation for details.

      This row object is persistent and will refer to the current item as long
      as the row is present in [self], independent of other rows being added or
      removed.

      If [self] is set to not be passthrough, this function is equivalent to
      calling g_list_model_get_item().

      Do not confuse this function with [Gtk.TreeListModel.get_child_row]. *)

  method set_autoexpand : bool -> unit
  (** Sets whether the model should autoexpand.

      If set to [TRUE], the model will recursively expand all rows that get
      added to the model. This can be either rows added by changes to the
      underlying models or via [Gtk.TreeListRow.set_expanded]. *)

  method item_type : Gobject.Type.t
  method n_items : int
  method as_tree_list_model : Raw.Tree_list_model.t
end

(* High-level class for TreeListModel *)
class tree_list_model (obj : Raw.Tree_list_model.t) : tree_list_model_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_autoexpand : unit -> bool =
      fun () -> Raw.Tree_list_model.get_autoexpand obj

    method get_child_row : int -> Tree_list_row.tree_list_row_t option =
      fun position ->
        Option.map
          (fun ret -> new Tree_list_row.tree_list_row ret)
          (Raw.Tree_list_model.get_child_row obj position)

    method get_model : unit -> Ocgio.List_model.list_model_t =
      fun () ->
        new Ocgio.List_model.list_model (Raw.Tree_list_model.get_model obj)

    method get_passthrough : unit -> bool =
      fun () -> Raw.Tree_list_model.get_passthrough obj

    method get_row : int -> Tree_list_row.tree_list_row_t option =
      fun position ->
        Option.map
          (fun ret -> new Tree_list_row.tree_list_row ret)
          (Raw.Tree_list_model.get_row obj position)

    method set_autoexpand : bool -> unit =
      fun autoexpand -> Raw.Tree_list_model.set_autoexpand obj autoexpand

    method item_type = Raw.Tree_list_model.get_item_type obj
    method n_items = Raw.Tree_list_model.get_n_items obj
    method as_tree_list_model = obj
  end
