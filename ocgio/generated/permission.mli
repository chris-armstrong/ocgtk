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

class permission : Raw.Permission.t -> permission_t
