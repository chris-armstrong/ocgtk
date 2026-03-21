(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type d_bus_interface_t = object
    method dup_object : unit -> d_bus_object_t option
    method get_info : unit -> D_bus_interface_info.t
    method as_d_bus_interface : D_bus_interface_and__d_bus_object.D_bus_interface.t
end

and d_bus_object_t = object
    inherit Gd_bus_object_signals.d_bus_object_signals
    method get_interface : string -> d_bus_interface_t option
    method get_object_path : unit -> string
    method as_d_bus_object : D_bus_interface_and__d_bus_object.D_bus_object.t
end


class d_bus_interface (obj : D_bus_interface_and__d_bus_object.D_bus_interface.t) : d_bus_interface_t = object (self)

  method dup_object : unit -> d_bus_object_t option =
    fun () ->
      Option.map (fun ret -> new d_bus_object ret) (D_bus_interface_and__d_bus_object.D_bus_interface.dup_object obj)

  method get_info : unit -> D_bus_interface_info.t =
    fun () ->
      (D_bus_interface_and__d_bus_object.D_bus_interface.get_info obj)

    method as_d_bus_interface = obj
end
(* Signal class defined in gd_bus_object_signals.ml *)


and d_bus_object (obj : D_bus_interface_and__d_bus_object.D_bus_object.t) : d_bus_object_t = object (self)
  inherit Gd_bus_object_signals.d_bus_object_signals obj

  method get_interface : string -> d_bus_interface_t option =
    fun interface_name ->
      Option.map (fun ret -> new d_bus_interface ret) (D_bus_interface_and__d_bus_object.D_bus_object.get_interface obj interface_name)

  method get_object_path : unit -> string =
    fun () ->
      (D_bus_interface_and__d_bus_object.D_bus_object.get_object_path obj)

    method as_d_bus_object = obj
end
