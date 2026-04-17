class type parse_location_t = object
    method as_parse_location : Parse_location.t
end

class parse_location : Parse_location.t -> parse_location_t

