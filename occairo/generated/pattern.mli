class type pattern_t = object
  method as_pattern : Pattern.t
end

class pattern : Pattern.t -> pattern_t
