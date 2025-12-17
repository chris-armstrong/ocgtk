(* Signal class defined in gdrop_controller_motion_signals.ml *)

(* High-level class for DropControllerMotion *)
class drop_controller_motion (obj : Drop_controller_motion.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Drop_controller_motion.as_event_controller obj)
  inherit Gdrop_controller_motion_signals.drop_controller_motion_signals obj

  method contains_pointer : unit -> bool = fun () -> (Drop_controller_motion.contains_pointer obj )

  method is_pointer : unit -> bool = fun () -> (Drop_controller_motion.is_pointer obj )

  method as_event_controller = (Drop_controller_motion.as_event_controller obj)
    method as_drop_controller_motion = obj
end

