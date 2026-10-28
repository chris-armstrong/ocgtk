(** The [PangoAttrShape] structure is used to represent attributes which impose
    shape restrictions.

    Its methods, signals and properties are on {!class-type-attr_shape_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_shape}. *)

(** The methods, signals and properties of a [AttrShape]. *)
class type attr_shape_t = object
  method as_attr_shape : Raw.Attr_shape.t
end

class attr_shape : Raw.Attr_shape.t -> attr_shape_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_shape.t}. *)
