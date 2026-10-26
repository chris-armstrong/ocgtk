class type d_bus_object_skeleton_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t

  method on_authorize_method :
    ?after:bool ->
    callback:
      (interface:D_bus_interface_skeleton.d_bus_interface_skeleton_t ->
      invocation:D_bus_method_invocation.d_bus_method_invocation_t ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit

  method flush : unit -> unit

  method remove_interface :
    D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit

  method remove_interface_by_name : string -> unit
  method set_object_path : string -> unit
  method g_object_path : string
  method set_g_object_path : string -> unit
  method as_d_bus_object_skeleton : Raw.D_bus_object_skeleton.t
end

(* High-level class for DBusObjectSkeleton *)
class d_bus_object_skeleton (obj : Raw.D_bus_object_skeleton.t) :
  d_bus_object_skeleton_t =
  object (self)
    inherit
      D_bus_interface_and__d_bus_object.d_bus_object
        (Raw.D_bus_object.from_gobject obj)

    method on_authorize_method ?(after = false) ~callback () =
      Raw.D_bus_object_skeleton.on_authorize_method ~after
        self#as_d_bus_object_skeleton ~callback:(fun ~interface ~invocation ->
          callback
            ~interface:
              (new D_bus_interface_skeleton.d_bus_interface_skeleton interface)
            ~invocation:
              (new D_bus_method_invocation.d_bus_method_invocation invocation))

    method add_interface :
        D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit =
      fun interface_ ->
        let interface_ = interface_#as_d_bus_interface_skeleton in
        Raw.D_bus_object_skeleton.add_interface obj interface_

    method flush : unit -> unit = fun () -> Raw.D_bus_object_skeleton.flush obj

    method remove_interface :
        D_bus_interface_skeleton.d_bus_interface_skeleton_t -> unit =
      fun interface_ ->
        let interface_ = interface_#as_d_bus_interface_skeleton in
        Raw.D_bus_object_skeleton.remove_interface obj interface_

    method remove_interface_by_name : string -> unit =
      fun interface_name ->
        Raw.D_bus_object_skeleton.remove_interface_by_name obj interface_name

    method set_object_path : string -> unit =
      fun object_path ->
        Raw.D_bus_object_skeleton.set_object_path obj object_path

    method g_object_path = Raw.D_bus_object_skeleton.get_g_object_path obj

    method set_g_object_path v =
      Raw.D_bus_object_skeleton.set_g_object_path obj v

    method as_d_bus_object_skeleton = obj
  end

let new_ (object_path : string) : d_bus_object_skeleton_t =
  let obj_ = Raw.D_bus_object_skeleton.new_ object_path in
  new d_bus_object_skeleton obj_
