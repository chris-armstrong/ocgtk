(* High-level class for VolumeButton *)
class volume_button_skel (obj : Volume_button.t) = object (self)
  inherit GObj.widget_impl (Volume_button.as_widget obj)

end

class volume_button obj = object
  inherit volume_button_skel obj
end
