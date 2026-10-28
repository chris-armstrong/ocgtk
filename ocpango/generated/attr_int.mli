(** The [PangoAttrInt] structure is used to represent attributes with an integer
    or enumeration value.

    Its methods, signals and properties are on {!class-type-attr_int_t}. The
    functions it is built on are in {!Ocpango.Raw.Attr_int}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrInt].}

    The [PangoAttrInt] structure is used to represent attributes with an integer
    or enumeration value. *)
class type attr_int_t = object
  method as_attr_int : Raw.Attr_int.t
end

class attr_int : Raw.Attr_int.t -> attr_int_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_int.t}. *)
