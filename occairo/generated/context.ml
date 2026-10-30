class type context_t = object
  (** {2:conversions Conversions} *)

  method as_context : Raw.Context.t
end

(* High-level class for Context *)
class context (obj : Raw.Context.t) : context_t =
  object (self)
    method as_context = obj
  end
