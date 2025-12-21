(* High-level class for Permission *)
class permission (obj : Permission.t) = object (self)

  method acquire : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Permission.acquire obj cancellable)

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

  method release : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Permission.release obj cancellable)

    method as_permission = obj
end

