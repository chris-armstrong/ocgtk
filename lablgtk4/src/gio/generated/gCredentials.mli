class credentials : Credentials.t ->
  object
    method get_unix_pid : unit -> (int, GError.t) result
    method get_unix_user : unit -> (int, GError.t) result
    method is_same_user : <as_credentials: Credentials.t; ..> -> (bool, GError.t) result
    method set_unix_user : int -> (bool, GError.t) result
    method to_string : unit -> string
    method as_credentials : Credentials.t
  end

