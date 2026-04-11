(* Signal handlers for DropControllerMotion *)
class drop_controller_motion_signals (obj : Drop_controller_motion.t) =
  object
    method on_leave ~callback =
      Gobject.Signal.connect_simple obj ~name:"leave" ~callback ~after:false
    (** Signals that the pointer has left the widget. *)
  end
