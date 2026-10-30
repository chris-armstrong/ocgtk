class type font_options_t = object
  (** {2:conversions Conversions} *)

  method as_font_options : Raw.Font_options.t
end

(* High-level class for FontOptions *)
class font_options (obj : Raw.Font_options.t) : font_options_t =
  object (self)
    method as_font_options = obj
  end
