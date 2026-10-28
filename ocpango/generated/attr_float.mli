(** The [PangoAttrFloat] structure is used to represent attributes with a float
    or double value.

    Its methods, signals and properties are on {!class-type-attr_float_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_float}. *)

(** The methods, signals and properties of a [AttrFloat]. *)
class type attr_float_t = object
  method as_attr_float : Raw.Attr_float.t
end

class attr_float : Raw.Attr_float.t -> attr_float_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_float.t}. *)
