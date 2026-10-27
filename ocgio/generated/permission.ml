class type permission_t = object
  method acquire : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Attempts to acquire the permission represented by [permission].

      The precise method by which this happens depends on the permission and the
      underlying authentication mechanism. A simple example is that a dialog may
      appear asking the user to enter their password.

      You should check with g_permission_get_can_acquire() before calling this
      function.

      If the permission is acquired then [TRUE] is returned. Otherwise, [FALSE]
      is returned and [error] is set appropriately.

      This call is blocking, likely for a very long time (in the case that user
      interaction is required). See g_permission_acquire_async() for the
      non-blocking version. *)

  method acquire_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Collects the result of attempting to acquire the permission represented by
      [permission].

      This is the second half of the asynchronous version of
      g_permission_acquire(). *)

  method get_allowed : unit -> bool
  (** Gets the value of the 'allowed' property. This property is [TRUE] if the
      caller currently has permission to perform the action that [permission]
      represents the permission to perform. *)

  method get_can_acquire : unit -> bool
  (** Gets the value of the 'can-acquire' property. This property is [TRUE] if
      it is generally possible to acquire the permission by calling
      g_permission_acquire(). *)

  method get_can_release : unit -> bool
  (** Gets the value of the 'can-release' property. This property is [TRUE] if
      it is generally possible to release the permission by calling
      g_permission_release(). *)

  method impl_update : bool -> bool -> bool -> unit
  (** This function is called by the [GPermission] implementation to update the
      properties of the permission. You should never call this function except
      from a [GPermission] implementation.

      GObject notify signals are generated, as appropriate. *)

  method release : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Attempts to release the permission represented by [permission].

      The precise method by which this happens depends on the permission and the
      underlying authentication mechanism. In most cases the permission will be
      dropped immediately without further action.

      You should check with g_permission_get_can_release() before calling this
      function.

      If the permission is released then [TRUE] is returned. Otherwise, [FALSE]
      is returned and [error] is set appropriately.

      This call is blocking, likely for a very long time (in the case that user
      interaction is required). See g_permission_release_async() for the
      non-blocking version. *)

  method release_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Collects the result of attempting to release the permission represented by
      [permission].

      This is the second half of the asynchronous version of
      g_permission_release(). *)

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
