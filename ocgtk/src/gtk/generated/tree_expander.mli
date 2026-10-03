(* GENERATED CODE - DO NOT EDIT *)
(* TreeExpander: TreeExpander *)

type t =
  [ `tree_expander | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Provides an expander for a tree-like list.

    It is typically placed as a bottommost child into a [GtkListView] to allow
    users to expand and collapse children in a list with a [Gtk.TreeListModel].
    [GtkTreeExpander] provides the common UI elements, gestures and keybindings
    for this purpose.

    On top of this, the “listitem.expand”, “listitem.collapse” and
    “listitem.toggle-expand” actions are provided to allow adding custom UI for
    managing expanded state.

    It is important to mention that you want to set the [Gtk.ListItem:focusable]
    property to FALSE when using this widget, as you want the keyboard focus to
    be in the treexpander, and not inside the list to make use of the
    keybindings.

    The [GtkTreeListModel] must be set to not be passthrough. Then it will
    provide [Gtk.TreeListRow] items which can be set via
    [Gtk.TreeExpander.set_list_row] on the expander. The expander will then
    watch that row item automatically. [Gtk.TreeExpander.set_child] sets the
    widget that displays the actual row contents.

    [GtkTreeExpander] can be modified with properties such as
    [Gtk.TreeExpander:indent-for-icon], [Gtk.TreeExpander:indent-for-depth], and
    [Gtk.TreeExpander:hide-expander] to achieve a different appearance. This can
    even be done to influence individual rows, for example by binding the
    [Gtk.TreeExpander:hide-expander] property to the item count of the model of
    the treelistrow, to hide the expander for rows without children, even if the
    row is expandable.

    {b Shortcuts and Gestures}

    [GtkTreeExpander] supports the following keyboard shortcuts:

    - <kbd>+</kbd> or <kbd>*</kbd> expands the expander.
    - <kbd>-</kbd> or <kbd>/</kbd> collapses the expander.
    - Left and right arrow keys, when combined with <kbd>Shift</kbd> or
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>, will expand or collapse, depending on
      the locale's text direction.
    - <kbd>Ctrl</kbd>+<kbd>␣</kbd> toggles the expander state.

    The row can also expand on drag gestures.

    {b Actions}

    [GtkTreeExpander] defines a set of built-in actions:

    - [listitem.expand] expands the expander if it can be expanded.
    - [listitem.collapse] collapses the expander.
    - [listitem.toggle-expand] tries to expand the expander if it was collapsed
      or collapses it if it was expanded.

    {b CSS nodes}

    {[
    treeexpander
    ├── [indent]*
    ├── [expander]
    ╰── <child>
    ]}

    [GtkTreeExpander] has zero or one CSS nodes with the name “expander” that
    should display the expander icon. The node will be [:checked] when it is
    expanded. If the node is not expandable, an “indent” node will be displayed
    instead.

    For every level of depth, another “indent” node is prepended.

    {b Accessibility}

    Until GTK 4.10, [GtkTreeExpander] used the [Gtk.AccessibleRole.group] role.

    Since GTK 4.12, [GtkTreeExpander] uses the [Gtk.AccessibleRole.button] role.
    Toggling it will change the [GTK_ACCESSIBLE_STATE_EXPANDED] state. *)

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
