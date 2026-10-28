class type delete_event_t = object
  inherit Event.event_t

  (** {2:conversions Conversions} *)

  method as_delete_event : Raw.Delete_event.t
end

(* High-level class for DeleteEvent *)
class delete_event (obj : Raw.Delete_event.t) : delete_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)
    method as_delete_event = obj
  end
