class type unix_credentials_message_t = object
    method get_credentials : unit -> GCredentials.credentials_t
    method as_unix_credentials_message : Unix_credentials_message.t
end

class unix_credentials_message : Unix_credentials_message.t -> unix_credentials_message_t

