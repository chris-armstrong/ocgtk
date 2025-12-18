(* High-level class for MessageDialog *)
class message_dialog (obj : Message_dialog.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Message_dialog.as_widget obj)

  method get_message_area : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget = fun () -> new  GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget(Message_dialog.get_message_area obj )

  method set_markup : string -> unit = fun str -> (Message_dialog.set_markup obj str)

  method as_widget = (Message_dialog.as_widget obj)
    method as_message_dialog = obj
end

