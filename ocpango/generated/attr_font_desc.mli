(** The [PangoAttrFontDesc] structure is used to store an attribute that sets
    all aspects of the font description at once.

    Its methods, signals and properties are on {!class-type-attr_font_desc_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocpango.Raw.Attr_font_desc}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AttrFontDesc].}

    The [PangoAttrFontDesc] structure is used to store an attribute that sets
    all aspects of the font description at once. *)
class type attr_font_desc_t = object
  (** {2:conversions Conversions} *)

  method as_attr_font_desc : Raw.Attr_font_desc.t
end

class attr_font_desc : Raw.Attr_font_desc.t -> attr_font_desc_t
(** Wraps a raw handle of {!Ocpango.Raw.Attr_font_desc.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
