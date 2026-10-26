class type region_t = object
  method as_region : Region.t
end

(* High-level class for Region *)
class region (obj : Region.t) : region_t =
  object (self)
    method as_region = obj
  end
