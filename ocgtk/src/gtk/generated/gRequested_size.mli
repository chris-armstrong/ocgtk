class type requested_size_t = object
    method as_requested_size : Requested_size.t
end

class requested_size : Requested_size.t -> requested_size_t

