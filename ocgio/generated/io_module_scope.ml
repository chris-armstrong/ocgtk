class type io_module_scope_t = object
  method block : string -> unit
  method as_io_module_scope : Raw.Io_module_scope.t
end

(* High-level class for IOModuleScope *)
class io_module_scope (obj : Raw.Io_module_scope.t) : io_module_scope_t =
  object (self)
    method block : string -> unit =
      fun basename -> Raw.Io_module_scope.block obj basename

    method as_io_module_scope = obj
  end
