class type drop_controller_motion_t = object
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
  method get_drop : unit -> Ocgdk.Drop.drop_t option
  method is_pointer : unit -> bool
  method as_drop_controller_motion : Raw.Drop_controller_motion.t
end

(* High-level class for DropControllerMotion *)
class drop_controller_motion (obj : Raw.Drop_controller_motion.t) :
  drop_controller_motion_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method on_enter ?(after = false) ~callback () =
      Raw.Drop_controller_motion.on_enter ~after self#as_drop_controller_motion
        ~callback

    method on_leave ?(after = false) ~callback () =
      Raw.Drop_controller_motion.on_leave ~after self#as_drop_controller_motion
        ~callback

    method on_motion ?(after = false) ~callback () =
      Raw.Drop_controller_motion.on_motion ~after self#as_drop_controller_motion
        ~callback

    method contains_pointer : unit -> bool =
      fun () -> Raw.Drop_controller_motion.contains_pointer obj

    method get_drop : unit -> Ocgdk.Drop.drop_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Drop.drop ret)
          (Raw.Drop_controller_motion.get_drop obj)

    method is_pointer : unit -> bool =
      fun () -> Raw.Drop_controller_motion.is_pointer obj

    method as_drop_controller_motion = obj
  end

let new_ () : drop_controller_motion_t =
  new drop_controller_motion (Raw.Drop_controller_motion.new_ ())
