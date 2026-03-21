class type color_chooser_dialog_t = object
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_chooser_dialog : Color_chooser_dialog.t
end

class color_chooser_dialog : Color_chooser_dialog.t -> color_chooser_dialog_t

