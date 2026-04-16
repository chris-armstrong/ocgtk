class type attr_class_t = object
  method as_attr_class : Attr_class.t
end

(* High-level class for AttrClass *)
class attr_class (obj : Attr_class.t) : attr_class_t =
  object (self)
    method as_attr_class = obj
  end
