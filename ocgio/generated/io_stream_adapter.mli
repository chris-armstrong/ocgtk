(** Bindings for [IOStreamAdapter].

    Its methods, signals and properties are on
    {!class-type-io_stream_adapter_t}. The functions it is built on are in
    {!Ocgio.Raw.Io_stream_adapter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [IOStreamAdapter].} *)
class type io_stream_adapter_t = object
  method as_io_stream_adapter : Raw.Io_stream_adapter.t
end

class io_stream_adapter : Raw.Io_stream_adapter.t -> io_stream_adapter_t
(** Wraps a raw handle of {!Ocgio.Raw.Io_stream_adapter.t}. *)
