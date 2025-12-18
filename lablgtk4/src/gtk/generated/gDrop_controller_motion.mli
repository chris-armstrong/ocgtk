class drop_controller_motion : Drop_controller_motion.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gdrop_controller_motion_signals.drop_controller_motion_signals
    method contains_pointer : unit -> bool
    method is_pointer : unit -> bool
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_drop_controller_motion : Drop_controller_motion.t
  end

