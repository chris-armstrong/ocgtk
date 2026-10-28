[@@@ocaml.text
"Arranges its child widgets in rows and columns.\n\n\
 An example GtkGrid\n\n\
 It supports arbitrary positions and horizontal/vertical spans.\n\n\
 Children are added using [Gtk.Grid.attach]. They can span multiple\n\
 rows or columns. It is also possible to add a child next to an existing\n\
 child, using [Gtk.Grid.attach_next_to]. To remove a child from the\n\
 grid, use [Gtk.Grid.remove].\n\n\
 The behaviour of [GtkGrid] when several children occupy the same grid\n\
 cell is undefined.\n\n\
 {b GtkGrid as GtkBuildable}\n\n\
 Every child in a [GtkGrid] has access to a custom [Gtk.Buildable]\n\
 element, called [<layout>]. It can by used to specify a position in the\n\
 grid and optionally spans. All properties that can be used in the [<layout>]\n\
 element are implemented by [Gtk.GridLayoutChild].\n\n\
 It is implemented by [GtkWidget] using [Gtk.LayoutManager].\n\n\
 To showcase it, here is a simple example:\n\n\
 {[\n\
 <object class=\"GtkGrid\" id=\"my_grid\">\n\
\  <child>\n\
\    <object class=\"GtkButton\" id=\"button1\">\n\
\      <property name=\"label\">Button 1</property>\n\
\      <layout>\n\
\        <property name=\"column\">0</property>\n\
\        <property name=\"row\">0</property>\n\
\      </layout>\n\
\    </object>\n\
\  </child>\n\
\  <child>\n\
\    <object class=\"GtkButton\" id=\"button2\">\n\
\      <property name=\"label\">Button 2</property>\n\
\      <layout>\n\
\        <property name=\"column\">1</property>\n\
\        <property name=\"row\">0</property>\n\
\      </layout>\n\
\    </object>\n\
\  </child>\n\
\  <child>\n\
\    <object class=\"GtkButton\" id=\"button3\">\n\
\      <property name=\"label\">Button 3</property>\n\
\      <layout>\n\
\        <property name=\"column\">2</property>\n\
\        <property name=\"row\">0</property>\n\
\        <property name=\"row-span\">2</property>\n\
\      </layout>\n\
\    </object>\n\
\  </child>\n\
\  <child>\n\
\    <object class=\"GtkButton\" id=\"button4\">\n\
\      <property name=\"label\">Button 4</property>\n\
\      <layout>\n\
\        <property name=\"column\">0</property>\n\
\        <property name=\"row\">1</property>\n\
\        <property name=\"column-span\">2</property>\n\
\      </layout>\n\
\    </object>\n\
\  </child>\n\
 </object>\n\
 ]}\n\n\
 It organizes the first two buttons side-by-side in one cell each.\n\
 The third button is in the last column but spans across two rows.\n\
 This is defined by the [row-span] property. The last button is\n\
 located in the second row and spans across two columns, which is\n\
 defined by the [column-span] property.\n\n\
 {b CSS nodes}\n\n\
 [GtkGrid] uses a single CSS node with name [grid].\n\n\
 {b Accessibility}\n\n\
 Until GTK 4.10, [GtkGrid] used the [Gtk.AccessibleRole.group] role.\n\n\
 Starting from GTK 4.12, [GtkGrid] uses the [Gtk.AccessibleRole.generic] role.\n\n\
 Its methods, signals and properties are on {!class-type-grid_t}. Its \
 constructors are under {!section-constructors}. The functions it is built on \
 are in {!Ocgtk.Raw.Grid}."]

class type grid_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method attach :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    int ->
    int ->
    int ->
    int ->
    unit
  (** Adds a widget to the grid.

      The position of [child] is determined by [column] and [row]. The number of
      “cells” that [child] will occupy is determined by [width] and [height]. *)

  method attach_next_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    Enums.positiontype ->
    int ->
    int ->
    unit
  (** Adds a widget to the grid.

      The widget is placed next to [sibling], on the side determined by [side].
      When [sibling] is [NULL], the widget is placed in row (for left or right
      placement) or column 0 (for top or bottom placement), at the end indicated
      by [side].

      Attaching widgets labeled \[1\], \[2\], \[3\] with [@sibling == %NULL] and
      [@side == %GTK_POS_LEFT] yields a layout of \[3\]\[2\]\[1\]. *)

  method get_baseline_row : unit -> int
  (** Returns which row defines the global baseline of [grid]. *)

  method get_child_at :
    int ->
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child of [grid] whose area covers the grid cell at [column],
      [row]. *)

  method get_column_homogeneous : unit -> bool
  (** Returns whether all columns of [grid] have the same width. *)

  method get_column_spacing : unit -> int
  (** Returns the amount of space between the columns of [grid]. *)

  method get_row_baseline_position : int -> Enums.baselineposition
  (** Returns the baseline position of [row].

      See [Gtk.Grid.set_row_baseline_position]. *)

  method get_row_homogeneous : unit -> bool
  (** Returns whether all rows of [grid] have the same height. *)

  method get_row_spacing : unit -> int
  (** Returns the amount of space between the rows of [grid]. *)

  method insert_column : int -> unit
  (** Inserts a column at the specified position.

      Children which are attached at or to the right of this position are moved
      one column to the right. Children which span across this position are
      grown to span the new column. *)

  method insert_next_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.positiontype ->
    unit
  (** Inserts a row or column at the specified position.

      The new row or column is placed next to [sibling], on the side determined
      by [side]. If [side] is [GTK_POS_TOP] or [GTK_POS_BOTTOM], a row is
      inserted. If [side] is [GTK_POS_LEFT] of [GTK_POS_RIGHT], a column is
      inserted. *)

  method insert_row : int -> unit
  (** Inserts a row at the specified position.

      Children which are attached at or below this position are moved one row
      down. Children which span across this position are grown to span the new
      row. *)

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit
  (** Removes a child from [grid].

      The child must have been added with [Gtk.Grid.attach] or
      [Gtk.Grid.attach_next_to]. *)

  method remove_column : int -> unit
  (** Removes a column from the grid.

      Children that are placed in this column are removed, spanning children
      that overlap this column have their width reduced by one, and children
      after the column are moved to the left. *)

  method remove_row : int -> unit
  (** Removes a row from the grid.

      Children that are placed in this row are removed, spanning children that
      overlap this row have their height reduced by one, and children below the
      row are moved up. *)

  method set_baseline_row : int -> unit
  (** Sets which row defines the global baseline for the entire grid.

      Each row in the grid can have its own local baseline, but only one of
      those is global, meaning it will be the baseline in the parent of the
      [grid]. *)

  method set_column_homogeneous : bool -> unit
  (** Sets whether all columns of [grid] will have the same width. *)

  method set_column_spacing : int -> unit
  (** Sets the amount of space between columns of [grid]. *)

  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  (** Sets how the baseline should be positioned on [row] of the grid, in case
      that row is assigned more space than is requested.

      The default baseline position is [GTK_BASELINE_POSITION_CENTER]. *)

  method set_row_homogeneous : bool -> unit
  (** Sets whether all rows of [grid] will have the same height. *)

  method set_row_spacing : int -> unit
  (** Sets the amount of space between rows of [grid]. *)

  method as_grid : Raw.Grid.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Grid].}\n\n\
     Arranges its child widgets in rows and columns.\n\n\
     An example GtkGrid\n\n\
     It supports arbitrary positions and horizontal/vertical spans.\n\n\
     Children are added using [Gtk.Grid.attach]. They can span multiple\n\
     rows or columns. It is also possible to add a child next to an existing\n\
     child, using [Gtk.Grid.attach_next_to]. To remove a child from the\n\
     grid, use [Gtk.Grid.remove].\n\n\
     The behaviour of [GtkGrid] when several children occupy the same grid\n\
     cell is undefined.\n\n\
     {b GtkGrid as GtkBuildable}\n\n\
     Every child in a [GtkGrid] has access to a custom [Gtk.Buildable]\n\
     element, called [<layout>]. It can by used to specify a position in the\n\
     grid and optionally spans. All properties that can be used in the \
     [<layout>]\n\
     element are implemented by [Gtk.GridLayoutChild].\n\n\
     It is implemented by [GtkWidget] using [Gtk.LayoutManager].\n\n\
     To showcase it, here is a simple example:\n\n\
     {[\n\
     <object class=\"GtkGrid\" id=\"my_grid\">\n\
    \  <child>\n\
    \    <object class=\"GtkButton\" id=\"button1\">\n\
    \      <property name=\"label\">Button 1</property>\n\
    \      <layout>\n\
    \        <property name=\"column\">0</property>\n\
    \        <property name=\"row\">0</property>\n\
    \      </layout>\n\
    \    </object>\n\
    \  </child>\n\
    \  <child>\n\
    \    <object class=\"GtkButton\" id=\"button2\">\n\
    \      <property name=\"label\">Button 2</property>\n\
    \      <layout>\n\
    \        <property name=\"column\">1</property>\n\
    \        <property name=\"row\">0</property>\n\
    \      </layout>\n\
    \    </object>\n\
    \  </child>\n\
    \  <child>\n\
    \    <object class=\"GtkButton\" id=\"button3\">\n\
    \      <property name=\"label\">Button 3</property>\n\
    \      <layout>\n\
    \        <property name=\"column\">2</property>\n\
    \        <property name=\"row\">0</property>\n\
    \        <property name=\"row-span\">2</property>\n\
    \      </layout>\n\
    \    </object>\n\
    \  </child>\n\
    \  <child>\n\
    \    <object class=\"GtkButton\" id=\"button4\">\n\
    \      <property name=\"label\">Button 4</property>\n\
    \      <layout>\n\
    \        <property name=\"column\">0</property>\n\
    \        <property name=\"row\">1</property>\n\
    \        <property name=\"column-span\">2</property>\n\
    \      </layout>\n\
    \    </object>\n\
    \  </child>\n\
     </object>\n\
     ]}\n\n\
     It organizes the first two buttons side-by-side in one cell each.\n\
     The third button is in the last column but spans across two rows.\n\
     This is defined by the [row-span] property. The last button is\n\
     located in the second row and spans across two columns, which is\n\
     defined by the [column-span] property.\n\n\
     {b CSS nodes}\n\n\
     [GtkGrid] uses a single CSS node with name [grid].\n\n\
     {b Accessibility}\n\n\
     Until GTK 4.10, [GtkGrid] used the [Gtk.AccessibleRole.group] role.\n\n\
     Starting from GTK 4.12, [GtkGrid] uses the [Gtk.AccessibleRole.generic] \
     role."]

class grid : Raw.Grid.t -> grid_t
(** Wraps a raw handle of {!Ocgtk.Raw.Grid.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> grid_t
(** Creates a new grid widget. *)
