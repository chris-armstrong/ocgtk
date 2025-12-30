class io_module : Io_module.t ->
  object
    method load : unit -> unit
    method unload : unit -> unit
    method as_io_module : Io_module.t
  end

