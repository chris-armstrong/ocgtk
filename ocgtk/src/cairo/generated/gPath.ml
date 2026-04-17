class type path_t = object
    method as_path : Path.t
end

(* High-level class for Path *)
class path (obj : Path.t) : path_t = object (self)

    method as_path = obj
end

