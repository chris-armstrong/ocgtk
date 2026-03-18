(* High-level class for VolumeButton *)
class volume_button (obj : Volume_button.t) = object (self)

  method use_symbolic = Volume_button.get_use_symbolic obj
  method set_use_symbolic v =  Volume_button.set_use_symbolic obj v

    method as_volume_button = obj
end

