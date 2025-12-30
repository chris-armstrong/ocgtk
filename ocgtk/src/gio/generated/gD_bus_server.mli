class d_bus_server : D_bus_server.t ->
  object
    inherit Gd_bus_server_signals.d_bus_server_signals
    method get_client_address : unit -> string
    method get_flags : unit -> Gio_enums.dbusserverflags
    method get_guid : unit -> string
    method is_active : unit -> bool
    method start : unit -> unit
    method stop : unit -> unit
    method active : bool
    method address : string
    method authentication_observer : GD_bus_auth_observer.d_bus_auth_observer
    method as_d_bus_server : D_bus_server.t
  end

