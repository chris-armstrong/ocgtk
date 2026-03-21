class type any_filter_t = object
    method as_any_filter : Any_filter.t
end

class any_filter : Any_filter.t -> any_filter_t

