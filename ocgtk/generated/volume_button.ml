class type volume_button_t = object
  inherit Scale_button.scale_button_t
  method use_symbolic : bool
  method set_use_symbolic : bool -> unit
  method as_volume_button : Raw.Volume_button.t
end

(* High-level class for VolumeButton *)
class volume_button (obj : Raw.Volume_button.t) : volume_button_t =
  object (self)
    inherit Scale_button.scale_button (obj :> Raw.Scale_button.t)
    method use_symbolic = Raw.Volume_button.get_use_symbolic obj
    method set_use_symbolic v = Raw.Volume_button.set_use_symbolic obj v
    method as_volume_button = obj
  end

let new_ () : volume_button_t = new volume_button (Raw.Volume_button.new_ ())
