(* High-level class for SpinButton *)
class spin_button_skel (obj : Spin_button.t) = object (self)
  inherit GObj.widget_impl (Spin_button.as_widget obj)

end

class spin_button obj = object
  inherit spin_button_skel obj
end
