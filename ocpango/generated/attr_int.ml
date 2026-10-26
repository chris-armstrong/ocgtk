class type attr_int_t = object
  method as_attr_int : Attr_int.t
end

(* High-level class for AttrInt *)
class attr_int (obj : Attr_int.t) : attr_int_t =
  object (self)
    method as_attr_int = obj
  end
