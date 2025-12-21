(* High-level class for CancellablePrivate *)
class cancellable_private (obj : Cancellable_private.t) = object (self)

    method as_cancellable_private = obj
end

