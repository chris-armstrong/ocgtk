class type output_message_t = object
  method get_address :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method set_address :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    unit

  method get_vectors : Output_vector.t
  method set_vectors : Output_vector.t -> unit
  method get_num_vectors : int
  method set_num_vectors : int -> unit
  method get_bytes_sent : int
  method set_bytes_sent : int -> unit
  method get_num_control_messages : int
  method set_num_control_messages : int -> unit
  method as_output_message : Output_message.t
end

class output_message : Output_message.t -> output_message_t

val make :
  GSocket_address_and__socket_address_enumerator_and__socket_connectable
  .socket_address_t ->
  Output_vector.t ->
  int ->
  int ->
  int ->
  output_message_t
