(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TlsDatabase from cyclic group Tls_connection_and__tls_database_and__tls_interaction *)

(** [GTlsDatabase] is used to look up certificates and other information from a
    certificate or key store. It is an abstract base class which TLS library
    specific subtypes override.

    Its methods, signals and properties are on {!class-type-tls_database_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgio.Raw.Tls_database}. *)

(** {1:class Class} *)

class type tls_database_t =
  Tls_connection_and__tls_database_and__tls_interaction.tls_database_t
(** {b The methods, signals and properties of a [TlsDatabase].}

    Inherits from: [GObject.Object]

    [GTlsDatabase] is used to look up certificates and other information from a
    certificate or key store. It is an abstract base class which TLS library
    specific subtypes override.

    A [GTlsDatabase] may be accessed from multiple threads by the TLS backend.
    All implementations are required to be fully thread-safe.

    Most common client applications will not directly interact with
    [GTlsDatabase]. It is used internally by [Gio.TlsConnection]. *)

class tls_database : Raw.Tls_database.t -> tls_database_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_database.t}. *)

(** {1:description Description}

    [GTlsDatabase] is used to look up certificates and other information from a
    certificate or key store. It is an abstract base class which TLS library
    specific subtypes override.

    A [GTlsDatabase] may be accessed from multiple threads by the TLS backend.
    All implementations are required to be fully thread-safe.

    Most common client applications will not directly interact with
    [GTlsDatabase]. It is used internally by [Gio.TlsConnection]. *)
