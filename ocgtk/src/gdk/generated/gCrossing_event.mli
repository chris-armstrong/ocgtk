class crossing_event : Crossing_event.t ->
  object
    method get_detail : unit -> Gdk_enums.notifytype
    method get_focus : unit -> bool
    method get_mode : unit -> Gdk_enums.crossingmode
    method as_crossing_event : Crossing_event.t
  end

