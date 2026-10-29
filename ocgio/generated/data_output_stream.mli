(** Data output stream implements [Gio.OutputStream] and includes functions for
    writing data directly to an output stream.

    Its methods, signals and properties are on
    {!class-type-data_output_stream_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Data_output_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DataOutputStream].}

    Inherits from:
    {{!Ocgio.Filter_output_stream.class-type-filter_output_stream_t}Ocgio.Filter_output_stream}

    Implements:
    - {{!Ocgio.Seekable.class-type-seekable_t}Ocgio.Seekable}

    Data output stream implements [Gio.OutputStream] and includes functions for
    writing data directly to an output stream. *)
class type data_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method get_byte_order : unit -> Enums.datastreambyteorder
  (** Gets the byte order for the stream. *)

  method put_int16 :
    Int16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a signed 16-bit integer into the output stream. *)

  method put_int32 :
    Int32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a signed 32-bit integer into the output stream. *)

  method put_int64 :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a signed 64-bit integer into the stream. *)

  method put_string :
    string -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts a string into the output stream. *)

  method put_uint16 :
    UInt16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts an unsigned 16-bit integer into the output stream. *)

  method put_uint32 :
    UInt32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts an unsigned 32-bit integer into the stream. *)

  method put_uint64 :
    UInt64.t -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Puts an unsigned 64-bit integer into the stream. *)

  method set_byte_order : Enums.datastreambyteorder -> unit
  (** Sets the byte order of the data output stream to [order]. *)

  (** {2:conversions Conversions} *)

  method as_data_output_stream : Raw.Data_output_stream.t
end

class data_output_stream : Raw.Data_output_stream.t -> data_output_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Data_output_stream.t}. *)

(** {1:constructors Constructors} *)

val new_ : Output_stream.output_stream_t -> data_output_stream_t
(** Creates a new data output stream for [base_stream]. *)
