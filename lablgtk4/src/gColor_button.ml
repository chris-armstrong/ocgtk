(* High-level class for ColorButton *)
class color_button_skel (obj : Color_button.t) = object (self)
  inherit GObj.widget_impl (Color_button.as_widget obj)

end

class color_button obj = object
  inherit color_button_skel obj
end
