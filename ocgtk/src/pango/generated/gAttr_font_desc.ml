(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrFontDesc from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_font_desc_t = GAttr_color_cycle_ed189c09.attr_font_desc_t

class attr_font_desc = GAttr_color_cycle_ed189c09.attr_font_desc

let make (attr : Attr_color_cycle_ed189c09.Attribute.t)
    (desc : Font_description.t) : attr_font_desc_t =
  new attr_font_desc (Attr_color_cycle_ed189c09.Attr_font_desc.make attr desc)
