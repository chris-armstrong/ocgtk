class header_bar : Header_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method decoration_layout : string
    method set_decoration_layout : string -> unit
    method show_title_buttons : bool
    method set_show_title_buttons : bool -> unit
    method get_title_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method pack_end : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method pack_start : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method remove : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> unit
    method set_title_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_header_bar : Header_bar.t
  end

