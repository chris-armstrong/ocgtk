(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type d_bus_interface_t = object
  method dup_object : unit -> d_bus_object_t option
  method get_info : unit -> D_bus_interface_info.t
  method set_object : d_bus_object_t option -> unit

  method as_d_bus_interface :
    D_bus_interface_and__d_bus_object.D_bus_interface.t
end

and d_bus_object_t = object
  method get_interface : string -> d_bus_interface_t option
  method get_interfaces : unit -> d_bus_interface_t list
  method get_object_path : unit -> string
  method as_d_bus_object : D_bus_interface_and__d_bus_object.D_bus_object.t
end

class d_bus_interface
  (obj : D_bus_interface_and__d_bus_object.D_bus_interface.t) :
  d_bus_interface_t =
  object (self)
    method dup_object : unit -> d_bus_object_t option =
      fun () ->
        Option.map
          (fun ret -> new d_bus_object ret)
          (D_bus_interface_and__d_bus_object.D_bus_interface.dup_object obj)

    method get_info : unit -> D_bus_interface_info.t =
      fun () -> D_bus_interface_and__d_bus_object.D_bus_interface.get_info obj

    method set_object : d_bus_object_t option -> unit =
      fun object_ ->
        let object_ = Option.map (fun c -> c#as_d_bus_object) object_ in
        D_bus_interface_and__d_bus_object.D_bus_interface.set_object obj object_

    method as_d_bus_interface = obj
  end

and d_bus_object (obj : D_bus_interface_and__d_bus_object.D_bus_object.t) :
  d_bus_object_t =
  object (self)
    method get_interface : string -> d_bus_interface_t option =
      fun interface_name ->
        Option.map
          (fun ret -> new d_bus_interface ret)
          (D_bus_interface_and__d_bus_object.D_bus_object.get_interface obj
             interface_name)

    method get_interfaces : unit -> d_bus_interface_t list =
      fun () ->
        (List.map (fun ret -> new d_bus_interface ret))
          (D_bus_interface_and__d_bus_object.D_bus_object.get_interfaces obj)

    method get_object_path : unit -> string =
      fun () ->
        D_bus_interface_and__d_bus_object.D_bus_object.get_object_path obj

    method as_d_bus_object = obj
  end
