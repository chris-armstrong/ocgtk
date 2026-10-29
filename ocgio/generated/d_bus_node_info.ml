class type d_bus_node_info_t = object
  (** {2:methods Methods} *)

  method lookup_interface : string -> Raw.D_bus_interface_info.t option
  (** Looks up information about an interface.

      The cost of this function is O(n) in number of interfaces. *)

  method ref : unit -> Raw.D_bus_node_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_node_info : Raw.D_bus_node_info.t
end

(* High-level class for DBusNodeInfo *)
class d_bus_node_info (obj : Raw.D_bus_node_info.t) : d_bus_node_info_t =
  object (self)
    method lookup_interface : string -> Raw.D_bus_interface_info.t option =
      fun name -> Raw.D_bus_node_info.lookup_interface obj name

    method ref : unit -> Raw.D_bus_node_info.t =
      fun () -> Raw.D_bus_node_info.ref obj

    method as_d_bus_node_info = obj
  end

let new_for_xml (xml_data : string) : (d_bus_node_info_t, GError.t) result =
  let obj_ = Raw.D_bus_node_info.new_for_xml xml_data in
  Result.map (fun obj_ -> new d_bus_node_info obj_) obj_
