(* High-level class for VolumeButton *)
class volume_button (obj : Volume_button.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Volume_button.as_widget obj)

  method as_widget = (Volume_button.as_widget obj)
    method as_volume_button = obj
end

