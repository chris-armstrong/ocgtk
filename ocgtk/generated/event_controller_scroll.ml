class type event_controller_scroll_t = object
  inherit Event_controller.event_controller_t

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

(* High-level class for EventControllerScroll *)
class event_controller_scroll (obj : Raw.Event_controller_scroll.t) :
  event_controller_scroll_t =
  object (self)
    inherit Event_controller.event_controller (obj :> Raw.Event_controller.t)

    method on_decelerate ?(after = false) ~callback () =
      Raw.Event_controller_scroll.on_decelerate ~after
        self#as_event_controller_scroll ~callback

    method on_scroll ?(after = false) ~callback () =
      Raw.Event_controller_scroll.on_scroll ~after
        self#as_event_controller_scroll ~callback

    method on_scroll_begin ?(after = false) ~callback () =
      Raw.Event_controller_scroll.on_scroll_begin ~after
        self#as_event_controller_scroll ~callback

    method on_scroll_end ?(after = false) ~callback () =
      Raw.Event_controller_scroll.on_scroll_end ~after
        self#as_event_controller_scroll ~callback

    method get_flags : unit -> Enums.eventcontrollerscrollflags =
      fun () -> Raw.Event_controller_scroll.get_flags obj

    method get_unit : unit -> Ocgdk.Enums.scrollunit =
      fun () -> Raw.Event_controller_scroll.get_unit obj

    method set_flags : Enums.eventcontrollerscrollflags -> unit =
      fun flags -> Raw.Event_controller_scroll.set_flags obj flags

    method as_event_controller_scroll = obj
  end

let new_ (flags : Enums.eventcontrollerscrollflags) : event_controller_scroll_t
    =
  let obj_ = Raw.Event_controller_scroll.new_ flags in
  new event_controller_scroll obj_
