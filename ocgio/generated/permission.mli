(** A [GPermission] represents the status of the caller’s permission to perform
    a certain action.

    You can query if the action is currently allowed and if it is possible to
    acquire the permission so that the action will be allowed in the future.

    There is also an API to actually acquire the permission and one to release
    it.

    As an example, a [GPermission] might represent the ability for the user to
    write to a [Gio.Settings] object. This [GPermission] object could then be
    used to decide if it is appropriate to show a “Click here to unlock” button
    in a dialog and to provide the mechanism to invoke when that button is
    clicked.

    Its methods, signals and properties are on {!class-type-permission_t}. The
    functions it is built on are in {!Ocgio.Raw.Permission}. *)

(** The methods, signals and properties of a [GPermission]. *)
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
(** Wraps a layer 1 handle, {!Ocgio.Raw.Permission.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GPermission], give one already wrapped. *)
