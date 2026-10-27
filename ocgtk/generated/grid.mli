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
 Its methods, signals and properties are on {!class-type-grid_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Grid}."]

(** The methods, signals and properties of a [GtkGrid]. *)
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

  method get_baseline_row : unit -> int

  method get_child_at :
    int ->
    int ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_column_homogeneous : unit -> bool
  method get_column_spacing : unit -> int
  method get_row_baseline_position : int -> Enums.baselineposition
  method get_row_homogeneous : unit -> bool
  method get_row_spacing : unit -> int
  method insert_column : int -> unit

  method insert_next_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Enums.positiontype ->
    unit

  method insert_row : int -> unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove_column : int -> unit
  method remove_row : int -> unit
  method set_baseline_row : int -> unit
  method set_column_homogeneous : bool -> unit
  method set_column_spacing : int -> unit
  method set_row_baseline_position : int -> Enums.baselineposition -> unit
  method set_row_homogeneous : bool -> unit
  method set_row_spacing : int -> unit
  method as_grid : Raw.Grid.t
end

class grid : Raw.Grid.t -> grid_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Grid.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGrid], give one already wrapped. *)

val new_ : unit -> grid_t
