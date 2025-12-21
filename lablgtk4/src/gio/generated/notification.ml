(* GENERATED CODE - DO NOT EDIT *)
(* Notification: Notification *)

type t = [`notification | `object_] Gobject.obj

(** Create a new Notification *)
external new_ : string -> t = "ml_g_notification_new"

(* Methods *)
(** Deprecated in favor of g_notification_set_priority(). *)
external set_urgent : t -> bool -> unit = "ml_g_notification_set_urgent"

(** Sets the title of @notification to @title. *)
external set_title : t -> string -> unit = "ml_g_notification_set_title"

(** Sets the priority of @notification to @priority. See
#GNotificationPriority for possible values. *)
external set_priority : t -> Gio_enums.notificationpriority -> unit = "ml_g_notification_set_priority"

(** Sets the default action of @notification to @detailed_action. This
action is activated when the notification is clicked on.

The action in @detailed_action must be an application-wide action (it
must start with "app."). If @detailed_action contains a target, the
given action will be activated with that target as its parameter.
See g_action_parse_detailed_name() for a description of the format
for @detailed_action.

When no default action is set, the application that the notification
was sent on is activated. *)
external set_default_action : t -> string -> unit = "ml_g_notification_set_default_action"

(** Sets the type of @notification to @category. Categories have a main
type like `email`, `im` or `device` and can have a detail separated
by a `.`, e.g. `im.received` or `email.arrived`. Setting the category
helps the notification server to select proper feedback to the user.

Standard categories are [listed in the specification](https://specifications.freedesktop.org/notification-spec/latest/ar01s06.html). *)
external set_category : t -> string option -> unit = "ml_g_notification_set_category"

(** Sets the body of @notification to @body. *)
external set_body : t -> string option -> unit = "ml_g_notification_set_body"

(** Adds a button to @notification that activates the action in
@detailed_action when clicked. That action must be an
application-wide action (starting with "app."). If @detailed_action
contains a target, the action will be activated with that target as
its parameter.

See g_action_parse_detailed_name() for a description of the format
for @detailed_action. *)
external add_button : t -> string -> string -> unit = "ml_g_notification_add_button"

