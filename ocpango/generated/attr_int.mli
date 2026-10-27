(** The [PangoAttrInt] structure is used to represent attributes with an integer
    or enumeration value.

    Its methods, signals and properties are on {!class-type-attr_int_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_int}. *)

(** The methods, signals and properties of a [PangoAttrInt]. *)
class type attr_int_t = object
  method as_attr_int : Raw.Attr_int.t
end

class attr_int : Raw.Attr_int.t -> attr_int_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_int.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttrInt], give one already wrapped. *)
