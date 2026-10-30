class type custom_filter_t = object
  inherit Filter.filter_t

  (** {2:conversions Conversions} *)

  method as_custom_filter : Raw.Custom_filter.t
end

(* High-level class for CustomFilter *)
class custom_filter (obj : Raw.Custom_filter.t) : custom_filter_t =
  object (self)
    inherit Filter.filter (obj :> Raw.Filter.t)
    method as_custom_filter = obj
  end
