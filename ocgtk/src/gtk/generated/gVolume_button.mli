class type volume_button_t = object
    method use_symbolic : bool
    method set_use_symbolic : bool -> unit
    method as_volume_button : Volume_button.t
end

class volume_button : Volume_button.t -> volume_button_t

