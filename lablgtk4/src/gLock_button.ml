(* High-level class for LockButton *)
class lock_button_skel (obj : Lock_button.t) = object (self)
  inherit GObj.widget_impl (Lock_button.as_widget obj)

end

class lock_button obj = object
  inherit lock_button_skel obj
end
