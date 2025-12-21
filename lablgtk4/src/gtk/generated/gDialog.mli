class dialog : Dialog.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gdialog_signals.dialog_signals
    method add_action_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int -> unit
    method add_button : string -> int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_content_area : unit -> GBox.box
    method get_header_bar : unit -> GHeader_bar.header_bar
    method get_response_for_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> int
    method get_widget_for_response : int -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method response : int -> unit
    method set_default_response : int -> unit
    method set_response_sensitive : int -> bool -> unit
    method use_header_bar : int
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_dialog : Dialog.t
  end

