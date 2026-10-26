class type pollable_output_stream_t = object
  method can_poll : unit -> bool
  method is_writable : unit -> bool
  method as_pollable_output_stream : Raw.Pollable_output_stream.t
end

(* High-level class for PollableOutputStream *)
class pollable_output_stream (obj : Raw.Pollable_output_stream.t) :
  pollable_output_stream_t =
  object (self)
    method can_poll : unit -> bool =
      fun () -> Raw.Pollable_output_stream.can_poll obj

    method is_writable : unit -> bool =
      fun () -> Raw.Pollable_output_stream.is_writable obj

    method as_pollable_output_stream = obj
  end
