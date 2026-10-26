class type d_bus_auth_observer_t = object
  method on_allow_mechanism :
    ?after:bool ->
    callback:(mechanism:string -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_authorize_authenticated_peer :
    ?after:bool ->
    callback:
      (stream:Io_stream.io_stream_t ->
      credentials:Credentials.credentials_t option ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method allow_mechanism : string -> bool

  method authorize_authenticated_peer :
    Io_stream.io_stream_t -> Credentials.credentials_t option -> bool

  method as_d_bus_auth_observer : Raw.D_bus_auth_observer.t
end

class d_bus_auth_observer : Raw.D_bus_auth_observer.t -> d_bus_auth_observer_t

val new_ : unit -> d_bus_auth_observer_t
