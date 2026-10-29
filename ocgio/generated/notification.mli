(** [GNotification] is a mechanism for creating a notification to be shown to
    the user — typically as a pop-up notification presented by the desktop
    environment shell.

    Its methods, signals and properties are on {!class-type-notification_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Notification}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Notification].}

    [GNotification] is a mechanism for creating a notification to be shown to
    the user — typically as a pop-up notification presented by the desktop
    environment shell.

    The key difference between [GNotification] and other similar APIs is that,
    if supported by the desktop environment, notifications sent with
    [GNotification] will persist after the application has exited, and even
    across system reboots.

    Since the user may click on a notification while the application is not
    running, applications using [GNotification] should be able to be started as
    a D-Bus service, using
    {{!Ocgio.Application.class-type-application_t}[Gio.Application]}.

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
class type notification_t = object
  (** {2:methods Methods} *)

  method add_button : string -> string -> unit
  [@@ocaml.doc
    "Adds a button to [notification] that activates the action in\n\
     [detailed_action] when clicked. That action must be an\n\
     application-wide action (starting with \"app.\"). If [detailed_action]\n\
     contains a target, the action will be activated with that target as\n\
     its parameter.\n\n\
     See g_action_parse_detailed_name() for a description of the format\n\
     for [detailed_action]."]

  method add_button_with_target_value :
    string -> string -> Gvariant.t option -> unit
  [@@ocaml.doc
    "Adds a button to [notification] that activates [action] when clicked.\n\
     [action] must be an application-wide action (it must start with \
     \"app.\").\n\n\
     If [target] is non-[None], [action] will be activated with [target] as\n\
     its parameter."]

  method set_body : string option -> unit
  (** Sets the body of [notification] to [body]. *)

  method set_category : string option -> unit
  (** Sets the type of [notification] to [category]. Categories have a main type
      like [email], [im] or [device] and can have a detail separated by a [.],
      e.g. [im.received] or [email.arrived]. Setting the category helps the
      notification server to select proper feedback to the user.

      Standard categories are
      {{:https://specifications.freedesktop.org/notification-spec/latest/ar01s06.html}listed
       in the specification}. *)

  method set_default_action : string -> unit
  [@@ocaml.doc
    "Sets the default action of [notification] to [detailed_action]. This\n\
     action is activated when the notification is clicked on.\n\n\
     The action in [detailed_action] must be an application-wide action (it\n\
     must start with \"app.\"). If [detailed_action] contains a target, the\n\
     given action will be activated with that target as its parameter.\n\
     See g_action_parse_detailed_name() for a description of the format\n\
     for [detailed_action].\n\n\
     When no default action is set, the application that the notification\n\
     was sent on is activated."]

  method set_default_action_and_target_value :
    string -> Gvariant.t option -> unit
  [@@ocaml.doc
    "Sets the default action of [notification] to [action]. This action is\n\
     activated when the notification is clicked on. It must be an\n\
     application-wide action (start with \"app.\").\n\n\
     If [target] is non-[None], [action] will be activated with [target] as\n\
     its parameter. If [target] is floating, it will be consumed.\n\n\
     When no default action is set, the application that the notification\n\
     was sent on is activated."]

  method set_icon : Icon.icon_t -> unit
  (** Sets the icon of [notification] to [icon]. *)

  method set_priority : Enums.notificationpriority -> unit
  (** Sets the priority of [notification] to [priority]. See
      [GNotificationPriority] for possible values. *)

  method set_title : string -> unit
  (** Sets the title of [notification] to [title]. *)

  method set_urgent : bool -> unit
  (** Deprecated in favor of g_notification_set_priority(). *)

  (** {2:conversions Conversions} *)

  method as_notification : Raw.Notification.t
end

class notification : Raw.Notification.t -> notification_t
(** Wraps a raw handle of {!Ocgio.Raw.Notification.t}. *)

(** {1:description Description}

    [GNotification] is a mechanism for creating a notification to be shown to
    the user — typically as a pop-up notification presented by the desktop
    environment shell.

    The key difference between [GNotification] and other similar APIs is that,
    if supported by the desktop environment, notifications sent with
    [GNotification] will persist after the application has exited, and even
    across system reboots.

    Since the user may click on a notification while the application is not
    running, applications using [GNotification] should be able to be started as
    a D-Bus service, using
    {{!Ocgio.Application.class-type-application_t}[Gio.Application]}.

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

(** {1:constructors Constructors} *)

val new_ : string -> notification_t
(** Creates a new [GNotification] with [title] as its title.

    After populating [notification] with more details, it can be sent to the
    desktop shell with g_application_send_notification(). Changing any
    properties after this call will not have any effect until resending
    [notification]. *)
