(** Bindings for [GIOStreamAdapter].

    Its methods, signals and properties are on
    {!class-type-io_stream_adapter_t}. The functions it is built on are in
    {!Ocgio.Raw.Io_stream_adapter}. *)

(** The methods, signals and properties of a [GIOStreamAdapter]. *)
class type io_stream_adapter_t = object
  method as_io_stream_adapter : Raw.Io_stream_adapter.t
end

class io_stream_adapter : Raw.Io_stream_adapter.t -> io_stream_adapter_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Io_stream_adapter.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GIOStreamAdapter], give one already wrapped. *)
