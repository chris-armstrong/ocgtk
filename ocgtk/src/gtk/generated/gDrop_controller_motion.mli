class type drop_controller_motion_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gdrop_controller_motion_signals.drop_controller_motion_signals
    method contains_pointer : unit -> bool
    method get_drop : unit -> Ocgtk_gdk.Gdk.drop_t option
    method is_pointer : unit -> bool
    method as_drop_controller_motion : Drop_controller_motion.t
end

class drop_controller_motion : Drop_controller_motion.t -> drop_controller_motion_t

