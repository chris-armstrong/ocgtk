(** A [GPermission] represents the status of the caller’s permission to perform
    a certain action.

    Its methods, signals and properties are on {!class-type-permission_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Permission}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Permission].}

    Inherits from: [GObject.Object]

    A [GPermission] represents the status of the caller’s permission to perform
    a certain action.

    You can query if the action is currently allowed and if it is possible to
    acquire the permission so that the action will be allowed in the future.

    There is also an API to actually acquire the permission and one to release
    it.

    As an example, a [GPermission] might represent the ability for the user to
    write to a [Gio.Settings] object. This [GPermission] object could then be
    used to decide if it is appropriate to show a “Click here to unlock” button
    in a dialog and to provide the mechanism to invoke when that button is
    clicked. *)
class type permission_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_permission : Raw.Permission.t
end

class permission : Raw.Permission.t -> permission_t
(** Wraps a raw handle of {!Ocgio.Raw.Permission.t}. *)

(** {1:description Description}

    A [GPermission] represents the status of the caller’s permission to perform
    a certain action.

    You can query if the action is currently allowed and if it is possible to
    acquire the permission so that the action will be allowed in the future.

    There is also an API to actually acquire the permission and one to release
    it.

    As an example, a [GPermission] might represent the ability for the user to
    write to a [Gio.Settings] object. This [GPermission] object could then be
    used to decide if it is appropriate to show a “Click here to unlock” button
    in a dialog and to provide the mechanism to invoke when that button is
    clicked. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
