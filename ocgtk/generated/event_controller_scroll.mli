(** Handles scroll events.

    Its methods, signals and properties are on
    {!class-type-event_controller_scroll_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Event_controller_scroll}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EventControllerScroll].}

    Handles scroll events.

    It is capable of handling both discrete and continuous scroll events from
    mice or touchpads, abstracting them both with the
    [Gtk.EventControllerScroll::scroll] signal. Deltas in the discrete case are
    multiples of 1.

    In the case of continuous scroll events, [GtkEventControllerScroll] encloses
    all [Gtk.EventControllerScroll::scroll] emissions between two
    [Gtk.EventControllerScroll::scroll-begin] and
    [Gtk.EventControllerScroll::scroll-end] signals.

    The behavior of the event controller can be modified by the flags given at
    creation time, or modified at a later point through
    [Gtk.EventControllerScroll.set_flags] (e.g. because the scrolling conditions
    of the widget changed).

    The controller can be set up to emit motion for either/both vertical and
    horizontal scroll events through [GTK_EVENT_CONTROLLER_SCROLL_VERTICAL],
    [GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL] and
    [GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES]. If any axis is disabled, the
    respective [Gtk.EventControllerScroll::scroll] delta will be 0. Vertical
    scroll events will be translated to horizontal motion for the devices
    incapable of horizontal scrolling.

    The event controller can also be forced to emit discrete events on all
    devices through [GTK_EVENT_CONTROLLER_SCROLL_DISCRETE]. This can be used to
    implement discrete actions triggered through scroll events (e.g. switching
    across combobox options).

    The [GTK_EVENT_CONTROLLER_SCROLL_KINETIC] flag toggles the emission of the
    [Gtk.EventControllerScroll::decelerate] signal, emitted at the end of
    scrolling with two X/Y velocity arguments that are consistent with the
    motion that was received. *)
class type event_controller_scroll_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  (** {2:signals Signals} *)

  method on_decelerate :
    ?after:bool ->
    callback:(vel_x:float -> vel_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted after scroll is finished if the
      [GTK_EVENT_CONTROLLER_SCROLL_KINETIC] flag is set.

      [vel_x] and [vel_y] express the initial velocity that was imprinted by the
      scroll events. [vel_x] and [vel_y] are expressed in pixels/ms. *)

  method on_scroll :
    ?after:bool ->
    callback:(dx:float -> dy:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Signals that the widget should scroll by the amount specified by [dx] and
      [dy].

      For the representation unit of the deltas, see
      [Gtk.EventControllerScroll.get_unit]. *)

  method on_scroll_begin :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Signals that a new scrolling operation has begun.

      It will only be emitted on devices capable of it. *)

  method on_scroll_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Signals that a scrolling operation has finished.

      It will only be emitted on devices capable of it. *)

  (** {2:methods Methods} *)

  method get_flags : unit -> Enums.eventcontrollerscrollflags
  (** Gets the flags conditioning the scroll controller behavior. *)

  method get_unit : unit -> Ocgdk.Enums.scrollunit
  (** Gets the scroll unit of the last [Gtk.EventControllerScroll::scroll]
      signal received.

      Always returns [GDK_SCROLL_UNIT_WHEEL] if the
      [GTK_EVENT_CONTROLLER_SCROLL_DISCRETE] flag is set. *)

  method set_flags : Enums.eventcontrollerscrollflags -> unit
  (** Sets the flags conditioning scroll controller behavior. *)

  (** {2:conversions Conversions} *)

  method as_event_controller_scroll : Raw.Event_controller_scroll.t
end

class event_controller_scroll :
  Raw.Event_controller_scroll.t ->
  event_controller_scroll_t
(** Wraps a raw handle of {!Ocgtk.Raw.Event_controller_scroll.t}. *)

(** {1:description Description}

    Handles scroll events.

    It is capable of handling both discrete and continuous scroll events from
    mice or touchpads, abstracting them both with the
    [Gtk.EventControllerScroll::scroll] signal. Deltas in the discrete case are
    multiples of 1.

    In the case of continuous scroll events, [GtkEventControllerScroll] encloses
    all [Gtk.EventControllerScroll::scroll] emissions between two
    [Gtk.EventControllerScroll::scroll-begin] and
    [Gtk.EventControllerScroll::scroll-end] signals.

    The behavior of the event controller can be modified by the flags given at
    creation time, or modified at a later point through
    [Gtk.EventControllerScroll.set_flags] (e.g. because the scrolling conditions
    of the widget changed).

    The controller can be set up to emit motion for either/both vertical and
    horizontal scroll events through [GTK_EVENT_CONTROLLER_SCROLL_VERTICAL],
    [GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL] and
    [GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES]. If any axis is disabled, the
    respective [Gtk.EventControllerScroll::scroll] delta will be 0. Vertical
    scroll events will be translated to horizontal motion for the devices
    incapable of horizontal scrolling.

    The event controller can also be forced to emit discrete events on all
    devices through [GTK_EVENT_CONTROLLER_SCROLL_DISCRETE]. This can be used to
    implement discrete actions triggered through scroll events (e.g. switching
    across combobox options).

    The [GTK_EVENT_CONTROLLER_SCROLL_KINETIC] flag toggles the emission of the
    [Gtk.EventControllerScroll::decelerate] signal, emitted at the end of
    scrolling with two X/Y velocity arguments that are consistent with the
    motion that was received. *)

(** {1:constructors Constructors} *)

val new_ : Enums.eventcontrollerscrollflags -> event_controller_scroll_t
(** Creates a new event controller that will handle scroll events. *)
