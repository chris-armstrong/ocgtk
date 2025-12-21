class app_chooser_dialog : App_chooser_dialog.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_heading : unit -> string option
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method set_heading : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_app_chooser_dialog : App_chooser_dialog.t
  end

