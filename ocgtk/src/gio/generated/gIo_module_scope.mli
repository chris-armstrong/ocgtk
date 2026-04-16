class type io_module_scope_t = object
  method block : string -> unit
  method free : unit -> unit
  method as_io_module_scope : Io_module_scope.t
end

class io_module_scope : Io_module_scope.t -> io_module_scope_t
