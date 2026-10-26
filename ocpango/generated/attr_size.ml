class type attr_size_t = object
  method as_attr_size : Attr_size.t
end

(* High-level class for AttrSize *)
class attr_size (obj : Attr_size.t) : attr_size_t =
  object (self)
    method as_attr_size = obj
  end
