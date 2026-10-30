class type attr_size_t = object
  (** {2:conversions Conversions} *)

  method as_attr_size : Raw.Attr_size.t
end

(* High-level class for AttrSize *)
class attr_size (obj : Raw.Attr_size.t) : attr_size_t =
  object (self)
    method as_attr_size = obj
  end
