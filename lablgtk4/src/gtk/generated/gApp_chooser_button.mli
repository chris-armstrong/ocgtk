class app_chooser_button : App_chooser_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gapp_chooser_button_signals.app_chooser_button_signals
    method heading : string
    method set_heading : string -> unit
    method modal : bool
    method set_modal : bool -> unit
    method show_default_item : bool
    method set_show_default_item : bool -> unit
    method show_dialog_item : bool
    method set_show_dialog_item : bool -> unit
    method append_separator : unit -> unit
    method set_active_custom_item : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_app_chooser_button : App_chooser_button.t
  end

