class button_event : Button_event.t ->
  object
    method get_button : unit -> int
    method as_button_event : Button_event.t
  end

