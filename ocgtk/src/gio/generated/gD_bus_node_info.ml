class type d_bus_node_info_t = object
  method lookup_interface : string -> D_bus_interface_info.t option
  method ref : unit -> D_bus_node_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_path : string
  method set_path : string -> unit
  method as_d_bus_node_info : D_bus_node_info.t
end

(* High-level class for DBusNodeInfo *)
class d_bus_node_info (obj : D_bus_node_info.t) : d_bus_node_info_t =
  object (self)
    method lookup_interface : string -> D_bus_interface_info.t option =
      fun name -> D_bus_node_info.lookup_interface obj name

    method ref : unit -> D_bus_node_info.t = fun () -> D_bus_node_info.ref obj
    method get_ref_count : int = D_bus_node_info.get_ref_count obj

    method set_ref_count : int -> unit =
      fun v -> D_bus_node_info.set_ref_count obj v

    method get_path : string = D_bus_node_info.get_path obj
    method set_path : string -> unit = fun v -> D_bus_node_info.set_path obj v
    method as_d_bus_node_info = obj
  end

let new_for_xml (xml_data : string) : (d_bus_node_info_t, GError.t) result =
  let obj_ = D_bus_node_info.new_for_xml xml_data in
  Result.map (fun obj_ -> new d_bus_node_info obj_) obj_

let make (ref_count : int) (path : string) : d_bus_node_info_t =
  new d_bus_node_info (D_bus_node_info.make ref_count path)
