(* GENERATED CODE - DO NOT EDIT *)
(* OutputMessage: OutputMessage *)

type t = [ `output_message ] Gobject.obj
(** Structure used for scatter/gather data output when sending multiple
messages or packets in one go. You generally pass in an array of
#GOutputVectors and the operation will use all the buffers as if they
were one buffer.

If @address is %NULL then the message is sent to the default receiver
(as previously set by g_socket_connect()). *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_address :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_address
  .t = "ml_g_output_message_get_address"

external get_vectors : t -> Output_vector.t = "ml_g_output_message_get_vectors"
external get_num_vectors : t -> int = "ml_g_output_message_get_num_vectors"
external get_bytes_sent : t -> int = "ml_g_output_message_get_bytes_sent"

external get_num_control_messages : t -> int
  = "ml_g_output_message_get_num_control_messages"

(* Setters *)
external set_address :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_address
  .t ->
  unit = "ml_g_output_message_set_address"

external set_vectors : t -> Output_vector.t -> unit
  = "ml_g_output_message_set_vectors"

external set_num_vectors : t -> int -> unit
  = "ml_g_output_message_set_num_vectors"

external set_bytes_sent : t -> int -> unit
  = "ml_g_output_message_set_bytes_sent"

external set_num_control_messages : t -> int -> unit
  = "ml_g_output_message_set_num_control_messages"

external make :
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_address
  .t ->
  Output_vector.t ->
  int ->
  int ->
  int ->
  t = "ml_g_output_message_make"
