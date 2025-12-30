(* Signal class defined in gd_bus_object_skeleton_signals.ml *)

(* High-level class for DBusObjectSkeleton *)
class d_bus_object_skeleton (obj : D_bus_object_skeleton.t) = object (self)
  inherit Gd_bus_object_skeleton_signals.d_bus_object_skeleton_signals obj

  method add_interface : 'p1. (#GD_bus_interface_skeleton.d_bus_interface_skeleton as 'p1) -> unit =
    fun interface_ ->
      let interface_ = interface_#as_d_bus_interface_skeleton in
      (D_bus_object_skeleton.add_interface obj interface_)

  method flush : unit -> unit =
    fun () ->
      (D_bus_object_skeleton.flush obj)

  method remove_interface : 'p1. (#GD_bus_interface_skeleton.d_bus_interface_skeleton as 'p1) -> unit =
    fun interface_ ->
      let interface_ = interface_#as_d_bus_interface_skeleton in
      (D_bus_object_skeleton.remove_interface obj interface_)

  method remove_interface_by_name : string -> unit =
    fun interface_name ->
      (D_bus_object_skeleton.remove_interface_by_name obj interface_name)

  method set_object_path : string -> unit =
    fun object_path ->
      (D_bus_object_skeleton.set_object_path obj object_path)

  method g_object_path = D_bus_object_skeleton.get_g_object_path obj
  method set_g_object_path v =  D_bus_object_skeleton.set_g_object_path obj v

    method as_d_bus_object_skeleton = obj
end

