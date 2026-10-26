class type io_module_t = object
  method as_io_module : Raw.Io_module.t
end

class io_module : Raw.Io_module.t -> io_module_t

val new_ : string -> io_module_t
