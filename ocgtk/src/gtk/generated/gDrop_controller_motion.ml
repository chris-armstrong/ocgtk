(* Signal class defined in gdrop_controller_motion_signals.ml *)

class type drop_controller_motion_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .event_controller_t

  inherit Gdrop_controller_motion_signals.drop_controller_motion_signals
  method contains_pointer : unit -> bool
  method get_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option
  method is_pointer : unit -> bool
  method as_drop_controller_motion : Drop_controller_motion.t
end

(* High-level class for DropControllerMotion *)
class drop_controller_motion (obj : Drop_controller_motion.t) :
  drop_controller_motion_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .event_controller
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Event_controller
             .t)

    inherit Gdrop_controller_motion_signals.drop_controller_motion_signals obj

    method contains_pointer : unit -> bool =
      fun () -> Drop_controller_motion.contains_pointer obj

    method get_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gdk.Gdk.Drop.drop ret)
          (Drop_controller_motion.get_drop obj)

    method is_pointer : unit -> bool =
      fun () -> Drop_controller_motion.is_pointer obj

    method as_drop_controller_motion = obj
  end

let new_ () : drop_controller_motion_t =
  new drop_controller_motion (Drop_controller_motion.new_ ())
