class type pattern_t = object
  method as_pattern : Pattern.t
end

(* High-level class for Pattern *)
class pattern (obj : Pattern.t) : pattern_t =
  object (self)
    method as_pattern = obj
  end
