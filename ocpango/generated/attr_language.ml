class type attr_language_t = object
  (** {2:conversions Conversions} *)

  method as_attr_language : Raw.Attr_language.t
end

(* High-level class for AttrLanguage *)
class attr_language (obj : Raw.Attr_language.t) : attr_language_t =
  object (self)
    method as_attr_language = obj
  end
