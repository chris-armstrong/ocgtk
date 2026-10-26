class type proxy_address_t = object
  inherit GInet_socket_address.inet_socket_address_t
  method get_destination_hostname : unit -> string
  method get_destination_port : unit -> UInt16.t
  method get_destination_protocol : unit -> string
  method get_password : unit -> string option
  method get_protocol : unit -> string
  method get_uri : unit -> string option
  method get_username : unit -> string option
  method as_proxy_address : Proxy_address.t
end

class proxy_address : Proxy_address.t -> proxy_address_t

val new_ :
  GInet_address.inet_address_t ->
  UInt16.t ->
  string ->
  string ->
  UInt16.t ->
  string option ->
  string option ->
  proxy_address_t
