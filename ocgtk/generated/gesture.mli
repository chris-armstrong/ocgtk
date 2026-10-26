class type gesture_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method get_device : unit -> Ocgdk.Device.device_t option
  method get_group : unit -> gesture_t list

  method get_last_event :
    Ocgdk.Event_sequence.event_sequence_t option -> Ocgdk.Event.event_t option

  method get_last_updated_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option

  method get_sequence_state :
    Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate

  method get_sequences : unit -> Ocgdk.Event_sequence.event_sequence_t list
  method group : gesture_t -> unit
  method handles_sequence : Ocgdk.Event_sequence.event_sequence_t option -> bool
  method is_active : unit -> bool
  method is_grouped_with : gesture_t -> bool
  method is_recognized : unit -> bool

  method set_sequence_state :
    Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate -> bool

  method set_state : Enums.eventsequencestate -> bool
  method ungroup : unit -> unit
  method n_points : int
  method as_gesture : Raw.Gesture.t
end

class gesture : Raw.Gesture.t -> gesture_t
