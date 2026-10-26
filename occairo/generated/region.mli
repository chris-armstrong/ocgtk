class type region_t = object
  method as_region : Raw.Region.t
end

class region : Raw.Region.t -> region_t
