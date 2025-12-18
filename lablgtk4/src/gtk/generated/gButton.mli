class button : Button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gbutton_signals.button_signals
    method can_shrink : bool
    method set_can_shrink : bool -> unit
    method has_frame : bool
    method set_has_frame : bool -> unit
    method icon_name : string
    method set_icon_name : string -> unit
    method label : string
    method set_label : string -> unit
    method use_underline : bool
    method set_use_underline : bool -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_button : Button.t
  end

