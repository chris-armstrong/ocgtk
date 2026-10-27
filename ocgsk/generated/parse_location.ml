class type parse_location_t = object
  method as_parse_location : Raw.Parse_location.t
end

(* High-level class for ParseLocation *)
class parse_location (obj : Raw.Parse_location.t) : parse_location_t =
  object (self)
    method as_parse_location = obj
  end
