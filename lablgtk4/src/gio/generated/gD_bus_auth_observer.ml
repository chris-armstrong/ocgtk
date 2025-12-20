(* Signal class defined in gd_bus_auth_observer_signals.ml *)

(* High-level class for DBusAuthObserver *)
class d_bus_auth_observer (obj : D_bus_auth_observer.t) = object (self)
  inherit Gd_bus_auth_observer_signals.d_bus_auth_observer_signals obj

  method allow_mechanism : string -> bool =
    fun mechanism ->
      (D_bus_auth_observer.allow_mechanism obj mechanism)

  method authorize_authenticated_peer : 'p1 'p2. (#GIo_stream.io_stream as 'p1) -> (#GCredentials.credentials as 'p2) option -> bool =
    fun stream credentials ->
      let stream = stream#as_io_stream in
      let credentials = Option.map (fun (c) -> c#as_credentials) credentials in
      (D_bus_auth_observer.authorize_authenticated_peer obj stream credentials)

    method as_d_bus_auth_observer = obj
end

