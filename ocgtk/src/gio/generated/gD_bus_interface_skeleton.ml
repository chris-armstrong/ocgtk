(* Signal class defined in gd_bus_interface_skeleton_signals.ml *)

class type d_bus_interface_skeleton_t = object
    inherit Gd_bus_interface_skeleton_signals.d_bus_interface_skeleton_signals
    method export : GD_bus_connection.d_bus_connection_t -> string -> (bool, GError.t) result
    method flush : unit -> unit
    method get_connection : unit -> GD_bus_connection.d_bus_connection_t option
    method get_connections : unit -> D_bus_connection.t list
    method get_flags : unit -> Gio_enums.dbusinterfaceskeletonflags
    method get_info : unit -> D_bus_interface_info.t
    method get_object_path : unit -> string option
    method get_properties : unit -> Gvariant.t
    method get_vtable : unit -> D_bus_interface_v_table.t
    method has_connection : GD_bus_connection.d_bus_connection_t -> bool
    method set_flags : Gio_enums.dbusinterfaceskeletonflags -> unit
    method unexport : unit -> unit
    method unexport_from_connection : GD_bus_connection.d_bus_connection_t -> unit
    method g_flags : Gio_enums.dbusinterfaceskeletonflags
    method set_g_flags : Gio_enums.dbusinterfaceskeletonflags -> unit
    method as_d_bus_interface_skeleton : D_bus_interface_skeleton.t
end

(* High-level class for DBusInterfaceSkeleton *)
class d_bus_interface_skeleton (obj : D_bus_interface_skeleton.t) : d_bus_interface_skeleton_t = object (self)
  inherit Gd_bus_interface_skeleton_signals.d_bus_interface_skeleton_signals obj

  method export : GD_bus_connection.d_bus_connection_t -> string -> (bool, GError.t) result =
    fun connection object_path ->
      let connection = connection#as_d_bus_connection in
      (D_bus_interface_skeleton.export obj connection object_path)

  method flush : unit -> unit =
    fun () ->
      (D_bus_interface_skeleton.flush obj)

  method get_connection : unit -> GD_bus_connection.d_bus_connection_t option =
    fun () ->
      Option.map (fun ret -> new GD_bus_connection.d_bus_connection ret) (D_bus_interface_skeleton.get_connection obj)

  method get_connections : unit -> D_bus_connection.t list =
    fun () ->
      (D_bus_interface_skeleton.get_connections obj)

  method get_flags : unit -> Gio_enums.dbusinterfaceskeletonflags =
    fun () ->
      (D_bus_interface_skeleton.get_flags obj)

  method get_info : unit -> D_bus_interface_info.t =
    fun () ->
      (D_bus_interface_skeleton.get_info obj)

  method get_object_path : unit -> string option =
    fun () ->
      (D_bus_interface_skeleton.get_object_path obj)

  method get_properties : unit -> Gvariant.t =
    fun () ->
      (D_bus_interface_skeleton.get_properties obj)

  method get_vtable : unit -> D_bus_interface_v_table.t =
    fun () ->
      (D_bus_interface_skeleton.get_vtable obj)

  method has_connection : GD_bus_connection.d_bus_connection_t -> bool =
    fun connection ->
      let connection = connection#as_d_bus_connection in
      (D_bus_interface_skeleton.has_connection obj connection)

  method set_flags : Gio_enums.dbusinterfaceskeletonflags -> unit =
    fun flags ->
      (D_bus_interface_skeleton.set_flags obj flags)

  method unexport : unit -> unit =
    fun () ->
      (D_bus_interface_skeleton.unexport obj)

  method unexport_from_connection : GD_bus_connection.d_bus_connection_t -> unit =
    fun connection ->
      let connection = connection#as_d_bus_connection in
      (D_bus_interface_skeleton.unexport_from_connection obj connection)

  method g_flags = D_bus_interface_skeleton.get_g_flags obj
  method set_g_flags v =  D_bus_interface_skeleton.set_g_flags obj v

    method as_d_bus_interface_skeleton = obj
end

