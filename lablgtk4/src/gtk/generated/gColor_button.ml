(* Signal class defined in gcolor_button_signals.ml *)

(* High-level class for ColorButton *)
class color_button (obj : Color_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Color_button.as_widget obj)
  inherit Gcolor_button_signals.color_button_signals obj

  method modal = Color_button.get_modal obj
  method set_modal v = Color_button.set_modal obj v

  method show_editor = Color_button.get_show_editor obj
  method set_show_editor v = Color_button.set_show_editor obj v

  method title = Color_button.get_title obj
  method set_title v = Color_button.set_title obj v

  method as_widget = (Color_button.as_widget obj)
    method as_color_button = obj
end

