class type pollable_input_stream_t = object
    method can_poll : unit -> bool
    method is_readable : unit -> bool
    method as_pollable_input_stream : Pollable_input_stream.t
end

(* High-level class for PollableInputStream *)
class pollable_input_stream (obj : Pollable_input_stream.t) : pollable_input_stream_t = object (self)

  method can_poll : unit -> bool =
    fun () ->
      (Pollable_input_stream.can_poll obj)

  method is_readable : unit -> bool =
    fun () ->
      (Pollable_input_stream.is_readable obj)

    method as_pollable_input_stream = obj
end

