class type d_bus_method_info_t = object
  method ref : unit -> D_bus_method_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_name : string
  method set_name : string -> unit
  method as_d_bus_method_info : D_bus_method_info.t
end

(* High-level class for DBusMethodInfo *)
class d_bus_method_info (obj : D_bus_method_info.t) : d_bus_method_info_t =
  object (self)
    method ref : unit -> D_bus_method_info.t =
      fun () -> D_bus_method_info.ref obj

    method get_ref_count : int = D_bus_method_info.get_ref_count obj

    method set_ref_count : int -> unit =
      fun v -> D_bus_method_info.set_ref_count obj v

    method get_name : string = D_bus_method_info.get_name obj
    method set_name : string -> unit = fun v -> D_bus_method_info.set_name obj v
    method as_d_bus_method_info = obj
  end

let make (ref_count : int) (name : string) : d_bus_method_info_t =
  new d_bus_method_info (D_bus_method_info.make ref_count name)
