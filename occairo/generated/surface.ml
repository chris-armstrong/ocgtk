class type surface_t = object
  (** {2:conversions Conversions} *)

  method as_surface : Raw.Surface.t
end

(* High-level class for Surface *)
class surface (obj : Raw.Surface.t) : surface_t =
  object (self)
    method as_surface = obj
  end
