class type focus_event_t = object
    method get_in : unit -> bool
    method as_focus_event : Focus_event.t
end

(* High-level class for FocusEvent *)
class focus_event (obj : Focus_event.t) : focus_event_t = object (self)

  method get_in : unit -> bool =
    fun () ->
      (Focus_event.get_in obj)

    method as_focus_event = obj
end

