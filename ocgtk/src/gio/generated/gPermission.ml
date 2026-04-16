class type permission_t = object
    method acquire : GCancellable.cancellable_t option -> (bool, GError.t) result
    method acquire_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method get_allowed : unit -> bool
    method get_can_acquire : unit -> bool
    method get_can_release : unit -> bool
    method impl_update : bool -> bool -> bool -> unit
    method release : GCancellable.cancellable_t option -> (bool, GError.t) result
    method release_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method as_permission : Permission.t
end

(* High-level class for Permission *)
class permission (obj : Permission.t) : permission_t = object (self)

  method acquire : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Permission.acquire obj cancellable)

  method acquire_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Permission.acquire_finish obj result)

  method get_allowed : unit -> bool =
    fun () ->
      (Permission.get_allowed obj)

  method get_can_acquire : unit -> bool =
    fun () ->
      (Permission.get_can_acquire obj)

  method get_can_release : unit -> bool =
    fun () ->
      (Permission.get_can_release obj)

  method impl_update : bool -> bool -> bool -> unit =
    fun allowed can_acquire can_release ->
      (Permission.impl_update obj allowed can_acquire can_release)

  method release : GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Permission.release obj cancellable)

  method release_finish : GAsync_result.async_result_t -> (bool, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Permission.release_finish obj result)

    method as_permission = obj
end

