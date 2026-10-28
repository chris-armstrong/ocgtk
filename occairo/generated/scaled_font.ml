class type scaled_font_t = object
  (** {2:conversions Conversions} *)

  method as_scaled_font : Raw.Scaled_font.t
end

(* High-level class for ScaledFont *)
class scaled_font (obj : Raw.Scaled_font.t) : scaled_font_t =
  object (self)
    method as_scaled_font = obj
  end
