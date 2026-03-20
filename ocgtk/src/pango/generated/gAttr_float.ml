class type attr_float_t = object
    method as_attr_float : Attr_float.t
end

(* High-level class for AttrFloat *)
class attr_float (obj : Attr_float.t) : attr_float_t = object (self)

    method as_attr_float = obj
end

