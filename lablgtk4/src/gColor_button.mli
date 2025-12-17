class color_button : Color_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcolor_button_signals.color_button_signals
    method get_modal : unit -> bool
    method get_title : unit -> string
    method set_modal : bool -> unit
    method set_title : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_color_button : Color_button.t
  end

