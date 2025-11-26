(* High-level class for FontButton *)
class font_button_skel (obj : Font_button.t) = object (self)
  inherit GObj.widget_impl (Font_button.as_widget obj)

end

class font_button obj = object
  inherit font_button_skel obj
end
