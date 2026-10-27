(** Base class for output stream implementations that perform some kind of
    filtering operation on a base stream. Typical examples of filtering
    operations are character set conversion, compression and byte order
    flipping.

    Its methods, signals and properties are on
    {!class-type-filter_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Filter_output_stream}. *)

(** The methods, signals and properties of a [GFilterOutputStream]. *)
class type filter_output_stream_t = object
  inherit Output_stream.output_stream_t

  method get_base_stream : unit -> Output_stream.output_stream_t
  (** Gets the base stream for the filter stream. *)

  method get_close_base_stream : unit -> bool
  (** Returns whether the base stream will be closed when [stream] is closed. *)

  method set_close_base_stream : bool -> unit
  (** Sets whether the base stream will be closed when [stream] is closed. *)

  method as_filter_output_stream : Raw.Filter_output_stream.t
end

class filter_output_stream :
  Raw.Filter_output_stream.t ->
  filter_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Filter_output_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GFilterOutputStream], give one already wrapped. *)
