(* GENERATED CODE - DO NOT EDIT *)
(* Credentials: Credentials *)

type t = [`credentials | `object_] Gobject.obj

(** Create a new Credentials *)
external new_ : unit -> t = "ml_g_credentials_new"

(* Methods *)
(** Creates a human-readable textual representation of @credentials
that can be used in logging and debug messages. The format of the
returned string may change in future GLib release. *)
external to_string : t -> string = "ml_g_credentials_to_string"

(** Tries to set the UNIX user identifier on @credentials. This method
is only available on UNIX platforms.

This operation can fail if #GCredentials is not supported on the
OS or if the native credentials type does not contain information
about the UNIX user. It can also fail if the OS does not allow the
use of "spoofed" credentials. *)
external set_unix_user : t -> int -> (bool, GError.t) result = "ml_g_credentials_set_unix_user"

(** Checks if @credentials and @other_credentials is the same user.

This operation can fail if #GCredentials is not supported on the
the OS. *)
external is_same_user : t -> t -> (bool, GError.t) result = "ml_g_credentials_is_same_user"

(** Tries to get the UNIX user identifier from @credentials. This
method is only available on UNIX platforms.

This operation can fail if #GCredentials is not supported on the
OS or if the native credentials type does not contain information
about the UNIX user. *)
external get_unix_user : t -> (int, GError.t) result = "ml_g_credentials_get_unix_user"

(** Tries to get the UNIX process identifier from @credentials. This
method is only available on UNIX platforms.

This operation can fail if #GCredentials is not supported on the
OS or if the native credentials type does not contain information
about the UNIX process ID. *)
external get_unix_pid : t -> (int, GError.t) result = "ml_g_credentials_get_unix_pid"

