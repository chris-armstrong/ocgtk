(* GENERATED CODE - DO NOT EDIT *)
(* TlsDatabase, a member of the cyclic module Tls_connection_and__tls_database_and__tls_interaction *)

(** [GTlsDatabase] is used to look up certificates and other information from a
    certificate or key store. It is an abstract base class which TLS library
    specific subtypes override.

    A [GTlsDatabase] may be accessed from multiple threads by the TLS backend.
    All implementations are required to be fully thread-safe.

    Most common client applications will not directly interact with
    [GTlsDatabase]. It is used internally by [Gio.TlsConnection].

    The class built on this module is in {!Ocgio.Tls_database}. *)

include module type of struct
  include Tls_connection_and__tls_database_and__tls_interaction.Tls_database
end
