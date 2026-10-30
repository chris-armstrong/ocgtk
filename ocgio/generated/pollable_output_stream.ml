class type pollable_output_stream_t = object
  (** {2:methods Methods} *)

  method can_poll : unit -> bool
  (** Checks if [stream] is actually pollable. Some classes may implement
      [GPollableOutputStream] but have only certain instances of that class be
      pollable. If this method returns [false], then the behavior of other
      [GPollableOutputStream] methods is undefined.

      For any given stream, the value returned by this method is constant; a
      stream cannot switch from pollable to non-pollable or vice versa. *)

  method is_writable : unit -> bool
  (** Checks if [stream] can be written.

      Note that some stream types may not be able to implement this 100%
      reliably, and it is possible that a call to [g_output_stream_write ()]
      after this returns [true] would still block. To guarantee non-blocking
      behavior, you should always use
      [g_pollable_output_stream_write_nonblocking ()], which will return a
      [G_IO_ERROR_WOULD_BLOCK] error rather than blocking.

      The behaviour of this method is undefined if
      [g_pollable_output_stream_can_poll ()] returns [false] for [stream]. *)

  (** {2:conversions Conversions} *)

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
