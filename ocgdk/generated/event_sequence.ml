class type event_sequence_t = object
  method as_event_sequence : Raw.Event_sequence.t
end

(* High-level class for EventSequence *)
class event_sequence (obj : Raw.Event_sequence.t) : event_sequence_t =
  object (self)
    method as_event_sequence = obj
  end
