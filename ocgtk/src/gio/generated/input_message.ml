(* GENERATED CODE - DO NOT EDIT *)
(* InputMessage: InputMessage *)

type t = [ `input_message ] Gobject.obj
(** Structure used for scatter/gather data input when receiving multiple
messages or packets in one go. You generally pass in an array of empty
#GInputVectors and the operation will use all the buffers as if they
were one buffer, and will set @bytes_received to the total number of bytes
received across all #GInputVectors.

This structure closely mirrors `struct mmsghdr` and `struct msghdr` from
the POSIX sockets API (see `man 2 recvmmsg`).

If @address is non-%NULL then it is set to the source address the message
was received from, and the caller must free it afterwards.

If @control_messages is non-%NULL then it is set to an array of control
messages received with the message (if any), and the caller must free it
afterwards. @num_control_messages is set to the number of elements in
this array, which may be zero.

Flags relevant to this message will be returned in @flags. For example,
`MSG_EOR` or `MSG_TRUNC`. *)

(* Methods *)

(* Record field accessors *)

(* Getters *)
external get_address :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_address
  .t = "ml_g_input_message_get_address"

external get_num_vectors : t -> int = "ml_g_input_message_get_num_vectors"

external get_bytes_received : t -> Gsize.t
  = "ml_g_input_message_get_bytes_received"

external get_flags : t -> int = "ml_g_input_message_get_flags"

external get_num_control_messages : t -> int
  = "ml_g_input_message_get_num_control_messages"

(* Setters *)
external set_address :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_address
  .t ->
  unit = "ml_g_input_message_set_address"

external set_num_vectors : t -> int -> unit
  = "ml_g_input_message_set_num_vectors"

external set_bytes_received : t -> Gsize.t -> unit
  = "ml_g_input_message_set_bytes_received"

external set_flags : t -> int -> unit = "ml_g_input_message_set_flags"

external set_num_control_messages : t -> int -> unit
  = "ml_g_input_message_set_num_control_messages"

external make :
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_address
  .t ->
  int ->
  Gsize.t ->
  int ->
  int ->
  t = "ml_g_input_message_make"
