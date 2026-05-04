class type d_bus_auth_observer_t = object
  method on_allow_mechanism :
    callback:(mechanism:string -> bool) -> Gobject.Signal.handler_id

  method allow_mechanism : string -> bool

  method authorize_authenticated_peer :
    GIo_stream.io_stream_t -> GCredentials.credentials_t option -> bool

  method as_d_bus_auth_observer : D_bus_auth_observer.t
end

class d_bus_auth_observer : D_bus_auth_observer.t -> d_bus_auth_observer_t

val new_ : unit -> d_bus_auth_observer_t
