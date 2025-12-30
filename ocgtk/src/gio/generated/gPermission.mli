class permission : Permission.t ->
  object
    method acquire : #GCancellable.cancellable option -> (bool, GError.t) result
    method get_allowed : unit -> bool
    method get_can_acquire : unit -> bool
    method get_can_release : unit -> bool
    method impl_update : bool -> bool -> bool -> unit
    method release : #GCancellable.cancellable option -> (bool, GError.t) result
    method as_permission : Permission.t
  end

