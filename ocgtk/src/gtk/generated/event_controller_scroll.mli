(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerScroll: EventControllerScroll *)

(** Handles scroll events.

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

type t = [ `event_controller_scroll | `event_controller | `object_ ] Gobject.obj

external new_ : Gtk_enums.eventcontrollerscrollflags -> t
  = "ml_gtk_event_controller_scroll_new"
(** Create a new EventControllerScroll *)

(* Methods *)

external set_flags : t -> Gtk_enums.eventcontrollerscrollflags -> unit
  = "ml_gtk_event_controller_scroll_set_flags"
(** Sets the flags conditioning scroll controller behavior. *)

external get_unit : t -> Ocgtk_gdk.Gdk.scrollunit
  = "ml_gtk_event_controller_scroll_get_unit"
(** Gets the scroll unit of the last [Gtk.EventControllerScroll::scroll] signal
    received.

    Always returns [GDK_SCROLL_UNIT_WHEEL] if the
    [GTK_EVENT_CONTROLLER_SCROLL_DISCRETE] flag is set. *)

external get_flags : t -> Gtk_enums.eventcontrollerscrollflags
  = "ml_gtk_event_controller_scroll_get_flags"
(** Gets the flags conditioning the scroll controller behavior. *)

(* Properties *)

val on_decelerate :
  ?after:bool ->
  t ->
  callback:(vel_x:float -> vel_y:float -> unit) ->
  Gobject.Signal.handler_id

val on_scroll :
  ?after:bool ->
  t ->
  callback:(dx:float -> dy:float -> bool) ->
  Gobject.Signal.handler_id

val on_scroll_begin :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_scroll_end :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
