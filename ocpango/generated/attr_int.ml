class type attr_int_t = object
  (** {2:conversions Conversions} *)

  method as_attr_int : Raw.Attr_int.t
end

(* High-level class for AttrInt *)
class attr_int (obj : Raw.Attr_int.t) : attr_int_t =
  object (self)
    method as_attr_int = obj
  end
