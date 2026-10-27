(** Information about an annotation.

    Its methods, signals and properties are on
    {!class-type-d_bus_annotation_info_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_annotation_info}. *)

(** The methods, signals and properties of a [GDBusAnnotationInfo]. *)
class type d_bus_annotation_info_t = object
  method ref : unit -> Raw.D_bus_annotation_info.t
  method as_d_bus_annotation_info : Raw.D_bus_annotation_info.t
end

class d_bus_annotation_info :
  Raw.D_bus_annotation_info.t ->
  d_bus_annotation_info_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_annotation_info.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusAnnotationInfo], give one already wrapped. *)
