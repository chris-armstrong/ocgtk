class type surface_t = object
    method as_surface : Surface.t
end

(* High-level class for Surface *)
class surface (obj : Surface.t) : surface_t = object (self)

    method as_surface = obj
end

