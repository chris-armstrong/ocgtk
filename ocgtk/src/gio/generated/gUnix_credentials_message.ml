(* High-level class for UnixCredentialsMessage *)
class unix_credentials_message (obj : Unix_credentials_message.t) = object (self)

  method get_credentials : unit -> GCredentials.credentials =
    fun () ->
      new  GCredentials.credentials(Unix_credentials_message.get_credentials obj)

    method as_unix_credentials_message = obj
end

