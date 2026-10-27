(** Arranges three children in a row, keeping the middle child centered as well
    as possible.

    An example GtkCenterBox

    To add children to [GtkCenterBox], use [Gtk.CenterBox.set_start_widget],
    [Gtk.CenterBox.set_center_widget] and [Gtk.CenterBox.set_end_widget].

    The sizing and positioning of children can be influenced with the align and
    expand properties of the children.

    {b GtkCenterBox as GtkBuildable}

    The [GtkCenterBox] implementation of the [GtkBuildable] interface supports
    placing children in the 3 positions by specifying “start”, “center” or “end”
    as the “type” attribute of a [<child>] element.

    {b CSS nodes}

    [GtkCenterBox] uses a single CSS node with the name “box”,

    The first child of the [GtkCenterBox] will be allocated depending on the
    text direction, i.e. in left-to-right layouts it will be allocated on the
    left and in right-to-left layouts on the right.

    In vertical orientation, the nodes of the children are arranged from top to
    bottom.

    {b Accessibility}

    Until GTK 4.10, [GtkCenterBox] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkCenterBox] uses the [Gtk.AccessibleRole.generic]
    role.

    Its methods, signals and properties are on {!class-type-center_box_t}. The
    functions it is built on are in {!Ocgtk.Raw.Center_box}. *)

(** The methods, signals and properties of a [GtkCenterBox]. *)
class type center_box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t
  method get_baseline_position : unit -> Enums.baselineposition

  method get_center_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_end_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_shrink_center_last : unit -> bool

  method get_start_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method set_baseline_position : Enums.baselineposition -> unit

  method set_center_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_end_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_shrink_center_last : bool -> unit

  method set_start_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_center_box : Raw.Center_box.t
end

class center_box : Raw.Center_box.t -> center_box_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Center_box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCenterBox], give one already wrapped. *)

val new_ : unit -> center_box_t
