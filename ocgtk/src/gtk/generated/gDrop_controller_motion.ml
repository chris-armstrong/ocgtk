(* Signal class defined in gdrop_controller_motion_signals.ml *)

(* High-level class for DropControllerMotion *)
class drop_controller_motion (obj : Drop_controller_motion.t) = object (self)
  inherit Gdrop_controller_motion_signals.drop_controller_motion_signals obj

  method contains_pointer : unit -> bool =
    fun () ->
      (Drop_controller_motion.contains_pointer obj)

  method get_drop : unit -> Ocgtk_gdk.Gdk.drop option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.drop ret) (Drop_controller_motion.get_drop obj)

  method is_pointer : unit -> bool =
    fun () ->
      (Drop_controller_motion.is_pointer obj)

    method as_drop_controller_motion = obj
end

