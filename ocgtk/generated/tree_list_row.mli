(** The type of item used by [GtkTreeListModel].

    Its methods, signals and properties are on {!class-type-tree_list_row_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Tree_list_row}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TreeListRow].}

    The type of item used by [GtkTreeListModel].

    It allows navigating the model as a tree and modify the state of rows.

    [GtkTreeListRow] instances are created by a [GtkTreeListModel] only when the
    [Gtk.TreeListModel:passthrough] property is not set.

    There are various support objects that can make use of [GtkTreeListRow]
    objects, such as the
    {{!Ocgtk.Tree_expander.class-type-tree_expander_t}[Gtk.TreeExpander]} widget
    that allows displaying an icon to expand or collapse a row or
    {{!Ocgtk.Tree_list_row_sorter.class-type-tree_list_row_sorter_t}[Gtk.TreeListRowSorter]}
    that makes it possible to sort trees properly. *)
class type tree_list_row_t = object
  (** {2:methods Methods} *)

  method get_child_row : int -> tree_list_row_t option
  (** If [self] is not expanded or [position] is greater than the number of
      children, [None] is returned. *)

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

      If [self] is a row corresponding to the root model, [None] is returned.

      The value returned by this function never changes until the row is removed
      from its model at which point it will forever return [None]. *)

  method get_position : unit -> int
  (** Returns the position in the [GtkTreeListModel] that [self] occupies at the
      moment. *)

  method is_expandable : unit -> bool
  (** Checks if a row can be expanded.

      This does not mean that the row is actually expanded, this can be checked
      with [Gtk.TreeListRow.get_expanded].

      If a row is expandable never changes until the row is removed from its
      model at which point it will forever return [false]. *)

  method set_expanded : bool -> unit
  (** Expands or collapses a row.

      If a row is expanded, the model of calling the
      [Gtk.TreeListModelCreateModelFunc] for the row's item will be inserted
      after this row. If a row is collapsed, those items will be removed from
      the model.

      If the row is not expandable, this function does nothing. *)

  (** {2:conversions Conversions} *)

  method as_tree_list_row : Raw.Tree_list_row.t
end

class tree_list_row : Raw.Tree_list_row.t -> tree_list_row_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_list_row.t}. *)

(** {1:description Description}

    The type of item used by [GtkTreeListModel].

    It allows navigating the model as a tree and modify the state of rows.

    [GtkTreeListRow] instances are created by a [GtkTreeListModel] only when the
    [Gtk.TreeListModel:passthrough] property is not set.

    There are various support objects that can make use of [GtkTreeListRow]
    objects, such as the
    {{!Ocgtk.Tree_expander.class-type-tree_expander_t}[Gtk.TreeExpander]} widget
    that allows displaying an icon to expand or collapse a row or
    {{!Ocgtk.Tree_list_row_sorter.class-type-tree_list_row_sorter_t}[Gtk.TreeListRowSorter]}
    that makes it possible to sort trees properly. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
