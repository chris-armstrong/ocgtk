class type d_bus_annotation_info_t = object
  method ref : unit -> D_bus_annotation_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_key : string
  method set_key : string -> unit
  method get_value : string
  method set_value : string -> unit
  method as_d_bus_annotation_info : D_bus_annotation_info.t
end

class d_bus_annotation_info : D_bus_annotation_info.t -> d_bus_annotation_info_t

val make : int -> string -> string -> d_bus_annotation_info_t
