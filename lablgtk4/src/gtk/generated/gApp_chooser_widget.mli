class app_chooser_widget : App_chooser_widget.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gapp_chooser_widget_signals.app_chooser_widget_signals
    method default_text : string
    method set_default_text : string -> unit
    method show_all : bool
    method set_show_all : bool -> unit
    method show_default : bool
    method set_show_default : bool -> unit
    method show_fallback : bool
    method set_show_fallback : bool -> unit
    method show_other : bool
    method set_show_other : bool -> unit
    method show_recommended : bool
    method set_show_recommended : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_app_chooser_widget : App_chooser_widget.t
  end

