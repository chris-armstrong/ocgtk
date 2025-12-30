(* High-level class for ProxyAddress *)
class proxy_address (obj : Proxy_address.t) = object (self)

  method get_destination_hostname : unit -> string =
    fun () ->
      (Proxy_address.get_destination_hostname obj)

  method get_destination_protocol : unit -> string =
    fun () ->
      (Proxy_address.get_destination_protocol obj)

  method get_password : unit -> string option =
    fun () ->
      (Proxy_address.get_password obj)

  method get_protocol : unit -> string =
    fun () ->
      (Proxy_address.get_protocol obj)

  method get_uri : unit -> string option =
    fun () ->
      (Proxy_address.get_uri obj)

  method get_username : unit -> string option =
    fun () ->
      (Proxy_address.get_username obj)

    method as_proxy_address = obj
end

