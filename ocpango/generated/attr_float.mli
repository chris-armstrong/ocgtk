(** The [PangoAttrFloat] structure is used to represent attributes with a float
    or double value.

    Its methods, signals and properties are on {!class-type-attr_float_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_float}. *)

(** The methods, signals and properties of a [PangoAttrFloat]. *)
class type attr_float_t = object
  method as_attr_float : Raw.Attr_float.t
end

class attr_float : Raw.Attr_float.t -> attr_float_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_float.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttrFloat], give one already wrapped. *)
