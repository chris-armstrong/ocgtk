class type color_chooser_dialog_t = object
    inherit GDialog.dialog_t
    method show_editor : bool
    method set_show_editor : bool -> unit
    method as_color_chooser_dialog : Color_chooser_dialog.t
end

class color_chooser_dialog : Color_chooser_dialog.t -> color_chooser_dialog_t

val new_ : string option -> GApplication_and__window_and__window_group.window_t option -> color_chooser_dialog_t
