(* High-level class for FocusEvent *)
class focus_event (obj : Focus_event.t) = object (self)

  method get_in : unit -> bool =
    fun () ->
      (Focus_event.get_in obj)

    method as_focus_event = obj
end

