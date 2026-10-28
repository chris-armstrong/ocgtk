class type any_filter_t = object
  inherit Multi_filter.multi_filter_t

  (** {2:conversions Conversions} *)

  method as_any_filter : Raw.Any_filter.t
end

(* High-level class for AnyFilter *)
class any_filter (obj : Raw.Any_filter.t) : any_filter_t =
  object (self)
    inherit Multi_filter.multi_filter (obj :> Raw.Multi_filter.t)
    method as_any_filter = obj
  end

let new_ () : any_filter_t = new any_filter (Raw.Any_filter.new_ ())
