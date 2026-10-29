class type attr_float_t = object
  (** {2:conversions Conversions} *)

  method as_attr_float : Raw.Attr_float.t
end

(* High-level class for AttrFloat *)
class attr_float (obj : Raw.Attr_float.t) : attr_float_t =
  object (self)
    method as_attr_float = obj
  end
