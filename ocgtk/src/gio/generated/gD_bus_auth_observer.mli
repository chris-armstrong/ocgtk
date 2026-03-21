class type d_bus_auth_observer_t = object
    inherit Gd_bus_auth_observer_signals.d_bus_auth_observer_signals
    method allow_mechanism : string -> bool
    method authorize_authenticated_peer : GIo_stream.io_stream_t -> GCredentials.credentials_t option -> bool
    method as_d_bus_auth_observer : D_bus_auth_observer.t
end

class d_bus_auth_observer : D_bus_auth_observer.t -> d_bus_auth_observer_t

