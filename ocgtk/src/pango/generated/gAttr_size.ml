(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrSize from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_size_t = GAttr_color_cycle_ed189c09.attr_size_t

class attr_size = GAttr_color_cycle_ed189c09.attr_size

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (size : int)
    (absolute : int) : attr_size_t =
  new attr_size (Attr_color_cycle_ed189c09.Attr_size.make attr size absolute)
