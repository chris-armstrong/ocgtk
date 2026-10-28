(** [GTlsFileDatabase] is implemented by [Gio.TlsDatabase] objects which load
    their certificate information from a file. It is an interface which TLS
    library specific subtypes implement.

    Its methods, signals and properties are on
    {!class-type-tls_file_database_t}. The functions it is built on are in
    {!Ocgio.Raw.Tls_file_database}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TlsFileDatabase].}

    [GTlsFileDatabase] is implemented by [Gio.TlsDatabase] objects which load
    their certificate information from a file. It is an interface which TLS
    library specific subtypes implement. *)
class type tls_file_database_t = object
  (** {2:properties Properties} *)

  method anchors : string
  (** The path to a file containing PEM encoded certificate authority root
      anchors. The certificates in this file will be treated as root authorities
      for the purpose of verifying other certificates via the
      g_tls_database_verify_chain() operation. *)

  method set_anchors : string -> unit
  (** The path to a file containing PEM encoded certificate authority root
      anchors. The certificates in this file will be treated as root authorities
      for the purpose of verifying other certificates via the
      g_tls_database_verify_chain() operation. *)

  (** {2:conversions Conversions} *)

  method as_tls_file_database : Raw.Tls_file_database.t
end

class tls_file_database : Raw.Tls_file_database.t -> tls_file_database_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_file_database.t}. *)
