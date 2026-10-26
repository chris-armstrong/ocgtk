class type surface_t = object
  method as_surface : Raw.Surface.t
end

class surface : Raw.Surface.t -> surface_t
