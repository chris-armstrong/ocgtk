(** Structure used for scatter/gather data output when sending multiple messages
    or packets in one go. You generally pass in an array of [GOutputVectors] and
    the operation will use all the buffers as if they were one buffer.

    If [address] is [NULL] then the message is sent to the default receiver (as
    previously set by g_socket_connect()).

    Its methods, signals and properties are on {!class-type-output_message_t}.
    The functions it is built on are in {!Ocgio.Raw.Output_message}. *)

(** The methods, signals and properties of a [GOutputMessage]. *)
class type output_message_t = object
  method as_output_message : Raw.Output_message.t
end

class output_message : Raw.Output_message.t -> output_message_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Output_message.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GOutputMessage], give one already wrapped. *)
