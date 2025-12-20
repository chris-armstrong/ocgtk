(* High-level class for NetworkService *)
class network_service (obj : Network_service.t) = object (self)

  method get_domain : unit -> string =
    fun () ->
      (Network_service.get_domain obj)

  method get_protocol : unit -> string =
    fun () ->
      (Network_service.get_protocol obj)

  method get_scheme : unit -> string =
    fun () ->
      (Network_service.get_scheme obj)

  method get_service : unit -> string =
    fun () ->
      (Network_service.get_service obj)

  method set_scheme : string -> unit =
    fun scheme ->
      (Network_service.set_scheme obj scheme)

    method as_network_service = obj
end

