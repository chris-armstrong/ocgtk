(** [GPollableOutputStream] is implemented by [Gio.OutputStream]s that can be
    polled for readiness to write. This can be used when interfacing with a
    non-GIO API that expects UNIX-file-descriptor-style asynchronous I/O rather
    than GIO-style.

    Some classes may implement [GPollableOutputStream] but have only certain
    instances of that class be pollable. If [Gio.PollableOutputStream.can_poll]
    returns false, then the behavior of other [GPollableOutputStream] methods is
    undefined.

    Its methods, signals and properties are on
    {!class-type-pollable_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Pollable_output_stream}. *)

(** The methods, signals and properties of a [GPollableOutputStream]. *)
class type pollable_output_stream_t = object
  method can_poll : unit -> bool
  method is_writable : unit -> bool
  method as_pollable_output_stream : Raw.Pollable_output_stream.t
end

class pollable_output_stream :
  Raw.Pollable_output_stream.t ->
  pollable_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Pollable_output_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GPollableOutputStream], give one already wrapped. *)
