class color_dialog_button : Color_dialog_button.t ->
  object
    inherit Gcolor_dialog_button_signals.color_dialog_button_signals
    method get_dialog : unit -> GColor_dialog.color_dialog option
    method get_rgba : unit -> Ocgtk_gdk.Gdk.rgb_a
    method set_dialog : #GColor_dialog.color_dialog -> unit
    method set_rgba : #Ocgtk_gdk.Gdk.rgb_a -> unit
    method as_color_dialog_button : Color_dialog_button.t
  end

