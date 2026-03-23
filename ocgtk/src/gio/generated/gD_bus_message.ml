class type d_bus_message_t = object
    method copy : unit -> (d_bus_message_t, GError.t) result
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
    method get_unix_fd_list : unit -> GUnix_fd_list.unix_fd_list_t option
    method lock : unit -> unit
    method new_method_error_literal : string -> string -> d_bus_message_t
    method new_method_reply : unit -> d_bus_message_t
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
    method set_unix_fd_list : GUnix_fd_list.unix_fd_list_t option -> unit
    method to_gerror : unit -> (bool, GError.t) result
    method as_d_bus_message : D_bus_message.t
end

(* High-level class for DBusMessage *)
class d_bus_message (obj : D_bus_message.t) : d_bus_message_t = object (self)

  method copy : unit -> (d_bus_message_t, GError.t) result =
    fun () ->
      Result.map (fun ret -> new d_bus_message ret)(D_bus_message.copy obj)

  method get_arg0 : unit -> string option =
    fun () ->
      (D_bus_message.get_arg0 obj)

  method get_arg0_path : unit -> string option =
    fun () ->
      (D_bus_message.get_arg0_path obj)

  method get_byte_order : unit -> Gio_enums.dbusmessagebyteorder =
    fun () ->
      (D_bus_message.get_byte_order obj)

  method get_destination : unit -> string option =
    fun () ->
      (D_bus_message.get_destination obj)

  method get_error_name : unit -> string option =
    fun () ->
      (D_bus_message.get_error_name obj)

  method get_flags : unit -> Gio_enums.dbusmessageflags =
    fun () ->
      (D_bus_message.get_flags obj)

  method get_interface : unit -> string option =
    fun () ->
      (D_bus_message.get_interface obj)

  method get_locked : unit -> bool =
    fun () ->
      (D_bus_message.get_locked obj)

  method get_member : unit -> string option =
    fun () ->
      (D_bus_message.get_member obj)

  method get_message_type : unit -> Gio_enums.dbusmessagetype =
    fun () ->
      (D_bus_message.get_message_type obj)

  method get_path : unit -> string option =
    fun () ->
      (D_bus_message.get_path obj)

  method get_sender : unit -> string option =
    fun () ->
      (D_bus_message.get_sender obj)

  method get_signature : unit -> string =
    fun () ->
      (D_bus_message.get_signature obj)

  method get_unix_fd_list : unit -> GUnix_fd_list.unix_fd_list_t option =
    fun () ->
      Option.map (fun ret -> new GUnix_fd_list.unix_fd_list ret) (D_bus_message.get_unix_fd_list obj)

  method lock : unit -> unit =
    fun () ->
      (D_bus_message.lock obj)

  method new_method_error_literal : string -> string -> d_bus_message_t =
    fun error_name error_message ->
      new  d_bus_message(D_bus_message.new_method_error_literal obj error_name error_message)

  method new_method_reply : unit -> d_bus_message_t =
    fun () ->
      new  d_bus_message(D_bus_message.new_method_reply obj)

  method print : int -> string =
    fun indent ->
      (D_bus_message.print obj indent)

  method set_byte_order : Gio_enums.dbusmessagebyteorder -> unit =
    fun byte_order ->
      (D_bus_message.set_byte_order obj byte_order)

  method set_destination : string option -> unit =
    fun value ->
      (D_bus_message.set_destination obj value)

  method set_error_name : string -> unit =
    fun value ->
      (D_bus_message.set_error_name obj value)

  method set_flags : Gio_enums.dbusmessageflags -> unit =
    fun flags ->
      (D_bus_message.set_flags obj flags)

  method set_interface : string option -> unit =
    fun value ->
      (D_bus_message.set_interface obj value)

  method set_member : string option -> unit =
    fun value ->
      (D_bus_message.set_member obj value)

  method set_message_type : Gio_enums.dbusmessagetype -> unit =
    fun type_ ->
      (D_bus_message.set_message_type obj type_)

  method set_path : string option -> unit =
    fun value ->
      (D_bus_message.set_path obj value)

  method set_sender : string option -> unit =
    fun value ->
      (D_bus_message.set_sender obj value)

  method set_signature : string option -> unit =
    fun value ->
      (D_bus_message.set_signature obj value)

  method set_unix_fd_list : GUnix_fd_list.unix_fd_list_t option -> unit =
    fun fd_list ->
      let fd_list = Option.map (fun (c) -> c#as_unix_fd_list) fd_list in
      (D_bus_message.set_unix_fd_list obj fd_list)

  method to_gerror : unit -> (bool, GError.t) result =
    fun () ->
      (D_bus_message.to_gerror obj)

    method as_d_bus_message = obj
end

let new_ () : d_bus_message_t =
  new d_bus_message (D_bus_message.new_ ())

let new_method_call (name : string option) (path : string) (interface_ : string option) (method_ : string) : d_bus_message_t =
  new d_bus_message (D_bus_message.new_method_call name path interface_ method_)

let new_signal (path : string) (interface_ : string) (signal : string) : d_bus_message_t =
  new d_bus_message (D_bus_message.new_signal path interface_ signal)

