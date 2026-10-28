(** [GPollableOutputStream] is implemented by [Gio.OutputStream]s that can be
    polled for readiness to write. This can be used when interfacing with a
    non-GIO API that expects UNIX-file-descriptor-style asynchronous I/O rather
    than GIO-style.

    Its methods, signals and properties are on
    {!class-type-pollable_output_stream_t}. Its full description is under
    {!section-description}. The functions it is built on are in
    {!Ocgio.Raw.Pollable_output_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PollableOutputStream].}

    Requires:
    - {{!Ocgio.Output_stream.class-type-output_stream_t}Ocgio.Output_stream}

    [GPollableOutputStream] is implemented by [Gio.OutputStream]s that can be
    polled for readiness to write. This can be used when interfacing with a
    non-GIO API that expects UNIX-file-descriptor-style asynchronous I/O rather
    than GIO-style.

    Some classes may implement [GPollableOutputStream] but have only certain
    instances of that class be pollable. If [Gio.PollableOutputStream.can_poll]
    returns false, then the behavior of other [GPollableOutputStream] methods is
    undefined. *)
class type pollable_output_stream_t = object
  (** {2:methods Methods} *)

  method can_poll : unit -> bool
  (** Checks if [stream] is actually pollable. Some classes may implement
      [GPollableOutputStream] but have only certain instances of that class be
      pollable. If this method returns [FALSE], then the behavior of other
      [GPollableOutputStream] methods is undefined.

      For any given stream, the value returned by this method is constant; a
      stream cannot switch from pollable to non-pollable or vice versa. *)

  method is_writable : unit -> bool
  (** Checks if [stream] can be written.

      Note that some stream types may not be able to implement this 100%
      reliably, and it is possible that a call to g_output_stream_write() after
      this returns [TRUE] would still block. To guarantee non-blocking behavior,
      you should always use g_pollable_output_stream_write_nonblocking(), which
      will return a [G_IO_ERROR_WOULD_BLOCK] error rather than blocking.

      The behaviour of this method is undefined if
      g_pollable_output_stream_can_poll() returns [FALSE] for [stream]. *)

  (** {2:conversions Conversions} *)

  method as_pollable_output_stream : Raw.Pollable_output_stream.t
end

class pollable_output_stream :
  Raw.Pollable_output_stream.t ->
  pollable_output_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Pollable_output_stream.t}. *)

(** {1:description Description}

    [GPollableOutputStream] is implemented by [Gio.OutputStream]s that can be
    polled for readiness to write. This can be used when interfacing with a
    non-GIO API that expects UNIX-file-descriptor-style asynchronous I/O rather
    than GIO-style.

    Some classes may implement [GPollableOutputStream] but have only certain
    instances of that class be pollable. If [Gio.PollableOutputStream.can_poll]
    returns false, then the behavior of other [GPollableOutputStream] methods is
    undefined. *)
