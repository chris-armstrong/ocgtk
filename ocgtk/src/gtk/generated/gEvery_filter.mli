class type every_filter_t = object
    method as_every_filter : Every_filter.t
end

class every_filter : Every_filter.t -> every_filter_t

