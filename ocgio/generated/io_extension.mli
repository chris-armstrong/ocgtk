class type io_extension_t = object
  method get_name : unit -> string
  method get_priority : unit -> int
  method get_type : unit -> Gobject.Type.t
  method as_io_extension : Io_extension.t
end

class io_extension : Io_extension.t -> io_extension_t
