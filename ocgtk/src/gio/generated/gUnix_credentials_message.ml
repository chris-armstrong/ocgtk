class type unix_credentials_message_t = object
    method get_credentials : unit -> GCredentials.credentials_t
    method as_unix_credentials_message : Unix_credentials_message.t
end

(* High-level class for UnixCredentialsMessage *)
class unix_credentials_message (obj : Unix_credentials_message.t) : unix_credentials_message_t = object (self)

  method get_credentials : unit -> GCredentials.credentials_t =
    fun () ->
      new  GCredentials.credentials(Unix_credentials_message.get_credentials obj)

    method as_unix_credentials_message = obj
end

