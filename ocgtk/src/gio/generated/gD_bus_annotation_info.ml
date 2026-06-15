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

(* High-level class for DBusAnnotationInfo *)
class d_bus_annotation_info (obj : D_bus_annotation_info.t) :
  d_bus_annotation_info_t =
  object (self)
    method ref : unit -> D_bus_annotation_info.t =
      fun () -> D_bus_annotation_info.ref obj

    method get_ref_count : int = D_bus_annotation_info.get_ref_count obj

    method set_ref_count : int -> unit =
      fun v -> D_bus_annotation_info.set_ref_count obj v

    method get_key : string = D_bus_annotation_info.get_key obj

    method set_key : string -> unit =
      fun v -> D_bus_annotation_info.set_key obj v

    method get_value : string = D_bus_annotation_info.get_value obj

    method set_value : string -> unit =
      fun v -> D_bus_annotation_info.set_value obj v

    method as_d_bus_annotation_info = obj
  end

let make (ref_count : int) (key : string) (value : string) :
    d_bus_annotation_info_t =
  new d_bus_annotation_info (D_bus_annotation_info.make ref_count key value)
