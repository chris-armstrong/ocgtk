class gesture : Gesture.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_signals.gesture_signals
    method n_points : int
    method group : <as_gesture: Gesture.t; ..> -> unit
    method is_active : unit -> bool
    method is_grouped_with : <as_gesture: Gesture.t; ..> -> bool
    method is_recognized : unit -> bool
    method set_state : Gtk_enums.eventsequencestate -> bool
    method ungroup : unit -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture : Gesture.t
  end

