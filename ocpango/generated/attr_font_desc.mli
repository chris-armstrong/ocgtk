(** The [PangoAttrFontDesc] structure is used to store an attribute that sets
    all aspects of the font description at once.

    Its methods, signals and properties are on {!class-type-attr_font_desc_t}.
    The functions it is built on are in {!Ocpango.Raw.Attr_font_desc}. *)

(** The methods, signals and properties of a [PangoAttrFontDesc]. *)
class type attr_font_desc_t = object
  method as_attr_font_desc : Raw.Attr_font_desc.t
end

class attr_font_desc : Raw.Attr_font_desc.t -> attr_font_desc_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Attr_font_desc.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoAttrFontDesc], give one already wrapped. *)
