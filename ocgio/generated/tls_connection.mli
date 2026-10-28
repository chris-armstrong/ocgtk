(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TlsConnection from cyclic group Tls_connection_and__tls_database_and__tls_interaction *)

(** [GTlsConnection] is the base TLS connection class type, which wraps a
    [Gio.IOStream] and provides TLS encryption on top of it. Its subclasses,
    [Gio.TlsClientConnection] and [Gio.TlsServerConnection], implement
    client-side and server-side TLS, respectively.

    Its methods, signals and properties are on {!class-type-tls_connection_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgio.Raw.Tls_connection}. *)

(** {1:class Class} *)

class type tls_connection_t =
  Tls_connection_and__tls_database_and__tls_interaction.tls_connection_t
(** {b The methods, signals and properties of a [TlsConnection].}

    Inherits from: {{!Ocgio.Io_stream.class-type-io_stream_t}Ocgio.Io_stream}

    [GTlsConnection] is the base TLS connection class type, which wraps a
    [Gio.IOStream] and provides TLS encryption on top of it. Its subclasses,
    [Gio.TlsClientConnection] and [Gio.TlsServerConnection], implement
    client-side and server-side TLS, respectively.

    For DTLS (Datagram TLS) support, see [Gio.DtlsConnection]. *)

class tls_connection : Raw.Tls_connection.t -> tls_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_connection.t}. *)

(** {1:description Description}

    [GTlsConnection] is the base TLS connection class type, which wraps a
    [Gio.IOStream] and provides TLS encryption on top of it. Its subclasses,
    [Gio.TlsClientConnection] and [Gio.TlsServerConnection], implement
    client-side and server-side TLS, respectively.

    For DTLS (Datagram TLS) support, see [Gio.DtlsConnection]. *)
