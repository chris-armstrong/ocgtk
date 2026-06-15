(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Attribute from cyclic group Attr_color_cycle_ed189c09 *)

class type attribute_t = GAttr_color_cycle_ed189c09.attribute_t

class attribute = GAttr_color_cycle_ed189c09.attribute

let make (start_index : int) (end_index : int) : attribute_t =
  new attribute (Attr_color_cycle_ed189c09.Attribute.make start_index end_index)
