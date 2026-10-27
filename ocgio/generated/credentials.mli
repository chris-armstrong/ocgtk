class type credentials_t = object
  method is_same_user : credentials_t -> (bool, GError.t) result
  method to_string : unit -> string
  method as_credentials : Raw.Credentials.t
end

class credentials : Raw.Credentials.t -> credentials_t

val new_ : unit -> credentials_t
