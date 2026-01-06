(* High-level class for CrossingEvent *)
class crossing_event (obj : Crossing_event.t) = object (self)

  method get_detail : unit -> Gdk_enums.notifytype =
    fun () ->
      (Crossing_event.get_detail obj)

  method get_focus : unit -> bool =
    fun () ->
      (Crossing_event.get_focus obj)

  method get_mode : unit -> Gdk_enums.crossingmode =
    fun () ->
      (Crossing_event.get_mode obj)

    method as_crossing_event = obj
end

