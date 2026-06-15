(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrShape from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_shape_t = GAttr_color_cycle_ed189c09.attr_shape_t

class attr_shape : Attr_color_cycle_ed189c09.Attr_shape.t -> attr_shape_t

val make :
  Attr_color_cycle_ed189c09.Attribute.t ->
  Rectangle.t ->
  Rectangle.t ->
  unit ->
  attr_shape_t
