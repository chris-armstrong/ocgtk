(** Information about an annotation.

    Its methods, signals and properties are on
    {!class-type-d_bus_annotation_info_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_annotation_info}. *)

(** The methods, signals and properties of a [DBusAnnotationInfo]. *)
class type d_bus_annotation_info_t = object
  method ref : unit -> Raw.D_bus_annotation_info.t
  (** If [info] is statically allocated does nothing. Otherwise increases the
      reference count. *)

  method as_d_bus_annotation_info : Raw.D_bus_annotation_info.t
end

class d_bus_annotation_info :
  Raw.D_bus_annotation_info.t ->
  d_bus_annotation_info_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_annotation_info.t}. *)
