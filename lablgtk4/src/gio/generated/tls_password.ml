(* GENERATED CODE - DO NOT EDIT *)
(* TlsPassword: TlsPassword *)

type t = [`tls_password | `object_] Gobject.obj

(** Create a new TlsPassword *)
external new_ : Gio_enums.tlspasswordflags -> string -> t = "ml_g_tls_password_new"

(* Methods *)
(** Set a user readable translated warning. Usually this warning is a
representation of the password flags returned from
g_tls_password_get_flags(). *)
external set_warning : t -> string -> unit = "ml_g_tls_password_set_warning"

(** Set flags about the password. *)
external set_flags : t -> Gio_enums.tlspasswordflags -> unit = "ml_g_tls_password_set_flags"

(** Set a description string about what the password will be used for. *)
external set_description : t -> string -> unit = "ml_g_tls_password_set_description"

(** Get a user readable translated warning. Usually this warning is a
representation of the password flags returned from
g_tls_password_get_flags(). *)
external get_warning : t -> string = "ml_g_tls_password_get_warning"

(** Get flags about the password. *)
external get_flags : t -> Gio_enums.tlspasswordflags = "ml_g_tls_password_get_flags"

(** Get a description string about what the password will be used for. *)
external get_description : t -> string = "ml_g_tls_password_get_description"

(* Properties *)

