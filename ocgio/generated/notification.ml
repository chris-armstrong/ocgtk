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

(* High-level class for Notification *)
class notification (obj : Raw.Notification.t) : notification_t =
  object (self)
    method add_button : string -> string -> unit =
      fun label detailed_action ->
        Raw.Notification.add_button obj label detailed_action

    method add_button_with_target_value :
        string -> string -> Gvariant.t option -> unit =
      fun label action target ->
        Raw.Notification.add_button_with_target_value obj label action target

    method set_body : string option -> unit =
      fun body -> Raw.Notification.set_body obj body

    method set_category : string option -> unit =
      fun category -> Raw.Notification.set_category obj category

    method set_default_action : string -> unit =
      fun detailed_action ->
        Raw.Notification.set_default_action obj detailed_action

    method set_default_action_and_target_value :
        string -> Gvariant.t option -> unit =
      fun action target ->
        Raw.Notification.set_default_action_and_target_value obj action target

    method set_icon : Icon.icon_t -> unit =
      fun icon ->
        let icon = icon#as_icon in
        Raw.Notification.set_icon obj icon

    method set_priority : Enums.notificationpriority -> unit =
      fun priority -> Raw.Notification.set_priority obj priority

    method set_title : string -> unit =
      fun title -> Raw.Notification.set_title obj title

    method set_urgent : bool -> unit =
      fun urgent -> Raw.Notification.set_urgent obj urgent

    method as_notification = obj
  end

let new_ (title : string) : notification_t =
  let obj_ = Raw.Notification.new_ title in
  new notification obj_
