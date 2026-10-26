class type path_t = object
  method as_path : Raw.Path.t
end

(* High-level class for Path *)
class path (obj : Raw.Path.t) : path_t =
  object (self)
    method as_path = obj
  end
