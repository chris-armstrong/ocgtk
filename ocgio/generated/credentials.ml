class type credentials_t = object
  method is_same_user : credentials_t -> (bool, GError.t) result
  method to_string : unit -> string
  method as_credentials : Credentials.t
end

(* High-level class for Credentials *)
class credentials (obj : Credentials.t) : credentials_t =
  object (self)
    method is_same_user : credentials_t -> (bool, GError.t) result =
      fun other_credentials ->
        let other_credentials = other_credentials#as_credentials in
        Credentials.is_same_user obj other_credentials

    method to_string : unit -> string = fun () -> Credentials.to_string obj
    method as_credentials = obj
  end

let new_ () : credentials_t = new credentials (Credentials.new_ ())
