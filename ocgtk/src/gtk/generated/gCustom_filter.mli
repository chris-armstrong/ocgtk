class type custom_filter_t = object
  inherit GFilter.filter_t
  method as_custom_filter : Custom_filter.t
end

class custom_filter : Custom_filter.t -> custom_filter_t
