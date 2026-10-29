class type io_module_scope_t = object
  (** {2:methods Methods} *)

  method block : string -> unit
  (** Block modules with the given [basename] from being loaded when this scope
      is used with g_io_modules_scan_all_in_directory_with_scope() or
      g_io_modules_load_all_in_directory_with_scope(). *)

  (** {2:conversions Conversions} *)

  method as_io_module_scope : Raw.Io_module_scope.t
end

(* High-level class for IOModuleScope *)
class io_module_scope (obj : Raw.Io_module_scope.t) : io_module_scope_t =
  object (self)
    method block : string -> unit =
      fun basename -> Raw.Io_module_scope.block obj basename

    method as_io_module_scope = obj
  end
