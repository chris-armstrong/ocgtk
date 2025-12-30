(* High-level class for DBusAnnotationInfo *)
class d_bus_annotation_info (obj : D_bus_annotation_info.t) = object (self)

  method ref : unit -> D_bus_annotation_info.t =
    fun () ->
      (D_bus_annotation_info.ref obj)

  method unref : unit -> unit =
    fun () ->
      (D_bus_annotation_info.unref obj)

    method as_d_bus_annotation_info = obj
end

