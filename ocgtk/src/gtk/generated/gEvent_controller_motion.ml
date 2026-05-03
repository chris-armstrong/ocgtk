class type event_controller_motion_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .event_controller_t

  method on_enter :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method on_leave : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_motion :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method contains_pointer : unit -> bool
  method is_pointer : unit -> bool
  method as_event_controller_motion : Event_controller_motion.t
end

(* High-level class for EventControllerMotion *)
class event_controller_motion (obj : Event_controller_motion.t) :
  event_controller_motion_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .event_controller
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Event_controller
             .t)

    method on_enter ~callback =
      Event_controller_motion.on_enter self#as_event_controller_motion ~callback

    method on_leave ~callback =
      Event_controller_motion.on_leave self#as_event_controller_motion ~callback

    method on_motion ~callback =
      Event_controller_motion.on_motion self#as_event_controller_motion
        ~callback

    method contains_pointer : unit -> bool =
      fun () -> Event_controller_motion.contains_pointer obj

    method is_pointer : unit -> bool =
      fun () -> Event_controller_motion.is_pointer obj

    method as_event_controller_motion = obj
  end

let new_ () : event_controller_motion_t =
  new event_controller_motion (Event_controller_motion.new_ ())
