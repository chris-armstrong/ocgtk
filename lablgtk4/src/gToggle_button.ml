(* High-level class for ToggleButton *)
class toggle_button_skel (obj : Toggle_button.t) = object (self)
  inherit GObj.widget_impl (Toggle_button.as_widget obj)

end

class toggle_button obj = object
  inherit toggle_button_skel obj
end
