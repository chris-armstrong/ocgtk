class type notification_t = object
    method add_button : string -> string -> unit
    method add_button_with_target_value : string -> string -> Gvariant.t option -> unit
    method set_body : string option -> unit
    method set_category : string option -> unit
    method set_default_action : string -> unit
    method set_default_action_and_target_value : string -> Gvariant.t option -> unit
    method set_icon : GIcon.icon_t -> unit
    method set_priority : Gio_enums.notificationpriority -> unit
    method set_title : string -> unit
    method set_urgent : bool -> unit
    method as_notification : Notification.t
end

class notification : Notification.t -> notification_t

val new_ : string -> notification_t
