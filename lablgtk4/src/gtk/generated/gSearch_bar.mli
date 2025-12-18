class search_bar : Search_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method search_mode_enabled : bool
    method set_search_mode_enabled : bool -> unit
    method show_close_button : bool
    method set_show_close_button : bool -> unit
    method connect_entry : GEditable.editable -> unit
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_key_capture_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_search_mode : unit -> bool
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_key_capture_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_search_mode : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_search_bar : Search_bar.t
  end

