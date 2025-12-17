class app_chooser_widget : App_chooser_widget.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gapp_chooser_widget_signals.app_chooser_widget_signals
    method get_default_text : unit -> string option
    method get_show_all : unit -> bool
    method get_show_default : unit -> bool
    method get_show_fallback : unit -> bool
    method get_show_other : unit -> bool
    method get_show_recommended : unit -> bool
    method set_default_text : string -> unit
    method set_show_all : bool -> unit
    method set_show_default : bool -> unit
    method set_show_fallback : bool -> unit
    method set_show_other : bool -> unit
    method set_show_recommended : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_app_chooser_widget : App_chooser_widget.t
  end

