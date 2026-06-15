class type attr_class_t = object
  method get_type : Pango_enums.attrtype
  method set_type : Pango_enums.attrtype -> unit
  method as_attr_class : Attr_class.t
end

class attr_class : Attr_class.t -> attr_class_t

val make : Pango_enums.attrtype -> attr_class_t
