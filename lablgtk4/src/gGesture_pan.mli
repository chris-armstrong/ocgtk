class gesture_pan : Gesture_pan.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_pan_signals.gesture_pan_signals
    method get_orientation : unit -> Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_pan : Gesture_pan.t
  end

