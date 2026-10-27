(** The [PangoAttrSize] structure is used to represent attributes which set font
    size.

    Its methods, signals and properties are on {!class-type-attr_size_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_size}. *)

(** The methods, signals and properties of a [PangoAttrSize]. *)
class type attr_size_t = object
  method as_attr_size : Raw.Attr_size.t
end

class attr_size : Raw.Attr_size.t -> attr_size_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_size.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttrSize], give one already wrapped. *)
