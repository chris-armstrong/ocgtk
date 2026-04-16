class type path_t = object
  method as_path : Path.t
end

class path : Path.t -> path_t
