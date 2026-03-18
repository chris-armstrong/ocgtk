class color_chooser_widget : Color_chooser_widget.t ->
  object
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_chooser_widget : Color_chooser_widget.t
  end

