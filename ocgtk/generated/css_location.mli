class type css_location_t = object
  method as_css_location : Raw.Css_location.t
end

class css_location : Raw.Css_location.t -> css_location_t
