class type pattern_t = object
  (** {2:conversions Conversions} *)

  method as_pattern : Raw.Pattern.t
end

(* High-level class for Pattern *)
class pattern (obj : Raw.Pattern.t) : pattern_t =
  object (self)
    method as_pattern = obj
  end
