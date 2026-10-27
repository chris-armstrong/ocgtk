class type path_t = object
  method as_path : Raw.Path.t
end

class path : Raw.Path.t -> path_t
