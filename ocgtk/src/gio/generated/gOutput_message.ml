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

(* High-level class for OutputMessage *)
class output_message (obj : Output_message.t) : output_message_t =
  object (self)
    method get_address :
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t =
      new
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address
        (Output_message.get_address obj)

    method set_address :
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t ->
        unit =
      fun v -> Output_message.set_address obj v#as_socket_address

    method get_vectors : Output_vector.t = Output_message.get_vectors obj

    method set_vectors : Output_vector.t -> unit =
      fun v -> Output_message.set_vectors obj v

    method get_num_vectors : int = Output_message.get_num_vectors obj

    method set_num_vectors : int -> unit =
      fun v -> Output_message.set_num_vectors obj v

    method get_bytes_sent : int = Output_message.get_bytes_sent obj

    method set_bytes_sent : int -> unit =
      fun v -> Output_message.set_bytes_sent obj v

    method get_num_control_messages : int =
      Output_message.get_num_control_messages obj

    method set_num_control_messages : int -> unit =
      fun v -> Output_message.set_num_control_messages obj v

    method as_output_message = obj
  end

let make
    (address :
      GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t) (vectors : Output_vector.t) (num_vectors : int)
    (bytes_sent : int) (num_control_messages : int) : output_message_t =
  new output_message
    (Output_message.make address#as_socket_address vectors num_vectors
       bytes_sent num_control_messages)
