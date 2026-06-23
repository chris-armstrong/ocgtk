(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrInt from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_int_t = GAttr_color_cycle_ed189c09.attr_int_t

class attr_int = GAttr_color_cycle_ed189c09.attr_int

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : int) :
    attr_int_t =
  new attr_int (Attr_color_cycle_ed189c09.Attr_int.make attr value)
