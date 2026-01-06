(* High-level class for ButtonEvent *)
class button_event (obj : Button_event.t) = object (self)

  method get_button : unit -> int =
    fun () ->
      (Button_event.get_button obj)

    method as_button_event = obj
end

