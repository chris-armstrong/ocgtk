class type io_extension_point_t = object
  method get_extension_by_name : string -> Io_extension.t
  method get_extensions : unit -> Io_extension.t list
  method get_required_type : unit -> int
  method set_required_type : int -> unit
  method as_io_extension_point : Io_extension_point.t
end

class io_extension_point : Io_extension_point.t -> io_extension_point_t
