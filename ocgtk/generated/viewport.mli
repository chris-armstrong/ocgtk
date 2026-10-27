(** Implements scrollability for widgets that don't support scrolling on their
    own.

    Use [GtkViewport] to scroll child widgets such as [GtkGrid], [GtkBox], and
    so on.

    The [GtkViewport] will start scrolling content only if allocated less than
    the child widget’s minimum size in a given orientation.

    {b CSS nodes}

    [GtkViewport] has a single CSS node with name [viewport].

    {b Accessibility}

    Until GTK 4.10, [GtkViewport] used the [Gtk.AccessibleRole.group] role.

    Starting from GTK 4.12, [GtkViewport] uses the [Gtk.AccessibleRole.generic]
    role.

    Its methods, signals and properties are on {!class-type-viewport_t}. The
    functions it is built on are in {!Ocgtk.Raw.Viewport}. *)

(** The methods, signals and properties of a [GtkViewport]. *)
class type viewport_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_scroll_to_focus : unit -> bool

  method scroll_to :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t ->
    Raw.Scroll_info.t option ->
    unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_scroll_to_focus : bool -> unit
  method as_viewport : Raw.Viewport.t
end

class viewport : Raw.Viewport.t -> viewport_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Viewport.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkViewport], give one already wrapped. *)

val new_ :
  Adjustment.adjustment_t option -> Adjustment.adjustment_t option -> viewport_t
