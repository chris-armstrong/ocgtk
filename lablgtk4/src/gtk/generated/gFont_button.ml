(* Signal class defined in gfont_button_signals.ml *)

(* High-level class for FontButton *)
class font_button (obj : Font_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Font_button.as_widget obj)
  inherit Gfont_button_signals.font_button_signals obj

  method modal = Font_button.get_modal obj
  method set_modal v = Font_button.set_modal obj v

  method title = Font_button.get_title obj
  method set_title v = Font_button.set_title obj v

  method use_font = Font_button.get_use_font obj
  method set_use_font v = Font_button.set_use_font obj v

  method use_size = Font_button.get_use_size obj
  method set_use_size v = Font_button.set_use_size obj v

  method as_widget = (Font_button.as_widget obj)
    method as_font_button = obj
end

