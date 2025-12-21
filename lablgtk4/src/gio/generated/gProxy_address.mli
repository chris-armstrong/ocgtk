class proxy_address : Proxy_address.t ->
  object
    method get_destination_hostname : unit -> string
    method get_destination_protocol : unit -> string
    method get_password : unit -> string option
    method get_protocol : unit -> string
    method get_uri : unit -> string option
    method get_username : unit -> string option
    method as_proxy_address : Proxy_address.t
  end

