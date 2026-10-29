(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerScroll: EventControllerScroll *)

(** Handles scroll events.

    It is capable of handling both discrete and continuous scroll events from
    mice or touchpads, abstracting them both with the
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_scroll}[Gtk.EventControllerScroll::scroll]}
    signal. Deltas in the discrete case are multiples of 1.

    In the case of continuous scroll events, [GtkEventControllerScroll] encloses
    all
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_scroll}[Gtk.EventControllerScroll::scroll]}
    emissions between two
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_scroll_begin}[Gtk.EventControllerScroll::scroll-begin]}
    and
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_scroll_end}[Gtk.EventControllerScroll::scroll-end]}
    signals.

    The behavior of the event controller can be modified by the flags given at
    creation time, or modified at a later point through
    {{!Ocgtk.Raw.Event_controller_scroll.val-set_flags}[Gtk.EventControllerScroll.set_flags]}
    (e.g. because the scrolling conditions of the widget changed).

    The controller can be set up to emit motion for either/both vertical and
    horizontal scroll events through
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-VERTICAL}[GTK_EVENT_CONTROLLER_SCROLL_VERTICAL]},
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-HORIZONTAL}[GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL]}
    and
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-BOTH_AXES}[GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES]}.
    If any axis is disabled, the respective
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_scroll}[Gtk.EventControllerScroll::scroll]}
    delta will be 0. Vertical scroll events will be translated to horizontal
    motion for the devices incapable of horizontal scrolling.

    The event controller can also be forced to emit discrete events on all
    devices through
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-DISCRETE}[GTK_EVENT_CONTROLLER_SCROLL_DISCRETE]}.
    This can be used to implement discrete actions triggered through scroll
    events (e.g. switching across combobox options).

    The
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-KINETIC}[GTK_EVENT_CONTROLLER_SCROLL_KINETIC]}
    flag toggles the emission of the
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_decelerate}[Gtk.EventControllerScroll::decelerate]}
    signal, emitted at the end of scrolling with two X/Y velocity arguments that
    are consistent with the motion that was received.

    The class built on this module is in {!Ocgtk.Event_controller_scroll}. *)

type t = [ `event_controller_scroll | `event_controller | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_event_controller_scroll_get_type"

external new_ : Ocgtk_enums.eventcontrollerscrollflags -> t
  = "ml_gtk_event_controller_scroll_new"
(** Creates a new event controller that will handle scroll events. *)

(* Methods *)

external set_flags : t -> Ocgtk_enums.eventcontrollerscrollflags -> unit
  = "ml_gtk_event_controller_scroll_set_flags"
(** Sets the flags conditioning scroll controller behavior. *)

external get_unit : t -> Ocgdk_enums.scrollunit
  = "ml_gtk_event_controller_scroll_get_unit"
(** Gets the scroll unit of the last
    {{!Ocgtk.Raw.Event_controller_scroll.val-on_scroll}[Gtk.EventControllerScroll::scroll]}
    signal received.

    Always returns [GDK_SCROLL_UNIT_WHEEL] if the
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-DISCRETE}[GTK_EVENT_CONTROLLER_SCROLL_DISCRETE]}
    flag is set. *)

external get_flags : t -> Ocgtk_enums.eventcontrollerscrollflags
  = "ml_gtk_event_controller_scroll_get_flags"
(** Gets the flags conditioning the scroll controller behavior. *)

(* Properties *)

val on_decelerate :
  ?after:bool ->
  t ->
  callback:(vel_x:float -> vel_y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted after scroll is finished if the
    {{!Ocgtk.Enums.type-eventcontrollerscrollflags_flag.constructor-KINETIC}[GTK_EVENT_CONTROLLER_SCROLL_KINETIC]}
    flag is set.

    [vel_x] and [vel_y] express the initial velocity that was imprinted by the
    scroll events. [vel_x] and [vel_y] are expressed in pixels/ms. *)

val on_scroll :
  ?after:bool ->
  t ->
  callback:(dx:float -> dy:float -> bool) ->
  Gobject.Signal.handler_id
(** Signals that the widget should scroll by the amount specified by [dx] and
    [dy].

    For the representation unit of the deltas, see
    {{!Ocgtk.Raw.Event_controller_scroll.val-get_unit}[Gtk.EventControllerScroll.get_unit]}.
*)

val on_scroll_begin :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Signals that a new scrolling operation has begun.

    It will only be emitted on devices capable of it. *)

val on_scroll_end :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Signals that a scrolling operation has finished.

    It will only be emitted on devices capable of it. *)
