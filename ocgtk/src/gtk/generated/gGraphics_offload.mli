class graphics_offload : Graphics_offload.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_enabled : unit -> Gtk_enums.graphicsoffloadenabled
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_enabled : Gtk_enums.graphicsoffloadenabled -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_graphics_offload : Graphics_offload.t
  end

