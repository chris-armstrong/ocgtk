class file_chooser_widget : File_chooser_widget.t ->
  object
    inherit Gfile_chooser_widget_signals.file_chooser_widget_signals
    method search_mode : bool
    method set_search_mode : bool -> unit
    method show_time : bool
    method subtitle : string
    method as_file_chooser_widget : File_chooser_widget.t
  end

