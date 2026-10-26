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
