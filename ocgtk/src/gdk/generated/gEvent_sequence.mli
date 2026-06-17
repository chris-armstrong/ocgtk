class type event_sequence_t = object
  method as_event_sequence : Event_sequence.t
end

class event_sequence : Event_sequence.t -> event_sequence_t
