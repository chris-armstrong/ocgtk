class type attr_shape_t = object
  (** {2:conversions Conversions} *)

  method as_attr_shape : Raw.Attr_shape.t
end

(* High-level class for AttrShape *)
class attr_shape (obj : Raw.Attr_shape.t) : attr_shape_t =
  object (self)
    method as_attr_shape = obj
  end
