(** The [PangoAttrSize] structure is used to represent attributes which set font
    size.

    Its methods, signals and properties are on {!class-type-attr_size_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Attr_size}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrSize].}

    The [PangoAttrSize] structure is used to represent attributes which set font
    size. *)
class type attr_size_t = object
  (** {2:conversions Conversions} *)

  method as_attr_size : Raw.Attr_size.t
end

class attr_size : Raw.Attr_size.t -> attr_size_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_size.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
