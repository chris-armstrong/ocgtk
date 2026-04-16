(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type socket_address_t = object
    method get_family : unit -> Gio_enums.socketfamily
    method get_native_size : unit -> int
    method as_socket_address : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.t
end

and socket_address_enumerator_t = object
    method next : GCancellable.cancellable_t option -> (socket_address_t option, GError.t) result
    method next_finish : GAsync_result.async_result_t -> (socket_address_t option, GError.t) result
    method as_socket_address_enumerator : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address_enumerator.t
end

and socket_connectable_t = object
    method enumerate : unit -> socket_address_enumerator_t
    method proxy_enumerate : unit -> socket_address_enumerator_t
    method to_string : unit -> string
    method as_socket_connectable : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.t
end


class socket_address (obj : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.t) : socket_address_t = object (self)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.get_family obj)

  method get_native_size : unit -> int =
    fun () ->
      (Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.get_native_size obj)

    method as_socket_address = obj
end

and socket_address_enumerator (obj : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address_enumerator.t) : socket_address_enumerator_t = object (self)

  method next : GCancellable.cancellable_t option -> (socket_address_t option, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new socket_address ret) ret)(Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address_enumerator.next obj cancellable)

  method next_finish : GAsync_result.async_result_t -> (socket_address_t option, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> Option.map (fun ret -> new socket_address ret) ret)(Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address_enumerator.next_finish obj result)

    method as_socket_address_enumerator = obj
end

and socket_connectable (obj : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.t) : socket_connectable_t = object (self)

  method enumerate : unit -> socket_address_enumerator_t =
    fun () ->
      new  socket_address_enumerator(Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.enumerate obj)

  method proxy_enumerate : unit -> socket_address_enumerator_t =
    fun () ->
      new  socket_address_enumerator(Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.proxy_enumerate obj)

  method to_string : unit -> string =
    fun () ->
      (Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.to_string obj)

    method as_socket_connectable = obj
end
