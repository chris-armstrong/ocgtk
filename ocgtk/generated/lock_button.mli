(** [GtkLockButton] is a widget to obtain and revoke authorizations needed to
    operate the controls.

    An example GtkLockButton

    It is typically used in preference dialogs or control panels.

    The required authorization is represented by a [GPermission] object.
    Concrete implementations of [GPermission] may use PolicyKit or some other
    authorization framework. To obtain a PolicyKit-based [GPermission], use
    [polkit_permission_new()].

    If the user is not currently allowed to perform the action, but can obtain
    the permission, the widget looks like this:

    An locked GtkLockButton

    and the user can click the button to request the permission. Depending on
    the platform, this may pop up an authentication dialog or ask the user to
    authenticate in some other way. Once the user has obtained the permission,
    the widget changes to this:

    An unlocked GtkLockButton

    and the permission can be dropped again by clicking the button. If the user
    is not able to obtain the permission at all, the widget looks like this:

    An unobtainable GtkLockButton

    If the user has the permission and cannot drop it, the button is hidden.

    The text (and tooltips) that are shown in the various cases can be adjusted
    with the [Gtk.LockButton:text-lock], [Gtk.LockButton:text-unlock],
    [Gtk.LockButton:tooltip-lock], [Gtk.LockButton:tooltip-unlock] and
    [Gtk.LockButton:tooltip-not-authorized] properties.

    Its methods, signals and properties are on {!class-type-lock_button_t}. The
    functions it is built on are in {!Ocgtk.Raw.Lock_button}. *)

(** The methods, signals and properties of a [GtkLockButton]. *)
class type lock_button_t = object
  inherit Button.button_t
  method get_permission : unit -> Ocgio.Permission.permission_t option
  method set_permission : Ocgio.Permission.permission_t option -> unit
  method text_lock : string
  method set_text_lock : string -> unit
  method text_unlock : string
  method set_text_unlock : string -> unit
  method tooltip_lock : string
  method set_tooltip_lock : string -> unit
  method tooltip_not_authorized : string
  method set_tooltip_not_authorized : string -> unit
  method tooltip_unlock : string
  method set_tooltip_unlock : string -> unit
  method as_lock_button : Raw.Lock_button.t
end

class lock_button : Raw.Lock_button.t -> lock_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Lock_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkLockButton], give one already wrapped. *)

val new_ : Ocgio.Permission.permission_t option -> lock_button_t
