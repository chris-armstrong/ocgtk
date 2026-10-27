(** The interface for sortable models used by GtkTreeView

    [GtkTreeSortable] is an interface to be implemented by tree models which
    support sorting. The [GtkTreeView] uses the methods provided by this
    interface to sort the model.

    Its methods, signals and properties are on {!class-type-tree_sortable_t}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_sortable}. *)

(** The methods, signals and properties of a [GtkTreeSortable]. *)
class type tree_sortable_t = object
  method on_sort_column_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method has_default_sort_func : unit -> bool
  method set_sort_column_id : int -> Enums.sorttype -> unit
  method sort_column_changed : unit -> unit
  method as_tree_sortable : Raw.Tree_sortable.t
end

class tree_sortable : Raw.Tree_sortable.t -> tree_sortable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_sortable.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreeSortable], give one already wrapped. *)
