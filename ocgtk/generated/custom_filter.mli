class type custom_filter_t = object
  inherit Filter.filter_t
  method as_custom_filter : Raw.Custom_filter.t
end

class custom_filter : Raw.Custom_filter.t -> custom_filter_t
