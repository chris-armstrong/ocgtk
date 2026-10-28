(** [GtkLockButton] is a widget to obtain and revoke authorizations needed to
    operate the controls.

    Its methods, signals and properties are on {!class-type-lock_button_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Lock_button}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [LockButton].}

    [GtkLockButton] is a widget to obtain and revoke authorizations needed to
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
    [Gtk.LockButton:tooltip-not-authorized] properties. *)
class type lock_button_t = object
  inherit Button.button_t

  (** {2:methods Methods} *)

  method get_permission : unit -> Ocgio.Permission.permission_t option
  (** Obtains the [GPermission] object that controls [button]. *)

  method set_permission : Ocgio.Permission.permission_t option -> unit
  (** Sets the [GPermission] object that controls [button]. *)

  (** {2:properties Properties} *)

  method text_lock : string
  (** The text to display when prompting the user to lock. *)

  method set_text_lock : string -> unit
  (** The text to display when prompting the user to lock. *)

  method text_unlock : string
  (** The text to display when prompting the user to unlock. *)

  method set_text_unlock : string -> unit
  (** The text to display when prompting the user to unlock. *)

  method tooltip_lock : string
  (** The tooltip to display when prompting the user to lock. *)

  method set_tooltip_lock : string -> unit
  (** The tooltip to display when prompting the user to lock. *)

  method tooltip_not_authorized : string
  (** The tooltip to display when the user cannot obtain authorization. *)

  method set_tooltip_not_authorized : string -> unit
  (** The tooltip to display when the user cannot obtain authorization. *)

  method tooltip_unlock : string
  (** The tooltip to display when prompting the user to unlock. *)

  method set_tooltip_unlock : string -> unit
  (** The tooltip to display when prompting the user to unlock. *)

  (** {2:conversions Conversions} *)

  method as_lock_button : Raw.Lock_button.t
end

class lock_button : Raw.Lock_button.t -> lock_button_t
(** Wraps a raw handle of {!Ocgtk.Raw.Lock_button.t}. *)

(** {1:description Description}

    [GtkLockButton] is a widget to obtain and revoke authorizations needed to
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
    [Gtk.LockButton:tooltip-not-authorized] properties. *)

(** {1:constructors Constructors} *)

val new_ : Ocgio.Permission.permission_t option -> lock_button_t
(** Creates a new lock button which reflects the [permission]. *)
