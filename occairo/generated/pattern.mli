class type pattern_t = object
  method as_pattern : Raw.Pattern.t
end

class pattern : Raw.Pattern.t -> pattern_t
