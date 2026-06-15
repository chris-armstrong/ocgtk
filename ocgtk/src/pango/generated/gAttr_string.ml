(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrString from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_string_t = GAttr_color_cycle_ed189c09.attr_string_t

class attr_string = GAttr_color_cycle_ed189c09.attr_string

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : string) :
    attr_string_t =
  new attr_string (Attr_color_cycle_ed189c09.Attr_string.make attr value)
