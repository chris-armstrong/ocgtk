class type attr_class_t = object
  method get_type : Pango_enums.attrtype
  method set_type : Pango_enums.attrtype -> unit
  method as_attr_class : Attr_class.t
end

(* High-level class for AttrClass *)
class attr_class (obj : Attr_class.t) : attr_class_t =
  object (self)
    method get_type : Pango_enums.attrtype = Attr_class.get_type obj

    method set_type : Pango_enums.attrtype -> unit =
      fun v -> Attr_class.set_type obj v

    method as_attr_class = obj
  end

let make (type_ : Pango_enums.attrtype) : attr_class_t =
  new attr_class (Attr_class.make type_)
