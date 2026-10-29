class type region_t = object
  (** {2:conversions Conversions} *)

  method as_region : Raw.Region.t
end

(* High-level class for Region *)
class region (obj : Raw.Region.t) : region_t =
  object (self)
    method as_region = obj
  end
