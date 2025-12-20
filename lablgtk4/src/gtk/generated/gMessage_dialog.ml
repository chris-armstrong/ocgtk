(* High-level class for MessageDialog *)
class message_dialog (obj : Message_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Message_dialog.as_widget obj)

  method get_message_area : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget =
    fun () ->
      new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Message_dialog.get_message_area obj)

  method set_markup : string -> unit =
    fun str ->
      (Message_dialog.set_markup obj str)

  method buttons = Message_dialog.get_buttons obj

  method message_type = Message_dialog.get_message_type obj
  method set_message_type v =  Message_dialog.set_message_type obj v

  method secondary_text = Message_dialog.get_secondary_text obj
  method set_secondary_text v =  Message_dialog.set_secondary_text obj v

  method secondary_use_markup = Message_dialog.get_secondary_use_markup obj
  method set_secondary_use_markup v =  Message_dialog.set_secondary_use_markup obj v

  method text = Message_dialog.get_text obj
  method set_text v =  Message_dialog.set_text obj v

  method use_markup = Message_dialog.get_use_markup obj
  method set_use_markup v =  Message_dialog.set_use_markup obj v

  method as_widget = (Message_dialog.as_widget obj)
    method as_message_dialog = obj
end

