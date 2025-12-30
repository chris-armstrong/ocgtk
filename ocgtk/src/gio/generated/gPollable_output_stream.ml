(* High-level class for PollableOutputStream *)
class pollable_output_stream (obj : Pollable_output_stream.t) = object (self)

  method can_poll : unit -> bool =
    fun () ->
      (Pollable_output_stream.can_poll obj)

  method is_writable : unit -> bool =
    fun () ->
      (Pollable_output_stream.is_writable obj)

    method as_pollable_output_stream = obj
end

