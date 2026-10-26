class type unix_credentials_message_t = object
  inherit Socket_control_message.socket_control_message_t
  method get_credentials : unit -> Credentials.credentials_t
  method as_unix_credentials_message : Raw.Unix_credentials_message.t
end

class unix_credentials_message :
  Raw.Unix_credentials_message.t ->
  unix_credentials_message_t

val new_ : unit -> unix_credentials_message_t

val new_with_credentials :
  Credentials.credentials_t -> unix_credentials_message_t
