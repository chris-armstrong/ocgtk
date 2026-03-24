class type message_dialog_t = object
    inherit GDialog.dialog_t
    method get_message_area : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    method set_markup : string -> unit
    method buttons : Gtk_enums.buttonstype
    method message_type : Gtk_enums.messagetype
    method set_message_type : Gtk_enums.messagetype -> unit
    method secondary_text : string
    method set_secondary_text : string -> unit
    method secondary_use_markup : bool
    method set_secondary_use_markup : bool -> unit
    method text : string
    method set_text : string -> unit
    method use_markup : bool
    method set_use_markup : bool -> unit
    method as_message_dialog : Message_dialog.t
end

(* High-level class for MessageDialog *)
class message_dialog (obj : Message_dialog.t) : message_dialog_t = object (self)
  inherit GDialog.dialog (obj :> Dialog.t)

  method get_message_area : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t =
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

    method as_message_dialog = obj
end

