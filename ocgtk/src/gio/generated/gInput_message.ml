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

(* High-level class for InputMessage *)
class input_message (obj : Input_message.t) : input_message_t =
  object (self)
    method get_address :
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t =
      new
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address
        (Input_message.get_address obj)

    method set_address :
        GSocket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t ->
        unit =
      fun v -> Input_message.set_address obj v#as_socket_address

    method get_num_vectors : int = Input_message.get_num_vectors obj

    method set_num_vectors : int -> unit =
      fun v -> Input_message.set_num_vectors obj v

    method get_bytes_received : Gsize.t = Input_message.get_bytes_received obj

    method set_bytes_received : Gsize.t -> unit =
      fun v -> Input_message.set_bytes_received obj v

    method get_flags : int = Input_message.get_flags obj
    method set_flags : int -> unit = fun v -> Input_message.set_flags obj v

    method get_num_control_messages : int =
      Input_message.get_num_control_messages obj

    method set_num_control_messages : int -> unit =
      fun v -> Input_message.set_num_control_messages obj v

    method as_input_message = obj
  end

let make
    (address :
      GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t) (num_vectors : int) (bytes_received : Gsize.t)
    (flags : int) (num_control_messages : int) : input_message_t =
  new input_message
    (Input_message.make address#as_socket_address num_vectors bytes_received
       flags num_control_messages)
