class focus_event : Focus_event.t ->
  object
    method get_in : unit -> bool
    method as_focus_event : Focus_event.t
  end

