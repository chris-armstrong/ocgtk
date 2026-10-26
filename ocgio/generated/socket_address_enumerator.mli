(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for SocketAddressEnumerator from cyclic group Socket_address_and__socket_address_enumerator_and__socket_connectable *)

class type socket_address_enumerator_t =
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .socket_address_enumerator_t

class socket_address_enumerator :
  Raw.Socket_address_enumerator.t ->
  socket_address_enumerator_t
