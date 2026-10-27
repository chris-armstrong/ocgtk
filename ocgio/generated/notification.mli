(** [GNotification] is a mechanism for creating a notification to be shown to
    the user — typically as a pop-up notification presented by the desktop
    environment shell.

    The key difference between [GNotification] and other similar APIs is that,
    if supported by the desktop environment, notifications sent with
    [GNotification] will persist after the application has exited, and even
    across system reboots.

    Since the user may click on a notification while the application is not
    running, applications using [GNotification] should be able to be started as
    a D-Bus service, using [Gio.Application].

    In order for [GNotification] to work, the application must have installed a
    [.desktop] file. For example:

    {[
    [Desktop Entry]
    Name=Test Application
    Comment=Description of what Test Application does
    Exec=gnome-test-application
    Icon=org.gnome.TestApplication
    Terminal=false
    Type=Application
    Categories=GNOME;GTK;TestApplication Category;
    StartupNotify=true
    DBusActivatable=true
    X-GNOME-UsesNotifications=true
    ]}

    The [X-GNOME-UsesNotifications] key indicates to GNOME Control Center that
    this application uses notifications, so it can be listed in the Control
    Center’s ‘Notifications’ panel.

    The [.desktop] file must be named as [org.gnome.TestApplication.desktop],
    where [org.gnome.TestApplication] is the ID passed to [Gio.Application.new].

    User interaction with a notification (either the default action, or buttons)
    must be associated with actions on the application (ie: [app.] actions). It
    is not possible to route user interaction through the notification itself,
    because the object will not exist if the application is autostarted as a
    result of a notification being clicked.

    A notification can be sent with [Gio.Application.send_notification].

    Its methods, signals and properties are on {!class-type-notification_t}. The
    functions it is built on are in {!Ocgio.Raw.Notification}. *)

(** The methods, signals and properties of a [GNotification]. *)
class type notification_t = object
  method add_button : string -> string -> unit

  method add_button_with_target_value :
    string -> string -> Gvariant.t option -> unit

  method set_body : string option -> unit
  method set_category : string option -> unit
  method set_default_action : string -> unit

  method set_default_action_and_target_value :
    string -> Gvariant.t option -> unit

  method set_icon : Icon.icon_t -> unit
  method set_priority : Enums.notificationpriority -> unit
  method set_title : string -> unit
  method set_urgent : bool -> unit
  method as_notification : Raw.Notification.t
end

class notification : Raw.Notification.t -> notification_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Notification.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GNotification], give one already wrapped. *)

val new_ : string -> notification_t
