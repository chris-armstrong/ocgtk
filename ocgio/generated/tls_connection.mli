(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TlsConnection from cyclic group Tls_connection_and__tls_database_and__tls_interaction *)

class type tls_connection_t =
  GTls_connection_and__tls_database_and__tls_interaction.tls_connection_t

class tls_connection :
  Tls_connection_and__tls_database_and__tls_interaction.Tls_connection.t ->
  tls_connection_t
