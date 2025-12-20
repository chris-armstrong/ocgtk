class unix_credentials_message : Unix_credentials_message.t ->
  object
    method get_credentials : unit -> GCredentials.credentials
    method as_unix_credentials_message : Unix_credentials_message.t
  end

