class type d_bus_property_info_t = object
  method ref : unit -> D_bus_property_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_name : string
  method set_name : string -> unit
  method get_signature : string
  method set_signature : string -> unit
  method get_flags : Gio_enums.dbuspropertyinfoflags
  method set_flags : Gio_enums.dbuspropertyinfoflags -> unit
  method as_d_bus_property_info : D_bus_property_info.t
end

(* High-level class for DBusPropertyInfo *)
class d_bus_property_info (obj : D_bus_property_info.t) : d_bus_property_info_t
  =
  object (self)
    method ref : unit -> D_bus_property_info.t =
      fun () -> D_bus_property_info.ref obj

    method get_ref_count : int = D_bus_property_info.get_ref_count obj

    method set_ref_count : int -> unit =
      fun v -> D_bus_property_info.set_ref_count obj v

    method get_name : string = D_bus_property_info.get_name obj

    method set_name : string -> unit =
      fun v -> D_bus_property_info.set_name obj v

    method get_signature : string = D_bus_property_info.get_signature obj

    method set_signature : string -> unit =
      fun v -> D_bus_property_info.set_signature obj v

    method get_flags : Gio_enums.dbuspropertyinfoflags =
      D_bus_property_info.get_flags obj

    method set_flags : Gio_enums.dbuspropertyinfoflags -> unit =
      fun v -> D_bus_property_info.set_flags obj v

    method as_d_bus_property_info = obj
  end

let make (ref_count : int) (name : string) (signature : string)
    (flags : Gio_enums.dbuspropertyinfoflags) : d_bus_property_info_t =
  new d_bus_property_info
    (D_bus_property_info.make ref_count name signature flags)
