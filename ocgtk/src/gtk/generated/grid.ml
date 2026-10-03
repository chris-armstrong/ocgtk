(* GENERATED CODE - DO NOT EDIT *)
(* Grid: Grid *)

(** Arranges its child widgets in rows and columns.

    An example GtkGrid

    It supports arbitrary positions and horizontal/vertical spans.

    Children are added using [Gtk.Grid.attach]. They can span multiple rows or
    columns. It is also possible to add a child next to an existing child, using
    [Gtk.Grid.attach_next_to]. To remove a child from the grid, use
    [Gtk.Grid.remove].

    The behaviour of [GtkGrid] when several children occupy the same grid cell
    is undefined.

    {b GtkGrid as GtkBuildable}

    Every child in a [GtkGrid] has access to a custom [Gtk.Buildable] element,
    called [<layout>]. It can by used to specify a position in the grid and
    optionally spans. All properties that can be used in the [<layout>] element
    are implemented by [Gtk.GridLayoutChild].

    It is implemented by [GtkWidget] using [Gtk.LayoutManager].

    To showcase it, here is a simple example:

    {[
    <object class=”GtkGrid” id=”my_grid”>
      <child>
        <object class=”GtkButton” id=”button1”>
          <property name=”label”>Button 1</property>
          <layout>
            <property name=”column”>0</property>
            <property name=”row”>0</property>
          </layout>
        </object>
      </child>
      <child>
        <object class=”GtkButton” id=”button2”>
          <property name=”label”>Button 2</property>
          <layout>
            <property name=”column”>1</property>
            <property name=”row”>0</property>
          </layout>
        </object>
      </child>
      <child>
        <object class=”GtkButton” id=”button3”>
          <property name=”label”>Button 3</property>
          <layout>
            <property name=”column”>2</property>
            <property name=”row”>0</property>
            <property name=”row-span”>2</property>
          </layout>
        </object>
      </child>
      <child>
        <object class=”GtkButton” id=”button4”>
          <property name=”label”>Button 4</property>
          <layout>
            <property name=”column”>0</property>
            <property name=”row”>1</property>
            <property name=”column-span”>2</property>
          </layout>
        </object>
      </child>
    </object>
    ]}

    It organizes the first two buttons side-by-side in one cell each. The third
    button is in the last column but spans across two rows. This is defined by
    the [row-span] property. The last button is located in the second row and
    spans across two columns, which is defined by the [column-span] property.

    {b CSS nodes}

    [GtkGrid] uses a single CSS node with name [grid].

    {b Accessibility}

    Until GTK 4.10, [GtkGrid] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkGrid] uses the [Gtk.AccessibleRole.generic]
    role. *)

type t = [ `grid | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_grid_new"
(** Create a new Grid *)

(* Methods *)

external set_row_spacing : t -> int -> unit = "ml_gtk_grid_set_row_spacing"
(** Sets the amount of space between rows of [grid]. *)

external set_row_homogeneous : t -> bool -> unit
  = "ml_gtk_grid_set_row_homogeneous"
(** Sets whether all rows of [grid] will have the same height. *)

external set_row_baseline_position :
  t -> int -> Gtk_enums.baselineposition -> unit
  = "ml_gtk_grid_set_row_baseline_position"
(** Sets how the baseline should be positioned on [row] of the grid, in case
    that row is assigned more space than is requested.

    The default baseline position is [GTK_BASELINE_POSITION_CENTER]. *)

external set_column_spacing : t -> int -> unit
  = "ml_gtk_grid_set_column_spacing"
(** Sets the amount of space between columns of [grid]. *)

external set_column_homogeneous : t -> bool -> unit
  = "ml_gtk_grid_set_column_homogeneous"
(** Sets whether all columns of [grid] will have the same width. *)

external set_baseline_row : t -> int -> unit = "ml_gtk_grid_set_baseline_row"
(** Sets which row defines the global baseline for the entire grid.

    Each row in the grid can have its own local baseline, but only one of those
    is global, meaning it will be the baseline in the parent of the [grid]. *)

external remove_row : t -> int -> unit = "ml_gtk_grid_remove_row"
(** Removes a row from the grid.

    Children that are placed in this row are removed, spanning children that
    overlap this row have their height reduced by one, and children below the
    row are moved up. *)

external remove_column : t -> int -> unit = "ml_gtk_grid_remove_column"
(** Removes a column from the grid.

    Children that are placed in this column are removed, spanning children that
    overlap this column have their width reduced by one, and children after the
    column are moved to the left. *)

external remove :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  unit = "ml_gtk_grid_remove"
(** Removes a child from [grid].

    The child must have been added with [Gtk.Grid.attach] or
    [Gtk.Grid.attach_next_to]. *)

external query_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int * int * int * int = "ml_gtk_grid_query_child"
(** Queries the attach points and spans of [child] inside the given [GtkGrid].
*)

external insert_row : t -> int -> unit = "ml_gtk_grid_insert_row"
(** Inserts a row at the specified position.

    Children which are attached at or below this position are moved one row
    down. Children which span across this position are grown to span the new
    row. *)

external insert_next_to :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Gtk_enums.positiontype ->
  unit = "ml_gtk_grid_insert_next_to"
(** Inserts a row or column at the specified position.

    The new row or column is placed next to [sibling], on the side determined by
    [side]. If [side] is [GTK_POS_TOP] or [GTK_POS_BOTTOM], a row is inserted.
    If [side] is [GTK_POS_LEFT] of [GTK_POS_RIGHT], a column is inserted. *)

external insert_column : t -> int -> unit = "ml_gtk_grid_insert_column"
(** Inserts a column at the specified position.

    Children which are attached at or to the right of this position are moved
    one column to the right. Children which span across this position are grown
    to span the new column. *)

external get_row_spacing : t -> int = "ml_gtk_grid_get_row_spacing"
(** Returns the amount of space between the rows of [grid]. *)

external get_row_homogeneous : t -> bool = "ml_gtk_grid_get_row_homogeneous"
(** Returns whether all rows of [grid] have the same height. *)

external get_row_baseline_position : t -> int -> Gtk_enums.baselineposition
  = "ml_gtk_grid_get_row_baseline_position"
(** Returns the baseline position of [row].

    See [Gtk.Grid.set_row_baseline_position]. *)

external get_column_spacing : t -> int = "ml_gtk_grid_get_column_spacing"
(** Returns the amount of space between the columns of [grid]. *)

external get_column_homogeneous : t -> bool
  = "ml_gtk_grid_get_column_homogeneous"
(** Returns whether all columns of [grid] have the same width. *)

external get_child_at :
  t ->
  int ->
  int ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_grid_get_child_at"
(** Gets the child of [grid] whose area covers the grid cell at [column], [row].
*)

external get_baseline_row : t -> int = "ml_gtk_grid_get_baseline_row"
(** Returns which row defines the global baseline of [grid]. *)

external attach_next_to :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  Gtk_enums.positiontype ->
  int ->
  int ->
  unit
  = "ml_gtk_grid_attach_next_to_bytecode" "ml_gtk_grid_attach_next_to_native"
(** Adds a widget to the grid.

    The widget is placed next to [sibling], on the side determined by [side].
    When [sibling] is [NULL], the widget is placed in row (for left or right
    placement) or column 0 (for top or bottom placement), at the end indicated
    by [side].

    Attaching widgets labeled \[1\], \[2\], \[3\] with [@sibling == %NULL] and
    [@side == %GTK_POS_LEFT] yields a layout of \[3\]\[2\]\[1\]. *)

external attach :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t ->
  int ->
  int ->
  int ->
  int ->
  unit = "ml_gtk_grid_attach_bytecode" "ml_gtk_grid_attach_native"
(** Adds a widget to the grid.

    The position of [child] is determined by [column] and [row]. The number of
    “cells” that [child] will occupy is determined by [width] and [height]. *)

(* Properties *)
