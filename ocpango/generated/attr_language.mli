class type attr_language_t = object
  method as_attr_language : Raw.Attr_language.t
end

class attr_language : Raw.Attr_language.t -> attr_language_t
