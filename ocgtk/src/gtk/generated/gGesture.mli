class gesture : Gesture.t ->
  object
    inherit Ggesture_signals.gesture_signals
    method get_device : unit -> Ocgtk_gdk.Gdk.device option
    method get_last_event : #Ocgtk_gdk.Gdk.event_sequence option -> Ocgtk_gdk.Gdk.event option
    method get_last_updated_sequence : unit -> Ocgtk_gdk.Gdk.event_sequence option
    method get_sequence_state : #Ocgtk_gdk.Gdk.event_sequence -> Gtk_enums.eventsequencestate
    method group : <as_gesture: Gesture.t; ..> -> unit
    method handles_sequence : #Ocgtk_gdk.Gdk.event_sequence option -> bool
    method is_active : unit -> bool
    method is_grouped_with : <as_gesture: Gesture.t; ..> -> bool
    method is_recognized : unit -> bool
    method set_sequence_state : #Ocgtk_gdk.Gdk.event_sequence -> Gtk_enums.eventsequencestate -> bool
    method set_state : Gtk_enums.eventsequencestate -> bool
    method ungroup : unit -> unit
    method n_points : int
    method as_gesture : Gesture.t
  end

