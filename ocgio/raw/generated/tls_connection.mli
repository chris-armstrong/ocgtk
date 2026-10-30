(* GENERATED CODE - DO NOT EDIT *)
(* TlsConnection, a member of the cyclic module Tls_connection_and__tls_database_and__tls_interaction *)

(** [GTlsConnection] is the base TLS connection class type, which wraps a
    {{!Ocgio.Raw.Io_stream}[Gio.IOStream]} and provides TLS encryption on top of
    it. Its subclasses,
    {{!Ocgio.Raw.Tls_client_connection}[Gio.TlsClientConnection]} and
    {{!Ocgio.Raw.Tls_server_connection}[Gio.TlsServerConnection]}, implement
    client-side and server-side TLS, respectively.

    For DTLS (Datagram TLS) support, see
    {{!Ocgio.Raw.Dtls_connection}[Gio.DtlsConnection]}.

    The class built on this module is in {!Ocgio.Tls_connection}. *)

include module type of struct
  include Tls_connection_and__tls_database_and__tls_interaction.Tls_connection
end
