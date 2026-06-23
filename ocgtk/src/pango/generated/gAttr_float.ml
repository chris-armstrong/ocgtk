(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrFloat from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_float_t = GAttr_color_cycle_ed189c09.attr_float_t

class attr_float = GAttr_color_cycle_ed189c09.attr_float

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : float) :
    attr_float_t =
  new attr_float (Attr_color_cycle_ed189c09.Attr_float.make attr value)
