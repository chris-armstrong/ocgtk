(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrColor from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_color_t = GAttr_color_cycle_ed189c09.attr_color_t

class attr_color : Attr_color_cycle_ed189c09.Attr_color.t -> attr_color_t

val make : Attr_color_cycle_ed189c09.Attribute.t -> Color.t -> attr_color_t
