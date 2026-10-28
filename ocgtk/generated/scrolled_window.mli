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
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Scrolled_window}. *)

(** The methods, signals and properties of a [ScrolledWindow]. *)
class type scrolled_window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method on_edge_overshot :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever user initiated scrolling makes the scrolled window firmly
      surpass the limits defined by the adjustment in that orientation.

      A similar behavior without edge resistance is provided by the
      [Gtk.ScrolledWindow::edge-reached] signal.

      Note: The [pos] argument is LTR/RTL aware, so callers should be aware too
      if intending to provide behavior on horizontal edges. *)

  method on_edge_reached :
    ?after:bool ->
    callback:(pos:Enums.positiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever user-initiated scrolling makes the scrolled window
      exactly reach the lower or upper limits defined by the adjustment in that
      orientation.

      A similar behavior with edge resistance is provided by the
      [Gtk.ScrolledWindow::edge-overshot] signal.

      Note: The [pos] argument is LTR/RTL aware, so callers should be aware too
      if intending to provide behavior on horizontal edges. *)

  method on_move_focus_out :
    ?after:bool ->
    callback:(direction_type:Enums.directiontype -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when focus is moved away from the scrolled window by a keybinding.

      This is a keybinding signal.

      The default bindings for this signal are <kbd>Ctrl</kbd>+<kbd>Tab</kbd> to
      move forward and <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Tab</kbd>` to move
      backward. *)

  method on_scroll_child :
    ?after:bool ->
    callback:(scroll:Enums.scrolltype -> horizontal:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a keybinding that scrolls is pressed.

      This is a keybinding signal.

      The horizontal or vertical adjustment is updated which triggers a signal
      that the scrolled window’s child may listen to and scroll itself. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [scrolled_window].

      If the scrolled window automatically added a [Gtk.Viewport], this function
      will return the viewport widget, and you can retrieve its child using
      [Gtk.Viewport.get_child]. *)

  method get_hadjustment : unit -> Adjustment.adjustment_t
  (** Returns the horizontal scrollbar’s adjustment.

      This is the adjustment used to connect the horizontal scrollbar to the
      child widget’s horizontal scroll functionality. *)

  method get_has_frame : unit -> bool
  (** Gets whether the scrolled window draws a frame. *)

  method get_hscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the horizontal scrollbar of [scrolled_window]. *)

  method get_kinetic_scrolling : unit -> bool
  (** Returns the specified kinetic scrolling behavior. *)

  method get_max_content_height : unit -> int
  (** Returns the maximum content height set. *)

  method get_max_content_width : unit -> int
  (** Returns the maximum content width set. *)

  method get_min_content_height : unit -> int
  (** Gets the minimal content height of [scrolled_window]. *)

  method get_min_content_width : unit -> int
  (** Gets the minimum content width of [scrolled_window]. *)

  method get_overlay_scrolling : unit -> bool
  (** Returns whether overlay scrolling is enabled for this scrolled window. *)

  method get_placement : unit -> Enums.cornertype
  (** Gets the placement of the contents with respect to the scrollbars. *)

  method get_propagate_natural_height : unit -> bool
  (** Reports whether the natural height of the child will be calculated and
      propagated through the scrolled window’s requested natural height. *)

  method get_propagate_natural_width : unit -> bool
  (** Reports whether the natural width of the child will be calculated and
      propagated through the scrolled window’s requested natural width. *)

  method get_vadjustment : unit -> Adjustment.adjustment_t
  (** Returns the vertical scrollbar’s adjustment.

      This is the adjustment used to connect the vertical scrollbar to the child
      widget’s vertical scroll functionality. *)

  method get_vscrollbar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the vertical scrollbar of [scrolled_window]. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [scrolled_window].

      If [child] does not implement the [Gtk.Scrollable] interface, the scrolled
      window will add [child] to a [Gtk.Viewport] instance and then add the
      viewport as its child widget. *)

  method set_hadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the [GtkAdjustment] for the horizontal scrollbar. *)

  method set_has_frame : bool -> unit
  (** Changes the frame drawn around the contents of [scrolled_window]. *)

  method set_kinetic_scrolling : bool -> unit
  (** Turns kinetic scrolling on or off.

      Kinetic scrolling only applies to devices with source
      [GDK_SOURCE_TOUCHSCREEN]. *)

  method set_max_content_height : int -> unit
  (** Sets the maximum height that [scrolled_window] should keep visible.

      The [scrolled_window] will grow up to this height before it starts
      scrolling the content.

      It is a programming error to set the maximum content height to a value
      smaller than [Gtk.ScrolledWindow:min-content-height]. *)

  method set_max_content_width : int -> unit
  (** Sets the maximum width that [scrolled_window] should keep visible.

      The [scrolled_window] will grow up to this width before it starts
      scrolling the content.

      It is a programming error to set the maximum content width to a value
      smaller than [Gtk.ScrolledWindow:min-content-width]. *)

  method set_min_content_height : int -> unit
  (** Sets the minimum height that [scrolled_window] should keep visible.

      Note that this can and (usually will) be smaller than the minimum size of
      the content.

      It is a programming error to set the minimum content height to a value
      greater than [Gtk.ScrolledWindow:max-content-height]. *)

  method set_min_content_width : int -> unit
  (** Sets the minimum width that [scrolled_window] should keep visible.

      Note that this can and (usually will) be smaller than the minimum size of
      the content.

      It is a programming error to set the minimum content width to a value
      greater than [Gtk.ScrolledWindow:max-content-width]. *)

  method set_overlay_scrolling : bool -> unit
  (** Enables or disables overlay scrolling for this scrolled window. *)

  method set_placement : Enums.cornertype -> unit
  (** Sets the placement of the contents with respect to the scrollbars for the
      scrolled window.

      The default is [GTK_CORNER_TOP_LEFT], meaning the child is in the top
      left, with the scrollbars underneath and to the right. Other values in
      [Gtk.CornerType] are [GTK_CORNER_TOP_RIGHT], [GTK_CORNER_BOTTOM_LEFT], and
      [GTK_CORNER_BOTTOM_RIGHT].

      See also [Gtk.ScrolledWindow.get_placement] and
      [Gtk.ScrolledWindow.unset_placement]. *)

  method set_policy : Enums.policytype -> Enums.policytype -> unit
  (** Sets the scrollbar policy for the horizontal and vertical scrollbars.

      The policy determines when the scrollbar should appear; it is a value from
      the [Gtk.PolicyType] enumeration. If [GTK_POLICY_ALWAYS], the scrollbar is
      always present; if [GTK_POLICY_NEVER], the scrollbar is never present; if
      [GTK_POLICY_AUTOMATIC], the scrollbar is present only if needed (that is,
      if the slider part of the bar would be smaller than the trough — the
      display is larger than the page size). *)

  method set_propagate_natural_height : bool -> unit
  (** Sets whether the natural height of the child should be calculated and
      propagated through the scrolled window’s requested natural height. *)

  method set_propagate_natural_width : bool -> unit
  (** Sets whether the natural width of the child should be calculated and
      propagated through the scrolled window’s requested natural width. *)

  method set_vadjustment : Adjustment.adjustment_t option -> unit
  (** Sets the [GtkAdjustment] for the vertical scrollbar. *)

  method unset_placement : unit -> unit
  (** Unsets the placement of the contents with respect to the scrollbars.

      If no window placement is set for a scrolled window, it defaults to
      [GTK_CORNER_TOP_LEFT]. *)

  method hscrollbar_policy : Enums.policytype
  method set_hscrollbar_policy : Enums.policytype -> unit
  method vscrollbar_policy : Enums.policytype
  method set_vscrollbar_policy : Enums.policytype -> unit
  method as_scrolled_window : Raw.Scrolled_window.t
end

class scrolled_window : Raw.Scrolled_window.t -> scrolled_window_t
(** Wraps a raw handle of {!Ocgtk.Raw.Scrolled_window.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> scrolled_window_t
(** Creates a new scrolled window. *)
