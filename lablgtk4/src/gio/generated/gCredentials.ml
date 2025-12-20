(* High-level class for Credentials *)
class credentials (obj : Credentials.t) = object (self)

  method get_unix_pid : unit -> (int, GError.t) result =
    fun () ->
      (Credentials.get_unix_pid obj)

  method get_unix_user : unit -> (int, GError.t) result =
    fun () ->
      (Credentials.get_unix_user obj)

  method is_same_user : 'p1. (<as_credentials: Credentials.t; ..> as 'p1) -> (bool, GError.t) result =
    fun other_credentials ->
      let other_credentials = other_credentials#as_credentials in
      (Credentials.is_same_user obj other_credentials)

  method set_unix_user : int -> (bool, GError.t) result =
    fun uid ->
      (Credentials.set_unix_user obj uid)

  method to_string : unit -> string =
    fun () ->
      (Credentials.to_string obj)

    method as_credentials = obj
end

