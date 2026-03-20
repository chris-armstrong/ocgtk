class type io_module_scope_t = object
    method block : string -> unit
    method free : unit -> unit
    method as_io_module_scope : Io_module_scope.t
end

(* High-level class for IOModuleScope *)
class io_module_scope (obj : Io_module_scope.t) : io_module_scope_t = object (self)

  method block : string -> unit =
    fun basename ->
      (Io_module_scope.block obj basename)

  method free : unit -> unit =
    fun () ->
      (Io_module_scope.free obj)

    method as_io_module_scope = obj
end

