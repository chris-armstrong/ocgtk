class type attr_shape_t = object
  method as_attr_shape : Attr_shape.t
end

(* High-level class for AttrShape *)
class attr_shape (obj : Attr_shape.t) : attr_shape_t =
  object (self)
    method as_attr_shape = obj
  end
