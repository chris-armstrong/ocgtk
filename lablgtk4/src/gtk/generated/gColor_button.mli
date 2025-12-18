class color_button : Color_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcolor_button_signals.color_button_signals
    method modal : bool
    method set_modal : bool -> unit
    method show_editor : bool
    method set_show_editor : bool -> unit
    method title : string
    method set_title : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_color_button : Color_button.t
  end

