(* Signal class defined in gd_bus_object_manager_signals.ml *)

(* High-level class for DBusObjectManager *)
class d_bus_object_manager (obj : D_bus_object_manager.t) = object (self)
  inherit Gd_bus_object_manager_signals.d_bus_object_manager_signals obj

  method get_interface : string -> string -> GD_bus_interface_and__d_bus_object.d_bus_interface option =
    fun object_path interface_name ->
      Option.map (fun ret -> new GD_bus_interface_and__d_bus_object.d_bus_interface ret) (D_bus_object_manager.get_interface obj object_path interface_name)

  method get_object : string -> GD_bus_interface_and__d_bus_object.d_bus_object option =
    fun object_path ->
      Option.map (fun ret -> new GD_bus_interface_and__d_bus_object.d_bus_object ret) (D_bus_object_manager.get_object obj object_path)

  method get_object_path : unit -> string =
    fun () ->
      (D_bus_object_manager.get_object_path obj)

    method as_d_bus_object_manager = obj
end

