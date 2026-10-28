(** A tree-like data structure that can be used with the [Gtk.TreeView].

    Its methods, signals and properties are on {!class-type-tree_store_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Tree_store}. *)

(** {1:class Class} *)

class type tree_store_t = object
  inherit Buildable.buildable_t
  inherit Tree_drag_dest.tree_drag_dest_t
  inherit Tree_drag_source.tree_drag_source_t
  inherit Tree_model.tree_model_t
  inherit Tree_sortable.tree_sortable_t

  method clear : unit -> unit
  (** Removes all rows from [tree_store] *)

  method is_ancestor : Raw.Tree_iter.t -> Raw.Tree_iter.t -> bool
  (** Checks if [iter] is an ancestor of [descendant]. *)

  method iter_depth : Raw.Tree_iter.t -> int
  (** Returns the depth of the position pointed by the iterator

      The depth will be 0 for anything on the root level, 1 for anything down a
      level, etc. *)

  method iter_is_valid : Raw.Tree_iter.t -> bool
  (** Checks if the given iter is a valid iter for this [GtkTreeStore].

      This function is slow. Only use it for debugging and/or testing purposes.
  *)

  method move_after : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  (** Moves [iter] in [tree_store] to the position after [position].

      [iter] and [position] should be in the same level.

      Note that this function only works with unsorted stores.

      If [position] is [NULL], [iter] will be moved to the start of the level.
  *)

  method move_before : Raw.Tree_iter.t -> Raw.Tree_iter.t option -> unit
  (** Moves [iter] in [tree_store] to the position before [position].

      [iter] and [position] should be in the same level.

      Note that this function only works with unsorted stores.

      If [position] is [NULL], [iter] will be moved to the end of the level. *)

  method remove : Raw.Tree_iter.t -> bool
  (** Removes [iter] from [tree_store].

      After being removed, [iter] is set to the next valid row at that level, or
      invalidated if it previously pointed to the last one. *)

  method set_column_types : int -> Gobject.Type.t array -> unit
  (** Sets the type of the columns in a tree store.

      This function is meant primarily for types that inherit from
      [GtkTreeStore], and should only be used when constructing a new
      [GtkTreeStore].

      This functions cannot be called after a row has been added, or a method on
      the [GtkTreeModel] interface is called on the tree store. *)

  method set_value : Raw.Tree_iter.t -> int -> Gobject.Value.t -> unit
  (** Sets the data in the cell specified by [iter] and [column].

      The type of [value] must be convertible to the type of the column. *)

  method set_valuesv :
    Raw.Tree_iter.t -> int array -> Gobject.Value.t array -> int -> unit
  (** A variant of gtk_tree_store_set_valist() which takes the columns and
      values as two arrays, instead of using variadic arguments.

      This function is mainly intended for language bindings or in case the
      number of columns to change is not known until run-time. *)

  method swap : Raw.Tree_iter.t -> Raw.Tree_iter.t -> unit
  (** Swaps [a] and [b] in the same level of [tree_store].

      Note that this function only works with unsorted stores. *)

  method as_tree_store : Raw.Tree_store.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [TreeStore].}\n\n\
     A tree-like data structure that can be used with the [Gtk.TreeView].\n\n\
     The [GtkTreeStore] object is a list model for use with a [GtkTreeView]\n\
     widget. It implements the [Gtk.TreeModel] interface, and consequently,\n\
     can use all of the methods available there. It also implements the\n\
     [Gtk.TreeSortable] interface so it can be sorted by the view.\n\
     Finally, it also implements the tree \\[drag\\][Gtk.TreeDragSource]\n\
     and \\[drop\\][Gtk.TreeDragDest] interfaces.\n\n\
     [GtkTreeStore] is deprecated since GTK 4.10, and should not be used in \
     newly\n\
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
     ]}"]

class tree_store : Raw.Tree_store.t -> tree_store_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_store.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 A tree-like data structure that can be used with the [Gtk.TreeView].\n\n\
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
 ]}"]

(** {1:constructors Constructors} *)

val newv : int -> Gobject.Type.t array -> tree_store_t
(** Creates a new tree store.

    This constructor is meant for language bindings. *)
