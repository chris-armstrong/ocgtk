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

class d_bus_interface_skeleton :
  Raw.D_bus_interface_skeleton.t ->
  d_bus_interface_skeleton_t
