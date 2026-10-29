(** Base class for input stream implementations that perform some kind of
    filtering operation on a base stream. Typical examples of filtering
    operations are character set conversion, compression and byte order
    flipping.

    Its methods, signals and properties are on
    {!class-type-filter_input_stream_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Filter_input_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FilterInputStream].}

    Inherits from:
    {{!Ocgio.Input_stream.class-type-input_stream_t}Ocgio.Input_stream}

    Base class for input stream implementations that perform some kind of
    filtering operation on a base stream. Typical examples of filtering
    operations are character set conversion, compression and byte order
    flipping. *)
class type filter_input_stream_t = object
  inherit Input_stream.input_stream_t

  (** {2:methods Methods} *)

  method get_base_stream : unit -> Input_stream.input_stream_t
  (** Gets the base stream for the filter stream. *)

  method get_close_base_stream : unit -> bool
  (** Returns whether the base stream will be closed when [stream] is closed. *)

  method set_close_base_stream : bool -> unit
  (** Sets whether the base stream will be closed when [stream] is closed. *)

  (** {2:conversions Conversions} *)

  method as_filter_input_stream : Raw.Filter_input_stream.t
end

class filter_input_stream : Raw.Filter_input_stream.t -> filter_input_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Filter_input_stream.t}. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
