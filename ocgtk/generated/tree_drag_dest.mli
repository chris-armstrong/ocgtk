(** Interface for Drag-and-Drop destinations in [GtkTreeView].

    Its methods, signals and properties are on {!class-type-tree_drag_dest_t}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_drag_dest}. *)

(** The methods, signals and properties of a [GtkTreeDragDest]. *)
class type tree_drag_dest_t = object
  method drag_data_received : Raw.Tree_path.t -> Gobject.Value.t -> bool
  method row_drop_possible : Raw.Tree_path.t -> Gobject.Value.t -> bool
  method as_tree_drag_dest : Raw.Tree_drag_dest.t
end

class tree_drag_dest : Raw.Tree_drag_dest.t -> tree_drag_dest_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_drag_dest.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeDragDest], give one already wrapped. *)
