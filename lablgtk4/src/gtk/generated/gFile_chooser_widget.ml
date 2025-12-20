(* Signal class defined in gfile_chooser_widget_signals.ml *)

(* High-level class for FileChooserWidget *)
class file_chooser_widget (obj : File_chooser_widget.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (File_chooser_widget.as_widget obj)
  inherit Gfile_chooser_widget_signals.file_chooser_widget_signals obj

  method search_mode = File_chooser_widget.get_search_mode obj
  method set_search_mode v =  File_chooser_widget.set_search_mode obj v

  method show_time = File_chooser_widget.get_show_time obj

  method subtitle = File_chooser_widget.get_subtitle obj

  method as_widget = (File_chooser_widget.as_widget obj)
    method as_file_chooser_widget = obj
end

