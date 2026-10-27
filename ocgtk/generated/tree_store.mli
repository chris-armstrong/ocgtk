[@@@ocaml.text
"A tree-like data structure that can be used with the [Gtk.TreeView].\n\n\
 The [GtkTreeStore] object is a list model for use with a [GtkTreeView]\n\
 widget. It implements the [Gtk.TreeModel] interface, and consequently,\n\
 can use all of the methods available there. It also implements the\n\
 [Gtk.TreeSortable] interface so it can be sorted by the view.\n\
 Finally, it also implements the tree \\[drag\\][Gtk.TreeDragSource]\n\
 and \\[drop\\][Gtk.TreeDragDest] interfaces.\n\n\
 [GtkTreeStore] is deprecated since GTK 4.10, and should not be used in newly\n\
 written code. You should use [Gtk.TreeListModel] for a tree-like model\n\
 object.\n\n\
 {b GtkTreeStore as GtkBuildable}\n\n\
 The GtkTreeStore implementation of the [GtkBuildable] interface allows\n\
 to specify the model columns with a [<columns>] element that may contain\n\
 multiple [<column>] elements, each specifying one model column. The “type”\n\
 attribute specifies the data type for the column.\n\n\
 An example of a UI Definition fragment for a tree store:\n\n\
 {[\n\
 <object class=\"GtkTreeStore\">\n\
\  <columns>\n\
\    <column type=\"gchararray\"/>\n\
\    <column type=\"gchararray\"/>\n\
\    <column type=\"gint\"/>\n\
\  </columns>\n\
 </object>\n\
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-tree_store_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Tree_store}."]

(** The methods, signals and properties of a [GtkTreeStore]. *)
class type tree_store_t = object
  inherit Buildable.buildable_t
  inherit Tree_drag_dest.tree_drag_dest_t
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t
  method clear : unit -> unit
  method is_ancestor : Raw.Tree_iter.t -> Raw.Tree_iter.t -> bool
  method iter_depth : Raw.Tree_iter.t -> int
  method iter_is_valid : Raw.Tree_iter.t -> bool
  method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  method remove : Raw.Tree_iter.t -> bool
  method set_column_types : int -> Gobject.Type.t array -> unit
  method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit

  method set_valuesv :
    Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit

  method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit
  method as_tree_store : Raw.Tree_store.t
end

class tree_store : Raw.Tree_store.t -> tree_store_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_store.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreeStore], give one already wrapped. *)

val newv : int -> Gobject.Type.t array -> tree_store_t
