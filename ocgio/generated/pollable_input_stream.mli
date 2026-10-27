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
  method is_readable : unit -> bool
  method as_pollable_input_stream : Raw.Pollable_input_stream.t
end

class pollable_input_stream :
  Raw.Pollable_input_stream.t ->
  pollable_input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Pollable_input_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GPollableInputStream], give one already wrapped. *)
