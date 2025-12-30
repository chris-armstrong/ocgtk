(* High-level class for Notification *)
class notification (obj : Notification.t) = object (self)

  method add_button : string -> string -> unit =
    fun label detailed_action ->
      (Notification.add_button obj label detailed_action)

  method set_body : string option -> unit =
    fun body ->
      (Notification.set_body obj body)

  method set_category : string option -> unit =
    fun category ->
      (Notification.set_category obj category)

  method set_default_action : string -> unit =
    fun detailed_action ->
      (Notification.set_default_action obj detailed_action)

  method set_priority : Gio_enums.notificationpriority -> unit =
    fun priority ->
      (Notification.set_priority obj priority)

  method set_title : string -> unit =
    fun title ->
      (Notification.set_title obj title)

  method set_urgent : bool -> unit =
    fun urgent ->
      (Notification.set_urgent obj urgent)

    method as_notification = obj
end

