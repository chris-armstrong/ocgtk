class type file_chooser_widget_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gfile_chooser_widget_signals.file_chooser_widget_signals
    method search_mode : bool
    method set_search_mode : bool -> unit
    method show_time : bool
    method subtitle : string
    method as_file_chooser_widget : File_chooser_widget.t
end

class file_chooser_widget : File_chooser_widget.t -> file_chooser_widget_t

