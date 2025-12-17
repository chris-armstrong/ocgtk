class message_dialog : Message_dialog.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_message_area : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method set_markup : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_message_dialog : Message_dialog.t
  end

