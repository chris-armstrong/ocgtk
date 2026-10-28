(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for SocketAddressEnumerator from cyclic group Socket_address_and__socket_address_enumerator_and__socket_connectable *)

(** [GSocketAddressEnumerator] is an enumerator type for [Gio.SocketAddress]
    instances. It is returned by enumeration functions such as
    [Gio.SocketConnectable.enumerate], which returns a
    [GSocketAddressEnumerator] to list each [Gio.SocketAddress] which could be
    used to connect to that [Gio.SocketConnectable].

    Its methods, signals and properties are on
    {!class-type-socket_address_enumerator_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Socket_address_enumerator}.
*)

(** {1:class Class} *)

class type socket_address_enumerator_t =
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .socket_address_enumerator_t
(** {b The methods, signals and properties of a [SocketAddressEnumerator].}

    [GSocketAddressEnumerator] is an enumerator type for [Gio.SocketAddress]
    instances. It is returned by enumeration functions such as
    [Gio.SocketConnectable.enumerate], which returns a
    [GSocketAddressEnumerator] to list each [Gio.SocketAddress] which could be
    used to connect to that [Gio.SocketConnectable].

    Enumeration is typically a blocking operation, so the asynchronous methods
    [Gio.SocketAddressEnumerator.next_async] and
    [Gio.SocketAddressEnumerator.next_finish] should be used where possible.

    Each [GSocketAddressEnumerator] can only be enumerated once. Once
    [Gio.SocketAddressEnumerator.next] has returned [None], further enumeration
    with that [GSocketAddressEnumerator] is not possible, and it can be
    unreffed. *)

class socket_address_enumerator :
  Raw.Socket_address_enumerator.t ->
  socket_address_enumerator_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_address_enumerator.t}. *)

(** {1:description Description}

    [GSocketAddressEnumerator] is an enumerator type for [Gio.SocketAddress]
    instances. It is returned by enumeration functions such as
    [Gio.SocketConnectable.enumerate], which returns a
    [GSocketAddressEnumerator] to list each [Gio.SocketAddress] which could be
    used to connect to that [Gio.SocketConnectable].

    Enumeration is typically a blocking operation, so the asynchronous methods
    [Gio.SocketAddressEnumerator.next_async] and
    [Gio.SocketAddressEnumerator.next_finish] should be used where possible.

    Each [GSocketAddressEnumerator] can only be enumerated once. Once
    [Gio.SocketAddressEnumerator.next] has returned [None], further enumeration
    with that [GSocketAddressEnumerator] is not possible, and it can be
    unreffed. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
