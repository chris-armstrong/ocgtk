class type context_t = object
  method as_context : Context.t
end

(* High-level class for Context *)
class context (obj : Context.t) : context_t =
  object (self)
    method as_context = obj
  end
