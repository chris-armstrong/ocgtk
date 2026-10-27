(** An opaque type representing a sequence of related events.

    Its methods, signals and properties are on {!class-type-event_sequence_t}.
    The functions it is built on are in {!Ocgdk.Raw.Event_sequence}. *)

(** The methods, signals and properties of a [GdkEventSequence]. *)
class type event_sequence_t = object
  method as_event_sequence : Raw.Event_sequence.t
end

class event_sequence : Raw.Event_sequence.t -> event_sequence_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Event_sequence.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkEventSequence], give one already wrapped. *)
