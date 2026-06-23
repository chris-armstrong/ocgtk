(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrLanguage from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_language_t = GAttr_color_cycle_ed189c09.attr_language_t

class attr_language = GAttr_color_cycle_ed189c09.attr_language

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (value : Language.t) :
    attr_language_t =
  new attr_language (Attr_color_cycle_ed189c09.Attr_language.make attr value)
