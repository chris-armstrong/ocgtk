(* High-level class for PollableInputStream *)
class pollable_input_stream (obj : Pollable_input_stream.t) = object (self)

  method can_poll : unit -> bool =
    fun () ->
      (Pollable_input_stream.can_poll obj)

  method is_readable : unit -> bool =
    fun () ->
      (Pollable_input_stream.is_readable obj)

    method as_pollable_input_stream = obj
end

