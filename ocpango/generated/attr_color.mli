(** The [PangoAttrColor] structure is used to represent attributes that are
    colors.

    Its methods, signals and properties are on {!class-type-attr_color_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Attr_color}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrColor].}

    The [PangoAttrColor] structure is used to represent attributes that are
    colors. *)
class type attr_color_t = object
  (** {2:conversions Conversions} *)

  method as_attr_color : Raw.Attr_color.t
end

class attr_color : Raw.Attr_color.t -> attr_color_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_color.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
