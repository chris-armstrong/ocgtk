class type permission_t = object
  method acquire : Cancellable.cancellable_t option -> (bool, GError.t) result
  method acquire_finish : Async_result.async_result_t -> (bool, GError.t) result
  method get_allowed : unit -> bool
  method get_can_acquire : unit -> bool
  method get_can_release : unit -> bool
  method impl_update : bool -> bool -> bool -> unit
  method release : Cancellable.cancellable_t option -> (bool, GError.t) result
  method release_finish : Async_result.async_result_t -> (bool, GError.t) result
  method as_permission : Raw.Permission.t
end

(* High-level class for Permission *)
class permission (obj : Raw.Permission.t) : permission_t =
  object (self)
    method acquire : Cancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Permission.acquire obj cancellable

    method acquire_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Permission.acquire_finish obj result

    method get_allowed : unit -> bool = fun () -> Raw.Permission.get_allowed obj

    method get_can_acquire : unit -> bool =
      fun () -> Raw.Permission.get_can_acquire obj

    method get_can_release : unit -> bool =
      fun () -> Raw.Permission.get_can_release obj

    method impl_update : bool -> bool -> bool -> unit =
      fun allowed can_acquire can_release ->
        Raw.Permission.impl_update obj allowed can_acquire can_release

    method release : Cancellable.cancellable_t option -> (bool, GError.t) result
        =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Permission.release obj cancellable

    method release_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Permission.release_finish obj result

    method as_permission = obj
  end
