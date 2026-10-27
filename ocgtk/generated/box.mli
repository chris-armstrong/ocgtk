(** Arranges child widgets into a single row or column.

    An example GtkBox

    Whether it is a row or column depends on the value of its
    [Gtk.Orientable:orientation] property. Within the other dimension, all
    children are allocated the same size. The [Gtk.Widget:halign] and
    [Gtk.Widget:valign] properties can be used on the children to influence
    their allocation.

    Use repeated calls to [Gtk.Box.append] to pack widgets into a [GtkBox] from
    start to end. Use [Gtk.Box.remove] to remove widgets from the [GtkBox].
    [Gtk.Box.insert_child_after] can be used to add a child at a particular
    position.

    Use [Gtk.Box.set_homogeneous] to specify whether or not all children of the
    [GtkBox] are forced to get the same amount of space.

    Use [Gtk.Box.set_spacing] to determine how much space will be minimally
    placed between all children in the [GtkBox]. Note that spacing is added
    {i between} the children.

    Use [Gtk.Box.reorder_child_after] to move a child to a different place in
    the box.

    {b CSS nodes}

    [GtkBox] uses a single CSS node with name box.

    {b Accessibility}

    Until GTK 4.10, [GtkBox] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkBox] uses the [Gtk.AccessibleRole.generic] role.

    Its methods, signals and properties are on {!class-type-box_t}. The
    functions it is built on are in {!Ocgtk.Raw.Box}. *)

(** The methods, signals and properties of a [GtkBox]. *)
class type box_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Orientable.orientable_t

  method append :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method get_baseline_child : unit -> int
  method get_baseline_position : unit -> Enums.baselineposition
  method get_homogeneous : unit -> bool
  method get_spacing : unit -> int

  method insert_child_after :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method prepend :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method remove :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    unit

  method reorder_child_after :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_baseline_child : int -> unit
  method set_baseline_position : Enums.baselineposition -> unit
  method set_homogeneous : bool -> unit
  method set_spacing : int -> unit
  method as_box : Raw.Box.t
end

class box : Raw.Box.t -> box_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Box.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBox], give one already wrapped. *)

val new_ : Enums.orientation -> int -> box_t
