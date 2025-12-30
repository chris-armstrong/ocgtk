class io_extension_point : Io_extension_point.t ->
  object
    method get_extension_by_name : string -> Io_extension.t
    method as_io_extension_point : Io_extension_point.t
  end

