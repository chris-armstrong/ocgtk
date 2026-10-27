(** A visible column in a [Gtk.TreeView] widget

    The [GtkTreeViewColumn] object represents a visible column in a
    [GtkTreeView] widget. It allows to set properties of the column header, and
    functions as a holding pen for the cell renderers which determine how the
    data in the column is displayed.

    Please refer to the tree widget conceptual overview for an overview of all
    the objects and data types related to the tree widget and how they work
    together, and to the [Gtk.TreeView] documentation for specifics about the
    CSS node structure for treeviews and their headers.

    Its methods, signals and properties are on {!class-type-tree_view_column_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Tree_view_column}. *)

(** The methods, signals and properties of a [GtkTreeViewColumn]. *)
class type tree_view_column_t = object
  inherit Buildable.buildable_t
  inherit Cell_area_and__cell_area_context_and__cell_layout.cell_layout_t

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method cell_is_visible : unit -> bool
  (** Returns [TRUE] if any of the cells packed into the [tree_column] are
      visible. For this to be meaningful, you must first initialize the cells
      with gtk_tree_view_column_cell_set_cell_data() *)

  method cell_set_cell_data :
    Tree_model.tree_model_t -> Raw.Tree_iter.t -> bool -> bool -> unit
  (** Sets the cell renderer based on the [tree_model] and [iter]. That is, for
      every attribute mapping in [tree_column], it will get a value from the set
      column on the [iter], and use that value to set the attribute on the cell
      renderer. This is used primarily by the [GtkTreeView]. *)

  method clicked : unit -> unit
  (** Emits the “clicked” signal on the column. This function will only work if
      [tree_column] is clickable. *)

  method focus_cell : Cell_renderer.cell_renderer_t -> unit
  (** Sets the current keyboard focus to be at [cell], if the column contains 2
      or more editable and activatable cells. *)

  method get_alignment : unit -> float
  (** Returns the current x alignment of [tree_column]. This value can range
      between 0.0 and 1.0. *)

  method get_button :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the button used in the treeview column header *)

  method get_clickable : unit -> bool
  (** Returns [TRUE] if the user can click on the header for the column. *)

  method get_expand : unit -> bool
  (** Returns [TRUE] if the column expands to fill available space. *)

  method get_fixed_width : unit -> int
  (** Gets the fixed width of the column. This may not be the actual displayed
      width of the column; for that, use gtk_tree_view_column_get_width(). *)

  method get_max_width : unit -> int
  (** Returns the maximum width in pixels of the [tree_column], or -1 if no
      maximum width is set. *)

  method get_min_width : unit -> int
  (** Returns the minimum width in pixels of the [tree_column], or -1 if no
      minimum width is set. *)

  method get_reorderable : unit -> bool
  (** Returns [TRUE] if the [tree_column] can be reordered by the user. *)

  method get_resizable : unit -> bool
  (** Returns [TRUE] if the [tree_column] can be resized by the end user. *)

  method get_sizing : unit -> Enums.treeviewcolumnsizing
  (** Returns the current type of [tree_column]. *)

  method get_sort_column_id : unit -> int
  (** Gets the logical [sort_column_id] that the model sorts on when this column
      is selected for sorting.

      See [Gtk.TreeViewColumn.set_sort_column_id]. *)

  method get_sort_indicator : unit -> bool
  (** Gets the value set by gtk_tree_view_column_set_sort_indicator(). *)

  method get_sort_order : unit -> Enums.sorttype
  (** Gets the value set by gtk_tree_view_column_set_sort_order(). *)

  method get_spacing : unit -> int
  (** Returns the spacing of [tree_column]. *)

  method get_title : unit -> string
  (** Returns the title of the widget. *)

  method get_tree_view :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the [GtkTreeView] wherein [tree_column] has been inserted. If
      [column] is currently not inserted in any tree view, [NULL] is returned.
  *)

  method get_visible : unit -> bool
  (** Returns [TRUE] if [tree_column] is visible. *)

  method get_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the [GtkWidget] in the button on the column header.

      If a custom widget has not been set then [NULL] is returned. *)

  method get_width : unit -> int
  (** Returns the current size of [tree_column] in pixels. *)

  method get_x_offset : unit -> int
  (** Returns the current X offset of [tree_column] in pixels. *)

  method queue_resize : unit -> unit
  (** Flags the column, and the cell renderers added to this column, to have
      their sizes renegotiated. *)

  method set_alignment : float -> unit
  (** Sets the alignment of the title or custom widget inside the column header.
      The alignment determines its location inside the button -- 0.0 for left,
      0.5 for center, 1.0 for right. *)

  method set_clickable : bool -> unit
  (** Sets the header to be active if [clickable] is [TRUE]. When the header is
      active, then it can take keyboard focus, and can be clicked. *)

  method set_expand : bool -> unit
  (** Sets the column to take available extra space. This space is shared
      equally amongst all columns that have the expand set to [TRUE]. If no
      column has this option set, then the last column gets all extra space. By
      default, every column is created with this [FALSE].

      Along with “fixed-width”, the “expand” property changes when the column is
      resized by the user. *)

  method set_fixed_width : int -> unit
  (** If [fixed_width] is not -1, sets the fixed width of [tree_column];
      otherwise unsets it. The effective value of [fixed_width] is clamped
      between the minimum and maximum width of the column; however, the value
      stored in the “fixed-width” property is not clamped. If the column sizing
      is [GTK_TREE_VIEW_COLUMN_GROW_ONLY] or [GTK_TREE_VIEW_COLUMN_AUTOSIZE],
      setting a fixed width overrides the automatically calculated width. Note
      that [fixed_width] is only a hint to GTK; the width actually allocated to
      the column may be greater or less than requested.

      Along with “expand”, the “fixed-width” property changes when the column is
      resized by the user. *)

  method set_max_width : int -> unit
  (** Sets the maximum width of the [tree_column]. If [max_width] is -1, then
      the maximum width is unset. Note, the column can actually be wider than
      max width if it’s the last column in a view. In this case, the column
      expands to fill any extra space. *)

  method set_min_width : int -> unit
  (** Sets the minimum width of the [tree_column]. If [min_width] is -1, then
      the minimum width is unset. *)

  method set_reorderable : bool -> unit
  (** If [reorderable] is [TRUE], then the column can be reordered by the end
      user dragging the header. *)

  method set_resizable : bool -> unit
  (** If [resizable] is [TRUE], then the user can explicitly resize the column
      by grabbing the outer edge of the column button.

      If resizable is [TRUE] and sizing mode of the column is
      [GTK_TREE_VIEW_COLUMN_AUTOSIZE], then the sizing mode is changed to
      [GTK_TREE_VIEW_COLUMN_GROW_ONLY]. *)

  method set_sizing : Enums.treeviewcolumnsizing -> unit
  (** Sets the growth behavior of [tree_column] to [type]. *)

  method set_sort_column_id : int -> unit
  (** Sets the logical [sort_column_id] that this column sorts on when this
      column is selected for sorting. Doing so makes the column header
      clickable. *)

  method set_sort_indicator : bool -> unit
  (** Call this function with a [setting] of [TRUE] to display an arrow in the
      header button indicating the column is sorted. Call
      gtk_tree_view_column_set_sort_order() to change the direction of the
      arrow. *)

  method set_sort_order : Enums.sorttype -> unit
  (** Changes the appearance of the sort indicator.

      This does not actually sort the model. Use
      gtk_tree_view_column_set_sort_column_id() if you want automatic sorting
      support. This function is primarily for custom sorting behavior, and
      should be used in conjunction with gtk_tree_sortable_set_sort_column_id()
      to do that. For custom models, the mechanism will vary.

      The sort indicator changes direction to indicate normal sort or reverse
      sort. Note that you must have the sort indicator enabled to see anything
      when calling this function; see gtk_tree_view_column_set_sort_indicator().
  *)

  method set_spacing : int -> unit
  (** Sets the spacing field of [tree_column], which is the number of pixels to
      place between cell renderers packed into it. *)

  method set_title : string -> unit
  (** Sets the title of the [tree_column]. If a custom widget has been set, then
      this value is ignored. *)

  method set_visible : bool -> unit
  (** Sets the visibility of [tree_column]. *)

  method set_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the widget in the header to be [widget]. If widget is [NULL], then
      the header button is set with a [GtkLabel] set to the title of
      [tree_column]. *)

  method cell_area :
    Cell_area_and__cell_area_context_and__cell_layout.cell_area_t

  method as_tree_view_column : Raw.Tree_view_column.t
end

class tree_view_column : Raw.Tree_view_column.t -> tree_view_column_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_view_column.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeViewColumn], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> tree_view_column_t
(** Creates a new [GtkTreeViewColumn]. *)

val new_with_area :
  Cell_area_and__cell_area_context_and__cell_layout.cell_area_t ->
  tree_view_column_t
(** Creates a new [GtkTreeViewColumn] using [area] to render its cells. *)
