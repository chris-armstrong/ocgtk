class type io_module_t = object
    method as_io_module : Io_module.t
end

(* High-level class for IOModule *)
class io_module (obj : Io_module.t) : io_module_t = object (self)

    method as_io_module = obj
end

let new_ (filename : string) : io_module_t =
  new io_module (Io_module.new_ filename)

