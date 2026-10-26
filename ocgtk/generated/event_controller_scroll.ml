class type event_controller_scroll_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_decelerate :
    ?after:bool ->
    callback:(vel_x:float -> vel_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll :
    ?after:bool ->
    callback:(dx:float -> dy:float -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_scroll_begin :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_scroll_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_flags : unit -> Enums.eventcontrollerscrollflags
  method get_unit : unit -> Ocgdk.Enums.scrollunit
  method set_flags : Enums.eventcontrollerscrollflags -> unit
  method as_event_controller_scroll : Raw.Event_controller_scroll.t
end

(* High-level class for EventControllerScroll *)
class event_controller_scroll (obj : Raw.Event_controller_scroll.t) :
  event_controller_scroll_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

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
