class type requested_size_t = object
    method as_requested_size : Requested_size.t
end

(* High-level class for RequestedSize *)
class requested_size (obj : Requested_size.t) : requested_size_t = object (self)

    method as_requested_size = obj
end

