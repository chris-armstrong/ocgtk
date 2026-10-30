class type accessible_range_t = object
  (** {2:conversions Conversions} *)

  method as_accessible_range : Raw.Accessible_range.t
end

(* High-level class for AccessibleRange *)
class accessible_range (obj : Raw.Accessible_range.t) : accessible_range_t =
  object (self)
    method as_accessible_range = obj
  end
