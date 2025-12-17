class file_chooser_widget : File_chooser_widget.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gfile_chooser_widget_signals.file_chooser_widget_signals
    method search_mode : bool
    method set_search_mode : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_file_chooser_widget : File_chooser_widget.t
  end

