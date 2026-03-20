class type region_t = object
    method as_region : Region.t
end

class region : Region.t -> region_t

