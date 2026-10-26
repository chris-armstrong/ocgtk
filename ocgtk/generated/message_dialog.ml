class type message_dialog_t = object
  inherit Dialog.dialog_t

  method get_message_area :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method set_markup : string -> unit
  method message_type : Enums.messagetype
  method set_message_type : Enums.messagetype -> unit
  method secondary_text : string
  method set_secondary_text : string -> unit
  method secondary_use_markup : bool
  method set_secondary_use_markup : bool -> unit
  method text : string
  method set_text : string -> unit
  method use_markup : bool
  method set_use_markup : bool -> unit
  method as_message_dialog : Raw.Message_dialog.t
end

(* High-level class for MessageDialog *)
class message_dialog (obj : Raw.Message_dialog.t) : message_dialog_t =
  object (self)
    inherit Dialog.dialog (obj :> Raw.Dialog.t)

    method get_message_area :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t =
      fun () ->
        new
          Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
          .widget
          (Raw.Message_dialog.get_message_area obj)

    method set_markup : string -> unit =
      fun str -> Raw.Message_dialog.set_markup obj str

    method message_type = Raw.Message_dialog.get_message_type obj
    method set_message_type v = Raw.Message_dialog.set_message_type obj v
    method secondary_text = Raw.Message_dialog.get_secondary_text obj
    method set_secondary_text v = Raw.Message_dialog.set_secondary_text obj v

    method secondary_use_markup =
      Raw.Message_dialog.get_secondary_use_markup obj

    method set_secondary_use_markup v =
      Raw.Message_dialog.set_secondary_use_markup obj v

    method text = Raw.Message_dialog.get_text obj
    method set_text v = Raw.Message_dialog.set_text obj v
    method use_markup = Raw.Message_dialog.get_use_markup obj
    method set_use_markup v = Raw.Message_dialog.set_use_markup obj v
    method as_message_dialog = obj
  end
