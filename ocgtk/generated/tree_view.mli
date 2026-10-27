(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TreeView from cyclic group Tree_selection_and__tree_view *)

[@@@ocaml.text
"A widget for displaying both trees and lists\n\n\
 An example GtkTreeView\n\n\
 Widget that displays any object that implements the [Gtk.TreeModel] \
 interface.\n\n\
 Please refer to the tree widget conceptual overview\n\
 for an overview of all the objects and data types related to the tree\n\
 widget and how they work together.\n\n\
 {b Coordinate systems in GtkTreeView API}\n\n\
 Several different coordinate systems are exposed in the [GtkTreeView] API.\n\
 These are:\n\n\
 - Widget coordinates: Coordinates relative to the widget (usually \
 [widget->window]).\n\n\
 - Bin window coordinates: Coordinates relative to the window that GtkTreeView \
 renders to.\n\n\
 - Tree coordinates: Coordinates relative to the entire scrollable area of \
 GtkTreeView. These\n\
 coordinates start at (0, 0) for row 0 of the tree.\n\n\
 Several functions are available for converting between the different\n\
 coordinate systems.  The most common translations are between widget and bin\n\
 window coordinates and between bin window and tree coordinates. For the\n\
 former you can use [Gtk.TreeView.convert_widget_to_bin_window_coords]\n\
 (and vice versa), for the latter \
 [Gtk.TreeView.convert_bin_window_to_tree_coords]\n\
 (and vice versa).\n\n\
 {b [GtkTreeView] as [GtkBuildable]}\n\n\
 The [GtkTreeView] implementation of the [GtkBuildable] interface accepts\n\
 [Gtk.TreeViewColumn] objects as [<child>] elements and exposes the\n\
 internal [Gtk.TreeSelection] in UI definitions.\n\n\
 An example of a UI definition fragment with [GtkTreeView]:\n\n\
 {[\n\
 <object class=\"GtkTreeView\" id=\"treeview\">\n\
\  <property name=\"model\">liststore1</property>\n\
\  <child>\n\
\    <object class=\"GtkTreeViewColumn\" id=\"test-column\">\n\
\      <property name=\"title\">Test</property>\n\
\      <child>\n\
\        <object class=\"GtkCellRendererText\" id=\"test-renderer\"/>\n\
\        <attributes>\n\
\          <attribute name=\"text\">1</attribute>\n\
\        </attributes>\n\
\      </child>\n\
\    </object>\n\
\  </child>\n\
\  <child internal-child=\"selection\">\n\
\    <object class=\"GtkTreeSelection\" id=\"selection\">\n\
\      <signal name=\"changed\" handler=\"on_treeview_selection_changed\"/>\n\
\    </object>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 treeview.view\n\
 ├── header\n\
 │   ├── button\n\
 │   │   ╰── [sort-indicator]\n\
 ┊   ┊\n\
 │   ╰── button\n\
 │       ╰── [sort-indicator]\n\
 │\n\
 ├── [rubberband]\n\
 ╰── [dndtarget]\n\
 ]}\n\n\
 [GtkTreeView] has a main CSS node with name [treeview] and style class [.view].\n\
 It has a subnode with name [header], which is the parent for all the column\n\
 header widgets' CSS nodes.\n\n\
 Each column header consists of a [button], which among other content, has a\n\
 child with name [sort-indicator], which carries the [.ascending] or \
 [.descending]\n\
 style classes when the column header should show a sort indicator. The CSS\n\
 is expected to provide a suitable image using the [-gtk-icon-source] \
 property.\n\n\
 For rubberband selection, a subnode with name [rubberband] is used.\n\n\
 For the drop target location during DND, a subnode with name [dndtarget] is \
 used.\n\n\
 Its methods, signals and properties are on {!class-type-tree_view_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Tree_view}."]

class type tree_view_t = Tree_selection_and__tree_view.tree_view_t
(** The methods, signals and properties of a [GtkTreeView]. *)

class tree_view : Raw.Tree_view.t -> tree_view_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_view.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreeView], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> tree_view_t
(** Creates a new [GtkTreeView] widget. *)

val new_with_model : Tree_model.tree_model_t -> tree_view_t
(** Creates a new [GtkTreeView] widget with the model initialized to [model]. *)
