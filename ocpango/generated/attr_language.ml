class type attr_language_t = object
  method as_attr_language : Attr_language.t
end

(* High-level class for AttrLanguage *)
class attr_language (obj : Attr_language.t) : attr_language_t =
  object (self)
    method as_attr_language = obj
  end
