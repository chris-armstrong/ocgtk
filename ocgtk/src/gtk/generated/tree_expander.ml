(* GENERATED CODE - DO NOT EDIT *)
(* TreeExpander: TreeExpander *)

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
 Toggling it will change the [GTK_ACCESSIBLE_STATE_EXPANDED] state."]

type t =
  [ `tree_expander | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_tree_expander_new"
(** Create a new TreeExpander *)

(* Methods *)

external set_list_row : t -> Tree_list_row.t option -> unit
  = "ml_gtk_tree_expander_set_list_row"
(** Sets the tree list row that this expander should manage. *)

external set_indent_for_icon : t -> bool -> unit
  = "ml_gtk_tree_expander_set_indent_for_icon"
(** Sets if the TreeExpander should indent the child by the width of an
    expander-icon when it is not expandable. *)

external set_indent_for_depth : t -> bool -> unit
  = "ml_gtk_tree_expander_set_indent_for_depth"
(** Sets if the TreeExpander should indent the child according to its depth. *)

external set_hide_expander : t -> bool -> unit
  = "ml_gtk_tree_expander_set_hide_expander"
(** Sets whether the expander icon should be visible in a GtkTreeListRow. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_tree_expander_set_child"
(** Sets the content widget to display. *)

external get_list_row : t -> Tree_list_row.t option
  = "ml_gtk_tree_expander_get_list_row"
(** Gets the list row managed by [self]. *)

external get_item : t -> [ `object_ ] Gobject.obj option
  = "ml_gtk_tree_expander_get_item"
(** Forwards the item set on the [GtkTreeListRow] that [self] is managing.

    This call is essentially equivalent to calling:

    {[
    gtk_tree_list_row_get_item (gtk_tree_expander_get_list_row (@self));
    ]} *)

external get_indent_for_icon : t -> bool
  = "ml_gtk_tree_expander_get_indent_for_icon"
(** TreeExpander indents the child by the width of an expander-icon if it is not
    expandable. *)

external get_indent_for_depth : t -> bool
  = "ml_gtk_tree_expander_get_indent_for_depth"
(** TreeExpander indents each level of depth with an additional indent. *)

external get_hide_expander : t -> bool
  = "ml_gtk_tree_expander_get_hide_expander"
(** Gets whether the TreeExpander should be hidden in a GtkTreeListRow. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_tree_expander_get_child"
(** Gets the child widget displayed by [self]. *)

(* Properties *)
