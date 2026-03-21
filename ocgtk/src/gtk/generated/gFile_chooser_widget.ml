(* Signal class defined in gfile_chooser_widget_signals.ml *)

class type file_chooser_widget_t = object
    inherit Gfile_chooser_widget_signals.file_chooser_widget_signals
    method search_mode : bool
    method set_search_mode : bool -> unit
    method show_time : bool
    method subtitle : string
    method as_file_chooser_widget : File_chooser_widget.t
end

(* High-level class for FileChooserWidget *)
class file_chooser_widget (obj : File_chooser_widget.t) : file_chooser_widget_t = object (self)
  inherit Gfile_chooser_widget_signals.file_chooser_widget_signals obj

  method search_mode = File_chooser_widget.get_search_mode obj
  method set_search_mode v =  File_chooser_widget.set_search_mode obj v

  method show_time = File_chooser_widget.get_show_time obj

  method subtitle = File_chooser_widget.get_subtitle obj

    method as_file_chooser_widget = obj
end

