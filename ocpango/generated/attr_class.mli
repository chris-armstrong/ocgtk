(** The [PangoAttrClass] structure stores the type and operations for a
    particular type of attribute.

    The functions in this structure should not be called directly. Instead, one
    should use the wrapper functions provided for [PangoAttribute].

    Its methods, signals and properties are on {!class-type-attr_class_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_class}. *)

(** The methods, signals and properties of a [PangoAttrClass]. *)
class type attr_class_t = object
  method as_attr_class : Raw.Attr_class.t
end

class attr_class : Raw.Attr_class.t -> attr_class_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_class.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttrClass], give one already wrapped. *)
