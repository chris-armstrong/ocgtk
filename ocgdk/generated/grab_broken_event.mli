(** An event related to a broken windowing system grab.

    Its methods, signals and properties are on
    {!class-type-grab_broken_event_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Grab_broken_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GrabBrokenEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to a broken windowing system grab. *)
class type grab_broken_event_t = object
  inherit Event.event_t

  (** {2:methods Methods} *)

  method get_grab_surface : unit -> Surface.surface_t
  (** Extracts the grab surface from a grab broken event. *)

  method get_implicit : unit -> bool
  (** Checks whether the grab broken event is for an implicit grab. *)

  (** {2:conversions Conversions} *)

  method as_grab_broken_event : Raw.Grab_broken_event.t
end

class grab_broken_event : Raw.Grab_broken_event.t -> grab_broken_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Grab_broken_event.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
