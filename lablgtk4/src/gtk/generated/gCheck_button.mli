class check_button : Check_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcheck_button_signals.check_button_signals
    method active : bool
    method set_active : bool -> unit
    method inconsistent : bool
    method set_inconsistent : bool -> unit
    method label : string
    method set_label : string -> unit
    method use_underline : bool
    method set_use_underline : bool -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_group : <as_check_button: Check_button.t; ..> option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_check_button : Check_button.t
  end

