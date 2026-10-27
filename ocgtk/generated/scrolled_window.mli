(** Makes its child scrollable.

    An example GtkScrolledWindow

    It does so using either internally added scrollbars or externally associated
    adjustments, and optionally draws a frame around the child.

    Widgets with native scrolling support, i.e. those whose classes implement
    the [Gtk.Scrollable] interface, are added directly. For other types of
    widget, the class [Gtk.Viewport] acts as an adaptor, giving scrollability to
    other widgets. [Gtk.ScrolledWindow.set_child] intelligently accounts for
    whether or not the added child is a [GtkScrollable]. If it isn’t, then it
    wraps the child in a [GtkViewport]. Therefore, you can just add any child
    widget and not worry about the details.

    If [Gtk.ScrolledWindow.set_child] has added a [GtkViewport] for you, it will
    be automatically removed when you unset the child. Unless
    [Gtk.ScrolledWindow:hscrollbar-policy] and
    [Gtk.ScrolledWindow:vscrollbar-policy] are [GTK_POLICY_NEVER] or
    [GTK_POLICY_EXTERNAL], [GtkScrolledWindow] adds internal [GtkScrollbar]
    widgets around its child. The scroll position of the child, and if
    applicable the scrollbars, is controlled by the
    [Gtk.ScrolledWindow:hadjustment] and [Gtk.ScrolledWindow:vadjustment] that
    are associated with the [GtkScrolledWindow]. See the docs on [Gtk.Scrollbar]
    for the details, but note that the “step_increment” and “page_increment”
    fields are only effective if the policy causes scrollbars to be present.

    If a [GtkScrolledWindow] doesn’t behave quite as you would like, or doesn’t
    have exactly the right layout, it’s very possible to set up your own
    scrolling with [GtkScrollbar] and for example a [GtkGrid].

    {b Touch support}

    [GtkScrolledWindow] has built-in support for touch devices. When a
    touchscreen is used, swiping will move the scrolled window, and will expose
    'kinetic' behavior. This can be turned off with the
    [Gtk.ScrolledWindow:kinetic-scrolling] property if it is undesired.

    [GtkScrolledWindow] also displays visual 'overshoot' indication when the
    content is pulled beyond the end, and this situation can be captured with
    the [Gtk.ScrolledWindow::edge-overshot] signal.

    If no mouse device is present, the scrollbars will overlaid as narrow,
    auto-hiding indicators over the content. If traditional scrollbars are
    desired although no mouse is present, this behaviour can be turned off with
    the [Gtk.ScrolledWindow:overlay-scrolling] property.

    {b Shortcuts and Gestures}

    The following signals have default keybindings:

    - [Gtk.ScrolledWindow::scroll-child]

    {b CSS nodes}

    [GtkScrolledWindow] has a main CSS node with name scrolledwindow. It gets a
    .frame style class added when [Gtk.ScrolledWindow:has-frame] is [TRUE].

    It uses subnodes with names overshoot and undershoot to draw the overflow
    and underflow indications. These nodes get the .left, .right, .top or
    .bottom style class added depending on where the indication is drawn.

    [GtkScrolledWindow] also sets the positional style classes (.left, .right,
    .top, .bottom) and style classes related to overlay scrolling
    (.overlay-indicator, .dragging, .hovering) on its scrollbars.

    If both scrollbars are visible, the area where they meet is drawn with a
    subnode named junction.

    {b Accessibility}

    Until GTK 4.10, [GtkScrolledWindow] used the [Gtk.AccessibleRole.group]
    role.

    Starting from GTK 4.12, [GtkScrolledWindow] uses the
    [Gtk.AccessibleRole.generic] role.

    Its methods, signals and properties are on {!class-type-scrolled_window_t}.
    The functions it is built on are in {!Ocgtk.Raw.Scrolled_window}. *)

(** The methods, signals and properties of a [GtkScrolledWindow]. *)
class type scrolled_window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_edge_overshot :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_edge_reached :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction_type:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll_child :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> horizontal:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_hadjustment : unit -> Adjustment.adjustment_t
  method get_has_frame : unit -> bool

  method get_hscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_kinetic_scrolling : unit -> bool
  method get_max_content_height : unit -> int
  method get_max_content_width : unit -> int
  method get_min_content_height : unit -> int
  method get_min_content_width : unit -> int
  method get_overlay_scrolling : unit -> bool
  method get_placement : unit -> Enums.cornertype
  method get_propagate_natural_height : unit -> bool
  method get_propagate_natural_width : unit -> bool
  method get_vadjustment : unit -> Adjustment.adjustment_t

  method get_vscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  method set_has_frame : bool -> unit
  method set_kinetic_scrolling : bool -> unit
  method set_max_content_height : int -> unit
  method set_max_content_width : int -> unit
  method set_min_content_height : int -> unit
  method set_min_content_width : int -> unit
  method set_overlay_scrolling : bool -> unit
  method set_placement : Enums.cornertype -> unit
  method set_policy : Enums.policytype -> Enums.policytype -> unit
  method set_propagate_natural_height : bool -> unit
  method set_propagate_natural_width : bool -> unit
  method set_vadjustment : Adjustment.adjustment_t option -> unit
  method unset_placement : unit -> unit
  method hscrollbar_policy : Enums.policytype
  method set_hscrollbar_policy : Enums.policytype -> unit
  method vscrollbar_policy : Enums.policytype
  method set_vscrollbar_policy : Enums.policytype -> unit
  method as_scrolled_window : Raw.Scrolled_window.t
end

class scrolled_window : Raw.Scrolled_window.t -> scrolled_window_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Scrolled_window.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkScrolledWindow], give one already wrapped. *)

val new_ : unit -> scrolled_window_t
