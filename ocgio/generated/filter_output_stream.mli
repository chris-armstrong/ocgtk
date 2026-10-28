(** Base class for output stream implementations that perform some kind of
    filtering operation on a base stream. Typical examples of filtering
    operations are character set conversion, compression and byte order
    flipping.

    Its methods, signals and properties are on
    {!class-type-filter_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Filter_output_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FilterOutputStream].}

    Inherits from:
    {{!Ocgio.Output_stream.class-type-output_stream_t}Ocgio.Output_stream}

    Base class for output stream implementations that perform some kind of
    filtering operation on a base stream. Typical examples of filtering
    operations are character set conversion, compression and byte order
    flipping. *)
class type filter_output_stream_t = object
  inherit Output_stream.output_stream_t

  (** {2:methods Methods} *)

  method get_base_stream : unit -> Output_stream.output_stream_t
  (** Gets the base stream for the filter stream. *)

  method get_close_base_stream : unit -> bool
  (** Returns whether the base stream will be closed when [stream] is closed. *)

  method set_close_base_stream : bool -> unit
  (** Sets whether the base stream will be closed when [stream] is closed. *)

  (** {2:conversions Conversions} *)

  method as_filter_output_stream : Raw.Filter_output_stream.t
end

class filter_output_stream :
  Raw.Filter_output_stream.t ->
  filter_output_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Filter_output_stream.t}. *)
