class type volume_button_t = object
    inherit GScale_button.scale_button_t
    method use_symbolic : bool
    method set_use_symbolic : bool -> unit
    method as_volume_button : Volume_button.t
end

(* High-level class for VolumeButton *)
class volume_button (obj : Volume_button.t) : volume_button_t = object (self)
  inherit GScale_button.scale_button (Obj.magic obj : Scale_button.t)

  method use_symbolic = Volume_button.get_use_symbolic obj
  method set_use_symbolic v =  Volume_button.set_use_symbolic obj v

    method as_volume_button = obj
end

