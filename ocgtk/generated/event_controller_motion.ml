class type event_controller_motion_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method on_enter :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method contains_pointer : unit -> bool
  (** Returns if a pointer is within [self] or one of its children. *)

  method is_pointer : unit -> bool
  (** Returns if a pointer is within [self], but not one of its children. *)

  method as_event_controller_motion : Raw.Event_controller_motion.t
end

(* High-level class for EventControllerMotion *)
class event_controller_motion (obj : Raw.Event_controller_motion.t) :
  event_controller_motion_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method on_enter ?(after = false) ~callback () =
      Raw.Event_controller_motion.on_enter ~after
        self#as_event_controller_motion ~callback

    method on_leave ?(after = false) ~callback () =
      Raw.Event_controller_motion.on_leave ~after
        self#as_event_controller_motion ~callback

    method on_motion ?(after = false) ~callback () =
      Raw.Event_controller_motion.on_motion ~after
        self#as_event_controller_motion ~callback

    method contains_pointer : unit -> bool =
      fun () -> Raw.Event_controller_motion.contains_pointer obj

    method is_pointer : unit -> bool =
      fun () -> Raw.Event_controller_motion.is_pointer obj

    method as_event_controller_motion = obj
  end

let new_ () : event_controller_motion_t =
  new event_controller_motion (Raw.Event_controller_motion.new_ ())
