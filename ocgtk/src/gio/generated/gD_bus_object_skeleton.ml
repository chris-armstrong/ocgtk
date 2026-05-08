class type d_bus_object_skeleton_t = object
  inherit GD_bus_interface_and__d_bus_object.d_bus_object_t

  method add_interface :
    GD_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit

  method flush : unit -> unit

  method remove_interface :
    GD_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit

  method remove_interface_by_name : string -> unit
  method set_object_path : string -> unit
  method g_object_path : string
  method set_g_object_path : string -> unit
  method as_d_bus_object_skeleton : D_bus_object_skeleton.t
end

(* High-level class for DBusObjectSkeleton *)
class d_bus_object_skeleton (obj : D_bus_object_skeleton.t) :
  d_bus_object_skeleton_t =
  object (self)
    inherit
      GD_bus_interface_and__d_bus_object.d_bus_object
        (D_bus_interface_and__d_bus_object.D_bus_object.from_gobject obj)

    method add_interface :
        GD_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit =
      fun interface_ ->
        let interface_ = interface_#as_d_bus_interface_skeleton in
        D_bus_object_skeleton.add_interface obj interface_

    method flush : unit -> unit = fun () -> D_bus_object_skeleton.flush obj

    method remove_interface :
        GD_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit =
      fun interface_ ->
        let interface_ = interface_#as_d_bus_interface_skeleton in
        D_bus_object_skeleton.remove_interface obj interface_

    method remove_interface_by_name : string -> unit =
      fun interface_name ->
        D_bus_object_skeleton.remove_interface_by_name obj interface_name

    method set_object_path : string -> unit =
      fun object_path -> D_bus_object_skeleton.set_object_path obj object_path

    method g_object_path = D_bus_object_skeleton.get_g_object_path obj
    method set_g_object_path v = D_bus_object_skeleton.set_g_object_path obj v
    method as_d_bus_object_skeleton = obj
  end

let new_ (object_path : string) : d_bus_object_skeleton_t =
  let obj_ = D_bus_object_skeleton.new_ object_path in
  new d_bus_object_skeleton obj_
