(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for AttrShape from cyclic group Attr_color_cycle_ed189c09 *)

class type attr_shape_t = GAttr_color_cycle_ed189c09.attr_shape_t

class attr_shape = GAttr_color_cycle_ed189c09.attr_shape

let make (attr : Attr_color_cycle_ed189c09.Attribute.t) (ink_rect : Rectangle.t)
    (logical_rect : Rectangle.t) (destroy_func : unit) : attr_shape_t =
  new attr_shape
    (Attr_color_cycle_ed189c09.Attr_shape.make attr ink_rect logical_rect
       destroy_func)
