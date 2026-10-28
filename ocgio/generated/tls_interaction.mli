(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TlsInteraction from cyclic group Tls_connection_and__tls_database_and__tls_interaction *)

(** [GTlsInteraction] provides a mechanism for the TLS connection and database
    code to interact with the user. It can be used to ask the user for
    passwords.

    Its methods, signals and properties are on {!class-type-tls_interaction_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgio.Raw.Tls_interaction}. *)

(** {1:class Class} *)

class type tls_interaction_t =
  Tls_connection_and__tls_database_and__tls_interaction.tls_interaction_t
(** {b The methods, signals and properties of a [TlsInteraction].}

    Inherits from: [GObject.Object]

    [GTlsInteraction] provides a mechanism for the TLS connection and database
    code to interact with the user. It can be used to ask the user for
    passwords.

    To use a [GTlsInteraction] with a TLS connection use
    [Gio.TlsConnection.set_interaction].

    Callers should instantiate a derived class that implements the various
    interaction methods to show the required dialogs.

    Callers should use the 'invoke' functions like
    [Gio.TlsInteraction.invoke_ask_password] to run interaction methods. These
    functions make sure that the interaction is invoked in the main loop and not
    in the current thread, if the current thread is not running the main loop.

    Derived classes can choose to implement whichever interactions methods
    they’d like to support by overriding those virtual methods in their class
    initialization function. Any interactions not implemented will return
    [G_TLS_INTERACTION_UNHANDLED]. If a derived class implements an async
    method, it must also implement the corresponding finish method. *)

class tls_interaction : Raw.Tls_interaction.t -> tls_interaction_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_interaction.t}. *)

(** {1:description Description}

    [GTlsInteraction] provides a mechanism for the TLS connection and database
    code to interact with the user. It can be used to ask the user for
    passwords.

    To use a [GTlsInteraction] with a TLS connection use
    [Gio.TlsConnection.set_interaction].

    Callers should instantiate a derived class that implements the various
    interaction methods to show the required dialogs.

    Callers should use the 'invoke' functions like
    [Gio.TlsInteraction.invoke_ask_password] to run interaction methods. These
    functions make sure that the interaction is invoked in the main loop and not
    in the current thread, if the current thread is not running the main loop.

    Derived classes can choose to implement whichever interactions methods
    they’d like to support by overriding those virtual methods in their class
    initialization function. Any interactions not implemented will return
    [G_TLS_INTERACTION_UNHANDLED]. If a derived class implements an async
    method, it must also implement the corresponding finish method. *)
