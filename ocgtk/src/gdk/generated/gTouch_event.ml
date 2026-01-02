(* High-level class for TouchEvent *)
class touch_event (obj : Touch_event.t) = object (self)

  method get_emulating_pointer : unit -> bool =
    fun () ->
      (Touch_event.get_emulating_pointer obj)

    method as_touch_event = obj
end

