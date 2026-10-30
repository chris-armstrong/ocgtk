class type credentials_t = object
  (** {2:methods Methods} *)

  method is_same_user : credentials_t -> (bool, GError.t) result
  (** Checks if [credentials] and [other_credentials] is the same user.

      This operation can fail if [GCredentials] is not supported on the the OS.
  *)

  method to_string : unit -> string
  (** Creates a human-readable textual representation of [credentials] that can
      be used in logging and debug messages. The format of the returned string
      may change in future GLib release. *)

  (** {2:conversions Conversions} *)

  method as_credentials : Raw.Credentials.t
end

(* High-level class for Credentials *)
class credentials (obj : Raw.Credentials.t) : credentials_t =
  object (self)
    method is_same_user : credentials_t -> (bool, GError.t) result =
      fun other_credentials ->
        let other_credentials = other_credentials#as_credentials in
        Raw.Credentials.is_same_user obj other_credentials

    method to_string : unit -> string = fun () -> Raw.Credentials.to_string obj
    method as_credentials = obj
  end

let new_ () : credentials_t = new credentials (Raw.Credentials.new_ ())
