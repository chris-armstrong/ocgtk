(* High-level class for ScaleButton *)
class scale_button_skel (obj : Scale_button.t) = object (self)
  inherit GObj.widget_impl (Scale_button.as_widget obj)

end

class scale_button obj = object
  inherit scale_button_skel obj
end
