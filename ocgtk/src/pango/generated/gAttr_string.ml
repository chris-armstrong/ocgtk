class type attr_string_t = object
  method as_attr_string : Attr_string.t
end

(* High-level class for AttrString *)
class attr_string (obj : Attr_string.t) : attr_string_t =
  object (self)
    method as_attr_string = obj
  end
