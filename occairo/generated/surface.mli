class type surface_t = object
  method as_surface : Surface.t
end

class surface : Surface.t -> surface_t
