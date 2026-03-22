class type gesture_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Ggesture_signals.gesture_signals
    method get_device : unit -> Ocgtk_gdk.Gdk.device_t option
    method get_last_event : Ocgtk_gdk.Gdk.event_sequence_t option -> Ocgtk_gdk.Gdk.event_t option
    method get_last_updated_sequence : unit -> Ocgtk_gdk.Gdk.event_sequence_t option
    method get_sequence_state : Ocgtk_gdk.Gdk.event_sequence_t -> Gtk_enums.eventsequencestate
    method group : gesture_t -> unit
    method handles_sequence : Ocgtk_gdk.Gdk.event_sequence_t option -> bool
    method is_active : unit -> bool
    method is_grouped_with : gesture_t -> bool
    method is_recognized : unit -> bool
    method set_sequence_state : Ocgtk_gdk.Gdk.event_sequence_t -> Gtk_enums.eventsequencestate -> bool
    method set_state : Gtk_enums.eventsequencestate -> bool
    method ungroup : unit -> unit
    method n_points : int
    method as_gesture : Gesture.t
end

class gesture : Gesture.t -> gesture_t

