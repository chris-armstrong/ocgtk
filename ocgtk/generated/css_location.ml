class type css_location_t = object
  (** {2:conversions Conversions} *)

  method as_css_location : Raw.Css_location.t
end

(* High-level class for CssLocation *)
class css_location (obj : Raw.Css_location.t) : css_location_t =
  object (self)
    method as_css_location = obj
  end
