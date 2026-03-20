class type permission_t = object
    method acquire : GCancellable.cancellable_t option -> (bool, GError.t) result
    method get_allowed : unit -> bool
    method get_can_acquire : unit -> bool
    method get_can_release : unit -> bool
    method impl_update : bool -> bool -> bool -> unit
    method release : GCancellable.cancellable_t option -> (bool, GError.t) result
    method as_permission : Permission.t
end

class permission : Permission.t -> permission_t

