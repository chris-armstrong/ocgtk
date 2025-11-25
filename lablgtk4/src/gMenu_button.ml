(* High-level class for MenuButton *)
class menu_button_skel (obj : Menu_button.t) = object (self)
  inherit GObj.widget_impl (Menu_button.as_widget obj)

end

class menu_button obj = object
  inherit menu_button_skel obj
end
