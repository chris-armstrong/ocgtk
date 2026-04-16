(* Signal class defined in gd_bus_auth_observer_signals.ml *)

class type d_bus_auth_observer_t = object
  inherit Gd_bus_auth_observer_signals.d_bus_auth_observer_signals
  method allow_mechanism : string -> bool

  method authorize_authenticated_peer :
    GIo_stream.io_stream_t -> GCredentials.credentials_t option -> bool

  method as_d_bus_auth_observer : D_bus_auth_observer.t
end

(* High-level class for DBusAuthObserver *)
class d_bus_auth_observer (obj : D_bus_auth_observer.t) : d_bus_auth_observer_t
  =
  object (self)
    inherit Gd_bus_auth_observer_signals.d_bus_auth_observer_signals obj

    method allow_mechanism : string -> bool =
      fun mechanism -> D_bus_auth_observer.allow_mechanism obj mechanism

    method authorize_authenticated_peer :
        GIo_stream.io_stream_t -> GCredentials.credentials_t option -> bool =
      fun stream credentials ->
        let stream = stream#as_io_stream in
        let credentials = Option.map (fun c -> c#as_credentials) credentials in
        D_bus_auth_observer.authorize_authenticated_peer obj stream credentials

    method as_d_bus_auth_observer = obj
  end

let new_ () : d_bus_auth_observer_t =
  new d_bus_auth_observer (D_bus_auth_observer.new_ ())
