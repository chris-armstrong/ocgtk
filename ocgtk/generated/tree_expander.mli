[@@@ocaml.text
"Provides an expander for a tree-like list.\n\n\
 It is typically placed as a bottommost child into a [GtkListView]\n\
 to allow users to expand and collapse children in a list with a\n\
 [Gtk.TreeListModel]. [GtkTreeExpander] provides the common UI\n\
 elements, gestures and keybindings for this purpose.\n\n\
 On top of this, the \"listitem.expand\", \"listitem.collapse\" and\n\
 \"listitem.toggle-expand\" actions are provided to allow adding custom\n\
 UI for managing expanded state.\n\n\
 It is important to mention that you want to set the\n\
 [Gtk.ListItem:focusable] property to FALSE when using this\n\
 widget, as you want the keyboard focus to be in the treexpander, and not\n\
 inside the list to make use of the keybindings.\n\n\
 The [GtkTreeListModel] must be set to not be passthrough. Then it\n\
 will provide [Gtk.TreeListRow] items which can be set via\n\
 [Gtk.TreeExpander.set_list_row] on the expander.\n\
 The expander will then watch that row item automatically.\n\
 [Gtk.TreeExpander.set_child] sets the widget that displays\n\
 the actual row contents.\n\n\
 [GtkTreeExpander] can be modified with properties such as\n\
 [Gtk.TreeExpander:indent-for-icon],\n\
 [Gtk.TreeExpander:indent-for-depth], and\n\
 [Gtk.TreeExpander:hide-expander] to achieve a different appearance.\n\
 This can even be done to influence individual rows, for example by binding\n\
 the [Gtk.TreeExpander:hide-expander] property to the item count of\n\
 the model of the treelistrow, to hide the expander for rows without children,\n\
 even if the row is expandable.\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkTreeExpander] supports the following keyboard shortcuts:\n\n\
 - <kbd>+</kbd> or <kbd>*</kbd> expands the expander.\n\
 - <kbd>-</kbd> or <kbd>/</kbd> collapses the expander.\n\
 - Left and right arrow keys, when combined with <kbd>Shift</kbd> or\n\
 <kbd>Ctrl</kbd>+<kbd>Shift</kbd>, will expand or collapse, depending on\n\
 the locale's text direction.\n\
 - <kbd>Ctrl</kbd>+<kbd>␣</kbd> toggles the expander state.\n\n\
 The row can also expand on drag gestures.\n\n\
 {b Actions}\n\n\
 [GtkTreeExpander] defines a set of built-in actions:\n\n\
 - [listitem.expand] expands the expander if it can be expanded.\n\
 - [listitem.collapse] collapses the expander.\n\
 - [listitem.toggle-expand] tries to expand the expander if it was collapsed\n\
 or collapses it if it was expanded.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 treeexpander\n\
 ├── [indent]*\n\
 ├── [expander]\n\
 ╰── <child>\n\
 ]}\n\n\
 [GtkTreeExpander] has zero or one CSS nodes with the name \"expander\" that\n\
 should display the expander icon. The node will be [:checked] when it\n\
 is expanded. If the node is not expandable, an \"indent\" node will be\n\
 displayed instead.\n\n\
 For every level of depth, another \"indent\" node is prepended.\n\n\
 {b Accessibility}\n\n\
 Until GTK 4.10, [GtkTreeExpander] used the [Gtk.AccessibleRole.group] role.\n\n\
 Since GTK 4.12, [GtkTreeExpander] uses the [Gtk.AccessibleRole.button] role.\n\
 Toggling it will change the [GTK_ACCESSIBLE_STATE_EXPANDED] state.\n\n\
 Its methods, signals and properties are on {!class-type-tree_expander_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Tree_expander}."]

(** The methods, signals and properties of a [GtkTreeExpander]. *)
class type tree_expander_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hide_expander : unit -> bool
  method get_indent_for_depth : unit -> bool
  method get_indent_for_icon : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_list_row : unit -> Tree_list_row.tree_list_row_t option

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_hide_expander : bool -> unit
  method set_indent_for_depth : bool -> unit
  method set_indent_for_icon : bool -> unit
  method set_list_row : Tree_list_row.tree_list_row_t option -> unit
  method as_tree_expander : Raw.Tree_expander.t
end

class tree_expander : Raw.Tree_expander.t -> tree_expander_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_expander.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkTreeExpander], give one already wrapped. *)

val new_ : unit -> tree_expander_t
