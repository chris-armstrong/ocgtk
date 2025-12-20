class check_button : Check_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcheck_button_signals.check_button_signals
    method get_active : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_inconsistent : unit -> bool
    method get_label : unit -> string option
    method get_use_underline : unit -> bool
    method set_active : bool -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_group : <as_check_button: Check_button.t; ..> option -> unit
    method set_inconsistent : bool -> unit
    method set_label : string option -> unit
    method set_use_underline : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_check_button : Check_button.t
  end

