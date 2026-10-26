class type d_bus_annotation_info_t = object
  method ref : unit -> D_bus_annotation_info.t
  method as_d_bus_annotation_info : D_bus_annotation_info.t
end

(* High-level class for DBusAnnotationInfo *)
class d_bus_annotation_info (obj : D_bus_annotation_info.t) :
  d_bus_annotation_info_t =
  object (self)
    method ref : unit -> D_bus_annotation_info.t =
      fun () -> D_bus_annotation_info.ref obj

    method as_d_bus_annotation_info = obj
  end
