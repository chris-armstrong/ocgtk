(** An opaque type representing a sequence of related events.

    Its methods, signals and properties are on {!class-type-event_sequence_t}.
    The functions it is built on are in {!Ocgdk.Raw.Event_sequence}. *)

(** {b The methods, signals and properties of a [EventSequence].}

    An opaque type representing a sequence of related events. *)
class type event_sequence_t = object
  method as_event_sequence : Raw.Event_sequence.t
end

class event_sequence : Raw.Event_sequence.t -> event_sequence_t
(** Wraps a raw handle of {!Ocgdk.Raw.Event_sequence.t}. *)
