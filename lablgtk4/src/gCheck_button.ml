(* High-level class for CheckButton *)
class check_button_skel (obj : Check_button.t) = object (self)
  inherit GObj.widget_impl (Check_button.as_widget obj)

end

class check_button obj = object
  inherit check_button_skel obj
end
