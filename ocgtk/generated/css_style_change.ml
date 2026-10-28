class type css_style_change_t = object
  (** {2:conversions Conversions} *)

  method as_css_style_change : Raw.Css_style_change.t
end

(* High-level class for CssStyleChange *)
class css_style_change (obj : Raw.Css_style_change.t) : css_style_change_t =
  object (self)
    method as_css_style_change = obj
  end
