class type d_bus_annotation_info_t = object
    method ref : unit -> D_bus_annotation_info.t
    method unref : unit -> unit
    method as_d_bus_annotation_info : D_bus_annotation_info.t
end

class d_bus_annotation_info : D_bus_annotation_info.t -> d_bus_annotation_info_t

