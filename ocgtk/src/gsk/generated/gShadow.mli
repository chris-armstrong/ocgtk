class type shadow_t = object
    method as_shadow : Shadow.t
end

class shadow : Shadow.t -> shadow_t

