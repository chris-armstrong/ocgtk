(** The type of item used by [GtkTreeListModel].

    It allows navigating the model as a tree and modify the state of rows.

    [GtkTreeListRow] instances are created by a [GtkTreeListModel] only when the
    [Gtk.TreeListModel:passthrough] property is not set.

    There are various support objects that can make use of [GtkTreeListRow]
    objects, such as the [Gtk.TreeExpander] widget that allows displaying an
    icon to expand or collapse a row or [Gtk.TreeListRowSorter] that makes it
    possible to sort trees properly.

    Its methods, signals and properties are on {!class-type-tree_list_row_t}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_list_row}. *)

(** The methods, signals and properties of a [GtkTreeListRow]. *)
class type tree_list_row_t = object
  method get_child_row : int -> tree_list_row_t option
  method get_children : unit -> Ocgio.List_model.list_model_t option
  method get_depth : unit -> int
  method get_expanded : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_parent : unit -> tree_list_row_t option
  method get_position : unit -> int
  method is_expandable : unit -> bool
  method set_expanded : bool -> unit
  method as_tree_list_row : Raw.Tree_list_row.t
end

class tree_list_row : Raw.Tree_list_row.t -> tree_list_row_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_list_row.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreeListRow], give one already wrapped. *)
