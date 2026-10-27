(** The [PangoAttrColor] structure is used to represent attributes that are
    colors.

    Its methods, signals and properties are on {!class-type-attr_color_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_color}. *)

(** The methods, signals and properties of a [PangoAttrColor]. *)
class type attr_color_t = object
  method as_attr_color : Raw.Attr_color.t
end

class attr_color : Raw.Attr_color.t -> attr_color_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_color.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoAttrColor], give one already wrapped. *)
