class type attr_string_t = object
  (** {2:conversions Conversions} *)

  method as_attr_string : Raw.Attr_string.t
end

(* High-level class for AttrString *)
class attr_string (obj : Raw.Attr_string.t) : attr_string_t =
  object (self)
    method as_attr_string = obj
  end
