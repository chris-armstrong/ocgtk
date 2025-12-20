(* Signal class defined in gd_bus_server_signals.ml *)

(* High-level class for DBusServer *)
class d_bus_server (obj : D_bus_server.t) = object (self)
  inherit Gd_bus_server_signals.d_bus_server_signals obj

  method get_client_address : unit -> string =
    fun () ->
      (D_bus_server.get_client_address obj)

  method get_guid : unit -> string =
    fun () ->
      (D_bus_server.get_guid obj)

  method is_active : unit -> bool =
    fun () ->
      (D_bus_server.is_active obj)

  method start : unit -> unit =
    fun () ->
      (D_bus_server.start obj)

  method stop : unit -> unit =
    fun () ->
      (D_bus_server.stop obj)

  method active = D_bus_server.get_active obj

  method address = D_bus_server.get_address obj

  method authentication_observer = new GD_bus_auth_observer.d_bus_auth_observer (D_bus_server.get_authentication_observer obj)

    method as_d_bus_server = obj
end

