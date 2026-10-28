class type color_stop_t = object
  (** {2:conversions Conversions} *)

  method as_color_stop : Raw.Color_stop.t
end

(* High-level class for ColorStop *)
class color_stop (obj : Raw.Color_stop.t) : color_stop_t =
  object (self)
    method as_color_stop = obj
  end
