class type unix_credentials_message_t = object
  inherit Socket_control_message.socket_control_message_t
  method get_credentials : unit -> Credentials.credentials_t
  method as_unix_credentials_message : Raw.Unix_credentials_message.t
end

(* High-level class for UnixCredentialsMessage *)
class unix_credentials_message (obj : Raw.Unix_credentials_message.t) :
  unix_credentials_message_t =
  object (self)
    inherit
      Socket_control_message.socket_control_message
        (obj :> Raw.Socket_control_message.t)

    method get_credentials : unit -> Credentials.credentials_t =
      fun () ->
        new Credentials.credentials
          (Raw.Unix_credentials_message.get_credentials obj)

    method as_unix_credentials_message = obj
  end

let new_ () : unix_credentials_message_t =
  new unix_credentials_message (Raw.Unix_credentials_message.new_ ())

let new_with_credentials (credentials : Credentials.credentials_t) :
    unix_credentials_message_t =
  let credentials = credentials#as_credentials in
  let obj_ = Raw.Unix_credentials_message.new_with_credentials credentials in
  new unix_credentials_message obj_
