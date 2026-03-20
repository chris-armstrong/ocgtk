class type color_dialog_button_t = object
    inherit Gcolor_dialog_button_signals.color_dialog_button_signals
    method get_dialog : unit -> GColor_dialog.color_dialog_t option
    method get_rgba : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method set_dialog : GColor_dialog.color_dialog_t -> unit
    method set_rgba : Ocgtk_gdk.Gdk.rgb_a_t -> unit
    method as_color_dialog_button : Color_dialog_button.t
end

class color_dialog_button : Color_dialog_button.t -> color_dialog_button_t

