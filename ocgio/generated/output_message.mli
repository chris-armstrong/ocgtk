(** Structure used for scatter/gather data output when sending multiple messages
    or packets in one go. You generally pass in an array of [GOutputVectors] and
    the operation will use all the buffers as if they were one buffer.

    Its methods, signals and properties are on {!class-type-output_message_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Output_message}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [OutputMessage].}

    Structure used for scatter/gather data output when sending multiple messages
    or packets in one go. You generally pass in an array of [GOutputVectors] and
    the operation will use all the buffers as if they were one buffer.

    If [address] is [NULL] then the message is sent to the default receiver (as
    previously set by g_socket_connect()). *)
class type output_message_t = object
  (** {2:conversions Conversions} *)

  method as_output_message : Raw.Output_message.t
end

class output_message : Raw.Output_message.t -> output_message_t
(** Wraps a raw handle of {!Ocgio.Raw.Output_message.t}. *)

(** {1:description Description}

    Structure used for scatter/gather data output when sending multiple messages
    or packets in one go. You generally pass in an array of [GOutputVectors] and
    the operation will use all the buffers as if they were one buffer.

    If [address] is [NULL] then the message is sent to the default receiver (as
    previously set by g_socket_connect()). *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
