class type input_message_t = object
  method get_address :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method set_address :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    unit

  method get_num_vectors : int
  method set_num_vectors : int -> unit
  method get_bytes_received : Gsize.t
  method set_bytes_received : Gsize.t -> unit
  method get_flags : int
  method set_flags : int -> unit
  method get_num_control_messages : int
  method set_num_control_messages : int -> unit
  method as_input_message : Input_message.t
end

class input_message : Input_message.t -> input_message_t

val make :
  GSocket_address_and__socket_address_enumerator_and__socket_connectable
  .socket_address_t ->
  int ->
  Gsize.t ->
  int ->
  int ->
  input_message_t
