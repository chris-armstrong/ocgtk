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

(* High-level class for GrabBrokenEvent *)
class grab_broken_event (obj : Raw.Grab_broken_event.t) : grab_broken_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)

    method get_grab_surface : unit -> Surface.surface_t =
      fun () -> new Surface.surface (Raw.Grab_broken_event.get_grab_surface obj)

    method get_implicit : unit -> bool =
      fun () -> Raw.Grab_broken_event.get_implicit obj

    method as_grab_broken_event = obj
  end
