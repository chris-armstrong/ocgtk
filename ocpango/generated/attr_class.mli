(** The [PangoAttrClass] structure stores the type and operations for a
    particular type of attribute.

    Its methods, signals and properties are on {!class-type-attr_class_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocpango.Raw.Attr_class}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrClass].}

    The [PangoAttrClass] structure stores the type and operations for a
    particular type of attribute.

    The functions in this structure should not be called directly. Instead, one
    should use the wrapper functions provided for [PangoAttribute]. *)
class type attr_class_t = object
  (** {2:conversions Conversions} *)

  method as_attr_class : Raw.Attr_class.t
end

class attr_class : Raw.Attr_class.t -> attr_class_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_class.t}. *)

(** {1:description Description}

    The [PangoAttrClass] structure stores the type and operations for a
    particular type of attribute.

    The functions in this structure should not be called directly. Instead, one
    should use the wrapper functions provided for [PangoAttribute]. *)
