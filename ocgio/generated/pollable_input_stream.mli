(** [GPollableInputStream] is implemented by [Gio.InputStream]s that can be
    polled for readiness to read. This can be used when interfacing with a
    non-GIO API that expects UNIX-file-descriptor-style asynchronous I/O rather
    than GIO-style.

    Some classes may implement [GPollableInputStream] but have only certain
    instances of that class be pollable. If [Gio.PollableInputStream.can_poll]
    returns false, then the behavior of other [GPollableInputStream] methods is
    undefined.

    Its methods, signals and properties are on
    {!class-type-pollable_input_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Pollable_input_stream}. *)

(** The methods, signals and properties of a [GPollableInputStream]. *)
class type pollable_input_stream_t = object
  method can_poll : unit -> bool
  (** Checks if [stream] is actually pollable. Some classes may implement
      [GPollableInputStream] but have only certain instances of that class be
      pollable. If this method returns [FALSE], then the behavior of other
      [GPollableInputStream] methods is undefined.

      For any given stream, the value returned by this method is constant; a
      stream cannot switch from pollable to non-pollable or vice versa. *)

  method is_readable : unit -> bool
  (** Checks if [stream] can be read.

      Note that some stream types may not be able to implement this 100%
      reliably, and it is possible that a call to g_input_stream_read() after
      this returns [TRUE] would still block. To guarantee non-blocking behavior,
      you should always use g_pollable_input_stream_read_nonblocking(), which
      will return a [G_IO_ERROR_WOULD_BLOCK] error rather than blocking.

      The behaviour of this method is undefined if
      g_pollable_input_stream_can_poll() returns [FALSE] for [stream]. *)

  method as_pollable_input_stream : Raw.Pollable_input_stream.t
end

class pollable_input_stream :
  Raw.Pollable_input_stream.t ->
  pollable_input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Pollable_input_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GPollableInputStream], give one already wrapped. *)
