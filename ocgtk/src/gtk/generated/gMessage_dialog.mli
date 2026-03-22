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

class message_dialog : Message_dialog.t -> message_dialog_t

