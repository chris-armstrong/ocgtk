(* Signal class defined in gd_bus_object_manager_signals.ml *)

(* High-level class for DBusObjectManager *)
class d_bus_object_manager (obj : D_bus_object_manager.t) = object (self)
  inherit Gd_bus_object_manager_signals.d_bus_object_manager_signals obj

  method get_object_path : unit -> string =
    fun () ->
      (D_bus_object_manager.get_object_path obj)

    method as_d_bus_object_manager = obj
end

