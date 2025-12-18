class button : Button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gbutton_signals.button_signals
    method get_can_shrink : unit -> bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_has_frame : unit -> bool
    method get_icon_name : unit -> string option
    method get_label : unit -> string option
    method get_use_underline : unit -> bool
    method set_can_shrink : bool -> unit
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_has_frame : bool -> unit
    method set_icon_name : string -> unit
    method set_label : string -> unit
    method set_use_underline : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_button : Button.t
  end

