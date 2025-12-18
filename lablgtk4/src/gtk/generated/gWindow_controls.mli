class window_controls : Window_controls.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method decoration_layout : string
    method set_decoration_layout : string -> unit
    method empty : bool
    method get_side : unit -> Gtk_enums.packtype
    method set_side : Gtk_enums.packtype -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_window_controls : Window_controls.t
  end

