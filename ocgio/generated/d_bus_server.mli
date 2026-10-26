class type d_bus_server_t = object
  inherit Initable.initable_t

  method on_new_connection :
    ?after:bool ->
    callback:(connection:D_bus_connection.d_bus_connection_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_client_address : unit -> string
  method get_flags : unit -> Enums.dbusserverflags
  method get_guid : unit -> string
  method is_active : unit -> bool
  method start : unit -> unit
  method stop : unit -> unit
  method address : string
  method authentication_observer : D_bus_auth_observer.d_bus_auth_observer_t
  method as_d_bus_server : Raw.D_bus_server.t
end

class d_bus_server : Raw.D_bus_server.t -> d_bus_server_t

val new_sync :
  string ->
  Enums.dbusserverflags ->
  string ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_server_t, GError.t) result
