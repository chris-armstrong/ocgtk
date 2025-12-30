class io_extension : Io_extension.t ->
  object
    method get_name : unit -> string
    method get_priority : unit -> int
    method as_io_extension : Io_extension.t
  end

