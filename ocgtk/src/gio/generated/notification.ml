(* GENERATED CODE - DO NOT EDIT *)
(* Notification: Notification *)

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

    A notification can be sent with [Gio.Application.send_notification]. *)

type t = [ `notification | `object_ ] Gobject.obj

external new_ : string -> t = "ml_g_notification_new"
(** Create a new Notification *)

(* Methods *)

external set_urgent : t -> bool -> unit = "ml_g_notification_set_urgent"
(** Deprecated in favor of g_notification_set_priority(). *)

external set_title : t -> string -> unit = "ml_g_notification_set_title"
(** Sets the title of [notification] to [title]. *)

external set_priority : t -> Gio_enums.notificationpriority -> unit
  = "ml_g_notification_set_priority"
(** Sets the priority of [notification] to [priority]. See
    [GNotificationPriority] for possible values. *)

external set_icon : t -> Icon.t -> unit = "ml_g_notification_set_icon"
(** Sets the icon of [notification] to [icon]. *)

external set_default_action_and_target_value :
  t -> string -> Gvariant.t option -> unit
  = "ml_g_notification_set_default_action_and_target_value"
(** Sets the default action of [notification] to [action]. This action is
    activated when the notification is clicked on. It must be an
    application-wide action (start with “app.”).

    If [target] is non-[NULL], [action] will be activated with [target] as its
    parameter. If [target] is floating, it will be consumed.

    When no default action is set, the application that the notification was
    sent on is activated. *)

external set_default_action : t -> string -> unit
  = "ml_g_notification_set_default_action"
(** Sets the default action of [notification] to [detailed_action]. This action
    is activated when the notification is clicked on.

    The action in [detailed_action] must be an application-wide action (it must
    start with “app.”). If [detailed_action] contains a target, the given action
    will be activated with that target as its parameter. See
    g_action_parse_detailed_name() for a description of the format for
    [detailed_action].

    When no default action is set, the application that the notification was
    sent on is activated. *)

external set_category : t -> string option -> unit
  = "ml_g_notification_set_category"
(** Sets the type of [notification] to [category]. Categories have a main type
    like [email], [im] or [device] and can have a detail separated by a [.],
    e.g. [im.received] or [email.arrived]. Setting the category helps the
    notification server to select proper feedback to the user.

    Standard categories are
    {{:https://specifications.freedesktop.org/notification-spec/latest/ar01s06.html}listed
     in the specification}. *)

external set_body : t -> string option -> unit = "ml_g_notification_set_body"
(** Sets the body of [notification] to [body]. *)

external add_button_with_target_value :
  t -> string -> string -> Gvariant.t option -> unit
  = "ml_g_notification_add_button_with_target_value"
(** Adds a button to [notification] that activates [action] when clicked.
    [action] must be an application-wide action (it must start with “app.”).

    If [target] is non-[NULL], [action] will be activated with [target] as its
    parameter. *)

external add_button : t -> string -> string -> unit
  = "ml_g_notification_add_button"
(** Adds a button to [notification] that activates the action in
    [detailed_action] when clicked. That action must be an application-wide
    action (starting with “app.”). If [detailed_action] contains a target, the
    action will be activated with that target as its parameter.

    See g_action_parse_detailed_name() for a description of the format for
    [detailed_action]. *)
