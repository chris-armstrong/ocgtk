class font_button : Font_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gfont_button_signals.font_button_signals
    method modal : bool
    method set_modal : bool -> unit
    method title : string
    method set_title : string -> unit
    method use_font : bool
    method set_use_font : bool -> unit
    method use_size : bool
    method set_use_size : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_font_button : Font_button.t
  end

