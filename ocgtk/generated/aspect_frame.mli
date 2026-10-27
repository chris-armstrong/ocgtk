(** Preserves the aspect ratio of its child.

    The frame can respect the aspect ratio of the child widget, or use its own
    aspect ratio.

    {b CSS nodes}

    [GtkAspectFrame] uses a CSS node with name [aspectframe].

    {b Accessibility}

    Until GTK 4.10, [GtkAspectFrame] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkAspectFrame] uses the
    [Gtk.AccessibleRole.generic] role.

    Its methods, signals and properties are on {!class-type-aspect_frame_t}. The
    functions it is built on are in {!Ocgtk.Raw.Aspect_frame}. *)

(** The methods, signals and properties of a [GtkAspectFrame]. *)
class type aspect_frame_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_obey_child : unit -> bool
  method get_ratio : unit -> float
  method get_xalign : unit -> float
  method get_yalign : unit -> float

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_obey_child : bool -> unit
  method set_ratio : float -> unit
  method set_xalign : float -> unit
  method set_yalign : float -> unit
  method as_aspect_frame : Raw.Aspect_frame.t
end

class aspect_frame : Raw.Aspect_frame.t -> aspect_frame_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Aspect_frame.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkAspectFrame], give one already wrapped. *)

val new_ : float -> float -> float -> bool -> aspect_frame_t
