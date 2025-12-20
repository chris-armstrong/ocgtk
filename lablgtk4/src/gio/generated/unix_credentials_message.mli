(* GENERATED CODE - DO NOT EDIT *)
(* UnixCredentialsMessage: UnixCredentialsMessage *)

type t = [`unix_credentials_message | `socket_control_message | `object_] Gobject.obj

(** Create a new UnixCredentialsMessage *)
external new_ : unit -> t = "ml_g_unix_credentials_message_new"

(** Create a new UnixCredentialsMessage *)
external new_with_credentials : Credentials.t -> t = "ml_g_unix_credentials_message_new_with_credentials"

(* Methods *)
(** Gets the credentials stored in @message. *)
external get_credentials : t -> Credentials.t = "ml_g_unix_credentials_message_get_credentials"

(* Properties *)

