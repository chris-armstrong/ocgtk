class type unix_credentials_message_t = object
    inherit GSocket_control_message.socket_control_message_t
    method get_credentials : unit -> GCredentials.credentials_t
    method as_unix_credentials_message : Unix_credentials_message.t
end

class unix_credentials_message : Unix_credentials_message.t -> unix_credentials_message_t

val new_ : unit -> unix_credentials_message_t
val new_with_credentials : GCredentials.credentials_t -> unix_credentials_message_t
