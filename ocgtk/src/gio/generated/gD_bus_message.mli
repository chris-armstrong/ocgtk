class d_bus_message : D_bus_message.t ->
  object
    method copy : unit -> (d_bus_message, GError.t) result
    method get_arg0 : unit -> string option
    method get_arg0_path : unit -> string option
    method get_byte_order : unit -> Gio_enums.dbusmessagebyteorder
    method get_destination : unit -> string option
    method get_error_name : unit -> string option
    method get_flags : unit -> Gio_enums.dbusmessageflags
    method get_interface : unit -> string option
    method get_locked : unit -> bool
    method get_member : unit -> string option
    method get_message_type : unit -> Gio_enums.dbusmessagetype
    method get_path : unit -> string option
    method get_sender : unit -> string option
    method get_signature : unit -> string
    method get_unix_fd_list : unit -> GUnix_fd_list.unix_fd_list option
    method lock : unit -> unit
    method new_method_error_literal : string -> string -> d_bus_message
    method new_method_reply : unit -> d_bus_message
    method print : int -> string
    method set_byte_order : Gio_enums.dbusmessagebyteorder -> unit
    method set_destination : string option -> unit
    method set_error_name : string -> unit
    method set_flags : Gio_enums.dbusmessageflags -> unit
    method set_interface : string option -> unit
    method set_member : string option -> unit
    method set_message_type : Gio_enums.dbusmessagetype -> unit
    method set_path : string option -> unit
    method set_sender : string option -> unit
    method set_signature : string option -> unit
    method set_unix_fd_list : #GUnix_fd_list.unix_fd_list option -> unit
    method to_gerror : unit -> (bool, GError.t) result
    method as_d_bus_message : D_bus_message.t
  end

