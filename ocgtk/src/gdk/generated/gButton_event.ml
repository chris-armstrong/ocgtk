class type button_event_t = object
    method get_button : unit -> int
    method as_button_event : Button_event.t
end

(* High-level class for ButtonEvent *)
class button_event (obj : Button_event.t) : button_event_t = object (self)

  method get_button : unit -> int =
    fun () ->
      (Button_event.get_button obj)

    method as_button_event = obj
end

