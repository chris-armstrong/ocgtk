class type event_controller_focus_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_enter :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method contains_focus : unit -> bool
  method is_focus : unit -> bool
  method as_event_controller_focus : Event_controller_focus.t
end

(* High-level class for EventControllerFocus *)
class event_controller_focus (obj : Event_controller_focus.t) :
  event_controller_focus_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
             .Event_controller
             .t)

    method on_enter ?(after = false) ~callback () =
      Event_controller_focus.on_enter ~after self#as_event_controller_focus
        ~callback

    method on_leave ?(after = false) ~callback () =
      Event_controller_focus.on_leave ~after self#as_event_controller_focus
        ~callback

    method contains_focus : unit -> bool =
      fun () -> Event_controller_focus.contains_focus obj

    method is_focus : unit -> bool =
      fun () -> Event_controller_focus.is_focus obj

    method as_event_controller_focus = obj
  end

let new_ () : event_controller_focus_t =
  new event_controller_focus (Event_controller_focus.new_ ())
