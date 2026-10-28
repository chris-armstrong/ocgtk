class type tree_list_row_t = object
  method get_child_row : int -> tree_list_row_t option
  (** If [self] is not expanded or [position] is greater than the number of
      children, [NULL] is returned. *)

  method get_children : unit -> Ocgio.List_model.list_model_t option
  (** If the row is expanded, gets the model holding the children of [self].

      This model is the model created by the [Gtk.TreeListModelCreateModelFunc]
      and contains the original items, no matter what value
      [Gtk.TreeListModel:passthrough] is set to. *)

  method get_depth : unit -> int
  (** Gets the depth of this row.

      Rows that correspond to items in the root model have a depth of zero, rows
      corresponding to items of models of direct children of the root model have
      a depth of 1 and so on.

      The depth of a row never changes until the row is removed from its model
      at which point it will forever return 0. *)

  method get_expanded : unit -> bool
  (** Gets if a row is currently expanded. *)

  method get_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the item corresponding to this row, *)

  method get_parent : unit -> tree_list_row_t option
  (** Gets the row representing the parent for [self].

      That is the row that would need to be collapsed to make this row
      disappear.

      If [self] is a row corresponding to the root model, [NULL] is returned.

      The value returned by this function never changes until the row is removed
      from its model at which point it will forever return [NULL]. *)

  method get_position : unit -> int
  (** Returns the position in the [GtkTreeListModel] that [self] occupies at the
      moment. *)

  method is_expandable : unit -> bool
  (** Checks if a row can be expanded.

      This does not mean that the row is actually expanded, this can be checked
      with [Gtk.TreeListRow.get_expanded].

      If a row is expandable never changes until the row is removed from its
      model at which point it will forever return [FALSE]. *)

  method set_expanded : bool -> unit
  (** Expands or collapses a row.

      If a row is expanded, the model of calling the
      [Gtk.TreeListModelCreateModelFunc] for the row's item will be inserted
      after this row. If a row is collapsed, those items will be removed from
      the model.

      If the row is not expandable, this function does nothing. *)

  method as_tree_list_row : Raw.Tree_list_row.t
end

(* High-level class for TreeListRow *)
class tree_list_row (obj : Raw.Tree_list_row.t) : tree_list_row_t =
  object (self)
    method get_child_row : int -> tree_list_row_t option =
      fun position ->
        Option.map
          (fun ret -> new tree_list_row ret)
          (Raw.Tree_list_row.get_child_row obj position)

    method get_children : unit -> Ocgio.List_model.list_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.List_model.list_model ret)
          (Raw.Tree_list_row.get_children obj)

    method get_depth : unit -> int = fun () -> Raw.Tree_list_row.get_depth obj

    method get_expanded : unit -> bool =
      fun () -> Raw.Tree_list_row.get_expanded obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Tree_list_row.get_item obj

    method get_parent : unit -> tree_list_row_t option =
      fun () ->
        Option.map
          (fun ret -> new tree_list_row ret)
          (Raw.Tree_list_row.get_parent obj)

    method get_position : unit -> int =
      fun () -> Raw.Tree_list_row.get_position obj

    method is_expandable : unit -> bool =
      fun () -> Raw.Tree_list_row.is_expandable obj

    method set_expanded : bool -> unit =
      fun expanded -> Raw.Tree_list_row.set_expanded obj expanded

    method as_tree_list_row = obj
  end
