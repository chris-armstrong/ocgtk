class notification : Notification.t ->
  object
    method add_button : string -> string -> unit
    method set_body : string option -> unit
    method set_category : string option -> unit
    method set_default_action : string -> unit
    method set_priority : Gio_enums.notificationpriority -> unit
    method set_title : string -> unit
    method set_urgent : bool -> unit
    method as_notification : Notification.t
  end

