(* GENERATED CODE - DO NOT EDIT *)
(* Permission: Permission *)

type t = [`permission | `object_] Gobject.obj

(* Methods *)
(** Attempts to release the permission represented by @permission.

The precise method by which this happens depends on the permission
and the underlying authentication mechanism.  In most cases the
permission will be dropped immediately without further action.

You should check with g_permission_get_can_release() before calling
this function.

If the permission is released then %TRUE is returned.  Otherwise,
%FALSE is returned and @error is set appropriately.

This call is blocking, likely for a very long time (in the case that
user interaction is required).  See g_permission_release_async() for
the non-blocking version. *)
external release : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_permission_release"

(** This function is called by the #GPermission implementation to update
the properties of the permission.  You should never call this
function except from a #GPermission implementation.

GObject notify signals are generated, as appropriate. *)
external impl_update : t -> bool -> bool -> bool -> unit = "ml_g_permission_impl_update"

(** Gets the value of the 'can-release' property.  This property is %TRUE
if it is generally possible to release the permission by calling
g_permission_release(). *)
external get_can_release : t -> bool = "ml_g_permission_get_can_release"

(** Gets the value of the 'can-acquire' property.  This property is %TRUE
if it is generally possible to acquire the permission by calling
g_permission_acquire(). *)
external get_can_acquire : t -> bool = "ml_g_permission_get_can_acquire"

(** Gets the value of the 'allowed' property.  This property is %TRUE if
the caller currently has permission to perform the action that
@permission represents the permission to perform. *)
external get_allowed : t -> bool = "ml_g_permission_get_allowed"

(** Attempts to acquire the permission represented by @permission.

The precise method by which this happens depends on the permission
and the underlying authentication mechanism.  A simple example is
that a dialog may appear asking the user to enter their password.

You should check with g_permission_get_can_acquire() before calling
this function.

If the permission is acquired then %TRUE is returned.  Otherwise,
%FALSE is returned and @error is set appropriately.

This call is blocking, likely for a very long time (in the case that
user interaction is required).  See g_permission_acquire_async() for
the non-blocking version. *)
external acquire : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_permission_acquire"

(* Properties *)

