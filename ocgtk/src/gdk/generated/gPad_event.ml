(* High-level class for PadEvent *)
class pad_event (obj : Pad_event.t) = object (self)

  method get_button : unit -> int =
    fun () ->
      (Pad_event.get_button obj)

    method as_pad_event = obj
end

