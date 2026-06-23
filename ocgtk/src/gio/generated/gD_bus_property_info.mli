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

class d_bus_property_info : D_bus_property_info.t -> d_bus_property_info_t

val make :
  int ->
  string ->
  string ->
  Gio_enums.dbuspropertyinfoflags ->
  d_bus_property_info_t
