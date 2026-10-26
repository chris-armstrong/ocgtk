class type shadow_t = object
  method as_shadow : Raw.Shadow.t
end

class shadow : Raw.Shadow.t -> shadow_t
