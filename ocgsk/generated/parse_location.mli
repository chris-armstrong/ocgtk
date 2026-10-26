class type parse_location_t = object
  method as_parse_location : Raw.Parse_location.t
end

class parse_location : Raw.Parse_location.t -> parse_location_t
