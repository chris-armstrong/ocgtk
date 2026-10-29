class type shadow_t = object
  (** {2:conversions Conversions} *)

  method as_shadow : Raw.Shadow.t
end

(* High-level class for Shadow *)
class shadow (obj : Raw.Shadow.t) : shadow_t =
  object (self)
    method as_shadow = obj
  end
