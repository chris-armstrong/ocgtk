(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class d_bus_interface (obj : D_bus_interface_and__d_bus_object.D_bus_interface.t) = object (self)

  method get_info : unit -> D_bus_interface_info.t =
    fun () ->
      (D_bus_interface_and__d_bus_object.D_bus_interface.get_info obj)

    method as_d_bus_interface = obj
end
(* Signal class defined in gd_bus_object_signals.ml *)


and d_bus_object (obj : D_bus_interface_and__d_bus_object.D_bus_object.t) = object (self)
  inherit Gd_bus_object_signals.d_bus_object_signals obj

  method get_object_path : unit -> string =
    fun () ->
      (D_bus_interface_and__d_bus_object.D_bus_object.get_object_path obj)

    method as_d_bus_object = obj
end
