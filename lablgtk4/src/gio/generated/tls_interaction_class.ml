(* GENERATED CODE - DO NOT EDIT *)
(* TlsInteractionClass: TlsInteractionClass *)

(** The class for #GTlsInteraction. Derived classes implement the various
virtual interaction methods to handle TLS interactions.

Derived classes can choose to implement whichever interactions methods they'd
like to support by overriding those virtual methods in their class
initialization function. If a derived class implements an async method,
it must also implement the corresponding finish method.

The synchronous interaction methods should implement to display modal dialogs,
and the asynchronous methods to display modeless dialogs.

If the user cancels an interaction, then the result should be
%G_TLS_INTERACTION_FAILED and the error should be set with a domain of
%G_IO_ERROR and code of %G_IO_ERROR_CANCELLED. *)
type t = [`tls_interaction_class] Gobject.obj

(* Methods *)
