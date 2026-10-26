class type d_bus_interface_skeleton_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_interface_t

  method on_g_authorize_method :
    ?after:bool ->
    callback:
      (invocation:D_bus_method_invocation.d_bus_method_invocation_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method export :
    D_bus_connection.d_bus_connection_t -> string -> (bool, GError.t) result

  method flush : unit -> unit
  method get_connection : unit -> D_bus_connection.d_bus_connection_t option
  method get_connections : unit -> D_bus_connection.d_bus_connection_t list
  method get_flags : unit -> Enums.dbusinterfaceskeletonflags
  method get_object_path : unit -> string option
  method get_properties : unit -> Gvariant.t
  method get_vtable : unit -> Raw.D_bus_interface_v_table.t
  method has_connection : D_bus_connection.d_bus_connection_t -> bool
  method set_flags : Enums.dbusinterfaceskeletonflags -> unit
  method unexport : unit -> unit
  method unexport_from_connection : D_bus_connection.d_bus_connection_t -> unit
  method g_flags : Enums.dbusinterfaceskeletonflags
  method set_g_flags : Enums.dbusinterfaceskeletonflags -> unit
  method as_d_bus_interface_skeleton : Raw.D_bus_interface_skeleton.t
end

(* High-level class for DBusInterfaceSkeleton *)
class d_bus_interface_skeleton (obj : Raw.D_bus_interface_skeleton.t) :
  d_bus_interface_skeleton_t =
  object (self)
    inherit
      D_bus_interface_and__d_bus_object.d_bus_interface
        (Raw.D_bus_interface.from_gobject obj)

    method on_g_authorize_method ?(after = false) ~callback () =
      Raw.D_bus_interface_skeleton.on_g_authorize_method ~after
        self#as_d_bus_interface_skeleton ~callback:(fun ~invocation ->
          callback
            ~invocation:
              (new D_bus_method_invocation.d_bus_method_invocation invocation))

    method export :
        D_bus_connection.d_bus_connection_t -> string -> (bool, GError.t) result
        =
      fun connection object_path ->
        let connection = connection#as_d_bus_connection in
        Raw.D_bus_interface_skeleton.export obj connection object_path

    method flush : unit -> unit =
      fun () -> Raw.D_bus_interface_skeleton.flush obj

    method get_connection : unit -> D_bus_connection.d_bus_connection_t option =
      fun () ->
        Option.map
          (fun ret -> new D_bus_connection.d_bus_connection ret)
          (Raw.D_bus_interface_skeleton.get_connection obj)

    method get_connections : unit -> D_bus_connection.d_bus_connection_t list =
      fun () ->
        (List.map (fun ret -> new D_bus_connection.d_bus_connection ret))
          (Raw.D_bus_interface_skeleton.get_connections obj)

    method get_flags : unit -> Enums.dbusinterfaceskeletonflags =
      fun () -> Raw.D_bus_interface_skeleton.get_flags obj

    method get_object_path : unit -> string option =
      fun () -> Raw.D_bus_interface_skeleton.get_object_path obj

    method get_properties : unit -> Gvariant.t =
      fun () -> Raw.D_bus_interface_skeleton.get_properties obj

    method get_vtable : unit -> Raw.D_bus_interface_v_table.t =
      fun () -> Raw.D_bus_interface_skeleton.get_vtable obj

    method has_connection : D_bus_connection.d_bus_connection_t -> bool =
      fun connection ->
        let connection = connection#as_d_bus_connection in
        Raw.D_bus_interface_skeleton.has_connection obj connection

    method set_flags : Enums.dbusinterfaceskeletonflags -> unit =
      fun flags -> Raw.D_bus_interface_skeleton.set_flags obj flags

    method unexport : unit -> unit =
      fun () -> Raw.D_bus_interface_skeleton.unexport obj

    method unexport_from_connection :
        D_bus_connection.d_bus_connection_t -> unit =
      fun connection ->
        let connection = connection#as_d_bus_connection in
        Raw.D_bus_interface_skeleton.unexport_from_connection obj connection

    method g_flags = Raw.D_bus_interface_skeleton.get_g_flags obj
    method set_g_flags v = Raw.D_bus_interface_skeleton.set_g_flags obj v
    method as_d_bus_interface_skeleton = obj
  end
