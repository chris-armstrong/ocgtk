(* GENERATED CODE - DO NOT EDIT *)
(* SocketAddressEnumerator, a member of the cyclic module Socket_address_and__socket_address_enumerator_and__socket_connectable *)

(** [GSocketAddressEnumerator] is an enumerator type for
    {{!Ocgio.Raw.Socket_address}[Gio.SocketAddress]} instances. It is returned
    by enumeration functions such as [Gio.SocketConnectable.enumerate], which
    returns a [GSocketAddressEnumerator] to list each
    {{!Ocgio.Raw.Socket_address}[Gio.SocketAddress]} which could be used to
    connect to that {{!Ocgio.Raw.Socket_connectable}[Gio.SocketConnectable]}.

    Enumeration is typically a blocking operation, so the asynchronous methods
    [Gio.SocketAddressEnumerator.next_async] and
    [Gio.SocketAddressEnumerator.next_finish] should be used where possible.

    Each [GSocketAddressEnumerator] can only be enumerated once. Once
    [Gio.SocketAddressEnumerator.next] has returned [None], further enumeration
    with that [GSocketAddressEnumerator] is not possible, and it can be
    unreffed.

    The class built on this module is in {!Ocgio.Socket_address_enumerator}. *)

include module type of struct
  include
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .Socket_address_enumerator
end
