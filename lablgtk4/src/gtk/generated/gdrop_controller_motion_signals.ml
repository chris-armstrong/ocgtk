(* Signal handlers for DropControllerMotion *)
class drop_controller_motion_signals (obj : Drop_controller_motion.t) = object
  (** Signals that the pointer has left the widget. *)
  method on_leave ~callback =
    Gobject.Signal.connect_simple (Obj.magic obj :> _ Gobject.obj) ~name:"leave" ~callback ~after:false

end
