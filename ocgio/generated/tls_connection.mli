(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TlsConnection from cyclic group Tls_connection_and__tls_database_and__tls_interaction *)

(** [GTlsConnection] is the base TLS connection class type, which wraps a
    [Gio.IOStream] and provides TLS encryption on top of it. Its subclasses,
    [Gio.TlsClientConnection] and [Gio.TlsServerConnection], implement
    client-side and server-side TLS, respectively.

    For DTLS (Datagram TLS) support, see [Gio.DtlsConnection].

    Its methods, signals and properties are on {!class-type-tls_connection_t}.
    The functions it is built on are in {!Ocgio.Raw.Tls_connection}. *)

class type tls_connection_t =
  Tls_connection_and__tls_database_and__tls_interaction.tls_connection_t
(** The methods, signals and properties of a [GTlsConnection]. *)

class tls_connection : Raw.Tls_connection.t -> tls_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GTlsConnection], give one already wrapped. *)
