(* GENERATED CODE - DO NOT EDIT *)
(* LockButton: LockButton *)

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
    [Gtk.LockButton:tooltip-not-authorized] properties. *)

type t =
  [ `lock_button | `button | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external new_ : Ocgtk_gio.Gio.Wrappers.Permission.t option -> t
  = "ml_gtk_lock_button_new"
(** Create a new LockButton *)

(* Methods *)

external set_permission :
  t -> Ocgtk_gio.Gio.Wrappers.Permission.t option -> unit
  = "ml_gtk_lock_button_set_permission"
(** Sets the [GPermission] object that controls [button]. *)

external get_permission : t -> Ocgtk_gio.Gio.Wrappers.Permission.t option
  = "ml_gtk_lock_button_get_permission"
(** Obtains the [GPermission] object that controls [button]. *)

(* Properties *)

external get_text_lock : t -> string = "ml_gtk_lock_button_get_text_lock"
(** Get property: text-lock *)

external set_text_lock : t -> string -> unit
  = "ml_gtk_lock_button_set_text_lock"
(** Set property: text-lock *)

external get_text_unlock : t -> string = "ml_gtk_lock_button_get_text_unlock"
(** Get property: text-unlock *)

external set_text_unlock : t -> string -> unit
  = "ml_gtk_lock_button_set_text_unlock"
(** Set property: text-unlock *)

external get_tooltip_lock : t -> string = "ml_gtk_lock_button_get_tooltip_lock"
(** Get property: tooltip-lock *)

external set_tooltip_lock : t -> string -> unit
  = "ml_gtk_lock_button_set_tooltip_lock"
(** Set property: tooltip-lock *)

external get_tooltip_not_authorized : t -> string
  = "ml_gtk_lock_button_get_tooltip_not_authorized"
(** Get property: tooltip-not-authorized *)

external set_tooltip_not_authorized : t -> string -> unit
  = "ml_gtk_lock_button_set_tooltip_not_authorized"
(** Set property: tooltip-not-authorized *)

external get_tooltip_unlock : t -> string
  = "ml_gtk_lock_button_get_tooltip_unlock"
(** Get property: tooltip-unlock *)

external set_tooltip_unlock : t -> string -> unit
  = "ml_gtk_lock_button_set_tooltip_unlock"
(** Set property: tooltip-unlock *)
